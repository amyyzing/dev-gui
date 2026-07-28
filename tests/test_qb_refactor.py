import math
import random
import re
import unittest
from pathlib import Path

import numpy as np


ROOT = Path(__file__).resolve().parents[1]
MIN_TIME = 0.35
MAX_TIME = 6.0


def polynomial_value(coefficients, time, counter=None):
    if counter is not None:
        counter[0] += 1
    c0, c1, c2, c3, c4 = coefficients
    return ((((c4 * time + c3) * time + c2) * time + c1) * time + c0)


def polynomial_derivative(coefficients, time):
    _, c1, c2, c3, c4 = coefficients
    return ((4 * c4 * time + 3 * c3) * time + 2 * c2) * time + c1


def polynomial_second_roots(coefficients):
    _, _, c2, c3, c4 = coefficients
    a, b, c = 12 * c4, 6 * c3, 2 * c2
    if abs(a) <= 1e-12:
        return [] if abs(b) <= 1e-12 else [-c / b]
    disc = b * b - 4 * a * c
    if disc < -1e-12:
        return []
    if abs(disc) <= 1e-12:
        return [-b / (2 * a)]
    root = math.sqrt(max(0.0, disc))
    return [(-b - root) / (2 * a), (-b + root) / (2 * a)]


def bisect_function(function, low, high, steps=48):
    low_value = function(low)
    for _ in range(steps):
        mid = (low + high) * 0.5
        mid_value = function(mid)
        if (low_value < 0 < mid_value) or (mid_value < 0 < low_value):
            high = mid
        else:
            low, low_value = mid, mid_value
    return (low + high) * 0.5


def refine_polynomial_root(coefficients, low, high, counter, steps=18):
    low_value = polynomial_value(coefficients, low, counter)
    high_value = polynomial_value(coefficients, high, counter)
    current = (low + high) * 0.5
    for _ in range(steps):
        value = polynomial_value(coefficients, current, counter)
        if abs(value) <= 1e-7:
            return current
        if low_value * value < 0:
            high, high_value = current, value
        else:
            low, low_value = current, value

        derivative = polynomial_derivative(coefficients, current)
        next_time = current - value / derivative if abs(derivative) > 1e-9 else None
        if next_time is None or not low < next_time < high:
            next_time = (low + high) * 0.5
        current = next_time
    return low if abs(low_value) < abs(high_value) else high


def refined_roots(coefficients, counter=None):
    # Mirror the Luau solver's fixed coarse-probe cost.
    for index in range(33):
        polynomial_value(coefficients, MIN_TIME + (MAX_TIME - MIN_TIME) * index / 32, counter)

    derivative_partitions = [MIN_TIME, MAX_TIME]
    derivative_partitions.extend(
        root
        for root in polynomial_second_roots(coefficients)
        if MIN_TIME < root < MAX_TIME
    )
    derivative_partitions.sort()

    stationary = []
    derivative = lambda time: polynomial_derivative(coefficients, time)
    for low, high in zip(derivative_partitions, derivative_partitions[1:]):
        low_value, high_value = derivative(low), derivative(high)
        if abs(low_value) <= 1e-8:
            stationary.append(low)
        if abs(high_value) <= 1e-8:
            stationary.append(high)
        if low_value * high_value < 0:
            stationary.append(bisect_function(derivative, low, high))

    partitions = [MIN_TIME]
    for value in sorted(stationary):
        if MIN_TIME + 1e-7 < value < MAX_TIME - 1e-7:
            if not partitions or abs(partitions[-1] - value) > 1e-6:
                partitions.append(value)
    partitions.append(MAX_TIME)

    value = lambda time: polynomial_value(coefficients, time, counter)
    roots = []
    for point in partitions:
        if abs(value(point)) <= 1e-5:
            roots.append(point)
    for low, high in zip(partitions, partitions[1:]):
        if value(low) * value(high) < 0:
            roots.append(refine_polynomial_root(coefficients, low, high, counter))

    roots.sort()
    deduped = []
    for root in roots:
        if not deduped or abs(deduped[-1] - root) > 1e-5:
            deduped.append(root)
    return deduped


