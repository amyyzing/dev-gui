import math
import random
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def source(path):
    return (ROOT / path).read_text(encoding="utf-8")


def add(a, b):
    return tuple(x + y for x, y in zip(a, b))


def subtract(a, b):
    return tuple(x - y for x, y in zip(a, b))


def multiply(vector, scalar):
    return tuple(value * scalar for value in vector)


def magnitude(vector):
    return math.sqrt(sum(value * value for value in vector))


def unit(vector):
    return multiply(vector, 1 / magnitude(vector))


class SafeArcContracts(unittest.TestCase):
    def test_ball_is_a_point_against_exact_catchbox_dimensions(self):
        interception = source("features/qb-aim/interception.lua")
        self.assertNotIn("ballRadius", interception)
        self.assertIn(
            "return halfWidth,-halfHeight,halfHeight",
            interception,
        )
        self.assertIn("verticalSlack=0,", interception)
        self.assertNotIn("math.max(\n\t\tdefender.catchRadius", interception)
        self.assertIn("local minY=position.Y+jumpOffset+lowerOffset", interception)
        self.assertIn("local maxY=position.Y+jumpOffset+upperOffset", interception)

    def test_testing_reads_only_the_active_games_visual_arc(self):
        testing = source("features/testing/logic.lua")
        self.assertIn("local function readVisualThrowArcState()", testing)
        self.assertIn('center:FindFirstChild("ThrowingArc",true)', testing)
        self.assertIn("local gameID=gameIDOf(localPlayer)", testing)
        self.assertIn("local arc=readVisualThrowArcState() or CurrentThrowArcState", testing)
        self.assertNotIn("local db=opponent and isDB", testing)

    def test_production_colors_use_the_rendered_beam_duration(self):
        logic = source("features/qb-aim/logic.lua")
        self.assertIn(
            "updateArcSafetyColor(beam,unsafe,interceptInfo,previewTime)",
            logic,
        )
        self.assertNotIn(
            "updateArcSafetyColor(beam,unsafe,interceptInfo,catchTime)",
            logic,
        )

    def test_unsafe_arc_recolors_the_whole_beam(self):
        production = source("features/qb-aim/logic.lua")
        testing = source("features/testing/logic.lua")
        self.assertIn("WholeBeamWarning=true,", production)
        self.assertIn(
            "info and info.windows or nil,\n\t\t\t\tarc.flightTime,\n\t\t\t\ttrue",
            testing,
        )

    def test_safe_arc_does_not_add_unrelated_release_stability_gates(self):
        logic = source("features/qb-aim/logic.lua")
        self.assertNotIn('return nil,"receiver too uncertain"', logic)
        self.assertNotIn('return nil,"timing unstable"', logic)
        self.assertIn("if trajectoryCanBeDefended(plan,receiver) then", logic)

    def test_safe_arc_is_an_arrival_race_using_catchbox_dimensions(self):
        logic = source("features/qb-aim/logic.lua")
        self.assertIn("local catchBox=getPlayerCatchVolume(player)", logic)
        self.assertIn(
            "interceptionCore.FindWindows(arc,{receiverParticipant})",
            logic,
        )
        self.assertIn("if window.startTime<=receiverStartTime then", logic)
        self.assertIn('reason="receiver_first"', logic)


class EspCatchBoxContracts(unittest.TestCase):
    def test_open_closed_esp_subtracts_catchbox_extent_from_point_distance(self):
        for path in ("features/esp-offense/logic.lua", "features/esp-defense/logic.lua"):
            logic = source(path)
            self.assertIn("local function getPlayerCatchBox(player)", logic)
            self.assertIn("math.max(size.X,size.Z)*0.5", logic)
            self.assertIn("Magnitude-catchRadius", logic)
            self.assertIn("ballPosition.Y>catchY+catchHeightTolerance", logic)
            self.assertNotIn("interceptionCore.Evaluate", logic)


class VisualBeamReconstructionTests(unittest.TestCase):
    def test_game_beam_control_points_recover_flight_time_and_velocity(self):
        rng = random.Random(28)
        gravity = (0.0, -28.0, 0.0)
        maximum_error = 0.0

        for _ in range(1000):
            velocity = (
                rng.uniform(-90, 90),
                rng.uniform(-10, 70),
                rng.uniform(-90, 90),
            )
            origin = (
                rng.uniform(-20, 20),
                rng.uniform(2, 10),
                rng.uniform(-20, 20),
            )
            flight_time = rng.uniform(0.35, 6.0)
            end = add(
                add(origin, multiply(velocity, flight_time)),
                multiply(gravity, 0.5 * flight_time * flight_time),
            )

            second_control = subtract(
                end,
                multiply(
                    add(
                        multiply(gravity, flight_time * flight_time),
                        multiply(velocity, flight_time),
                    ),
                    1 / 3,
                ),
            )
            first_control = subtract(
                multiply(
                    subtract(
                        add(
                            add(
                                multiply(gravity, 0.125 * flight_time * flight_time),
                                multiply(velocity, 0.5 * flight_time),
                            ),
                            origin,
                        ),
                        multiply(add(origin, end), 0.125),
                    ),
                    1 / 0.375,
                ),
                second_control,
            )

            curve_zero = magnitude(subtract(first_control, origin))
            axis_zero = unit(subtract(first_control, origin))
            curve_one = -magnitude(subtract(second_control, end))
            axis_one = unit(subtract(second_control, end))
            reconstructed_first = add(origin, multiply(axis_zero, curve_zero))
            reconstructed_second = subtract(end, multiply(axis_one, curve_one))
            acceleration = multiply(
                subtract(
                    subtract(end, reconstructed_second),
                    subtract(reconstructed_first, origin),
                ),
                3,
            )
            recovered_time = math.sqrt(acceleration[1] / gravity[1])
            recovered_velocity = multiply(
                subtract(reconstructed_first, origin),
                3 / recovered_time,
            )

            maximum_error = max(
                maximum_error,
                abs(recovered_time - flight_time),
                magnitude(subtract(recovered_velocity, velocity)),
            )

        self.assertLess(maximum_error, 1e-9)


if __name__ == "__main__":
    unittest.main()