def exact_real_roots(coefficients):
    c0, c1, c2, c3, c4 = coefficients
    roots = np.roots([c4, c3, c2, c1, c0])
    real = sorted(
        float(root.real)
        for root in roots
        if abs(root.imag) <= 1e-6 and MIN_TIME <= root.real <= MAX_TIME
    )
    deduped = []
    for root in real:
        if not deduped or abs(deduped[-1] - root) > 1e-5:
            deduped.append(root)
    return deduped


def physical_coefficients(rng):
    origin = np.array([rng.uniform(-60, 60), rng.uniform(3, 9), rng.uniform(-60, 60)])
    receiver = np.array([rng.uniform(-90, 90), rng.uniform(10, 18), rng.uniform(-90, 90)])
    receiver_velocity = np.array([rng.uniform(-21, 21), 0.0, rng.uniform(-21, 21)])
    qb_velocity = np.array([rng.uniform(-21, 21), 0.0, rng.uniform(-21, 21)])
    speed = rng.uniform(70, 100)
    inheritance = rng.uniform(0, 0.35)
    lead_delay = rng.uniform(0, 0.8)
    gravity = np.array([0.0, -28.0, 0.0])
    a = receiver + receiver_velocity * lead_delay - origin
    b = receiver_velocity - qb_velocity * inheritance
    c = -0.5 * gravity
    return (
        float(a @ a),
        float(2 * (a @ b)),
        float((b @ b) + 2 * (a @ c) - speed * speed),
        float(2 * (b @ c)),
        float(c @ c),
    )


class BallisticRootTests(unittest.TestCase):
    def test_randomized_physical_quartics_match_exact_roots(self):
        rng = random.Random(6737)
        maximum_error = 0.0
        for _ in range(1000):
            coefficients = physical_coefficients(rng)
            expected = exact_real_roots(coefficients)
            actual = refined_roots(coefficients)
            self.assertEqual(len(actual), len(expected), coefficients)
            for found, exact in zip(actual, expected):
                maximum_error = max(maximum_error, abs(found - exact))
        self.assertLess(maximum_error, 1e-5)

    def test_tangent_root_is_not_lost(self):
        # (t - 2)^2 * (t^2 + 1)
        coefficients = (4.0, -4.0, 5.0, -4.0, 1.0)
        roots = refined_roots(coefficients)
        self.assertEqual(len(roots), 1)
        self.assertAlmostEqual(roots[0], 2.0, places=6)

    def test_scalar_work_is_bounded(self):
        rng = random.Random(495)
        counts = []
        for _ in range(100):
            counter = [0]
            refined_roots(physical_coefficients(rng), counter)
            counts.append(counter[0])
        self.assertLess(sum(counts) / len(counts), 80)


class IntegrationContractTests(unittest.TestCase):
    def test_fused_bootstrap_has_default_credential(self):
        source = (ROOT / "main.lua").read_text(encoding="utf-8")
        self.assertIn("GUI_BOOT_CONFIG", source)
        self.assertNotIn('local loaderPath="loader.lua"', source)
        self.assertIn('config.ApiKey or config.Key or "mydayohmy"', source)
        self.assertLess(source.index("local chunks={}"), source.index("for _,path in ipairs(runtimeFiles) do\n\tlocal chunk=chunks[path]"))

    def test_shared_interception_module_is_registered_and_consumed(self):
        loader = (ROOT / "runtime" / "loader-part-1.lua").read_text(encoding="utf-8")
        context = (ROOT / "runtime" / "loader-part-2.lua").read_text(encoding="utf-8")
        production = (ROOT / "features" / "qb-aim" / "logic.lua").read_text(encoding="utf-8")
        testing = (ROOT / "features" / "testing" / "logic.lua").read_text(encoding="utf-8")
        self.assertIn('QBInterception="features/qb-aim/interception.lua"', loader)
        self.assertLess(loader.index('"QBInterception","QBAimMath"'), loader.index('"QBAimMath","QBAimLogic"'))
        self.assertIn("QBInterceptionModule=QBInterceptionModule", context)
        self.assertIn("interceptionCore.Evaluate", production)
        self.assertIn("interceptionCore.Evaluate", testing)


if __name__ == "__main__":
    unittest.main()
