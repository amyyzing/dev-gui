# Function index

Current live `features/qb-aim/logic.lua` function map after restoring the pre-Catch-Ahead QB aim version.

## Shared helpers

- `flat`
- `distXZ`
- `unit`
- `clampMagnitude`
- `smoothstep`
- `safeVectorLerp`
- `leadDelayForFlightTime`
- `routeSpeed`
- `root`
- `getModeKey`
- `getHeldBall`
- `getPlayerTeamID`
- `isValidGameTeamID`
- `isSameTeam`
- `getGameReEvent`
- `getFirstChildFolder`
- `getFirstGame`
- `getFirstMiniGame`
- `localFolder`
- `originalCenter`
- `attachmentCFrame`
- `setAttachmentCFrame`
- `xAxisCFrame`
- `prepPreviewObject`
- `getFirstMiniGameFolder`
- `getSquadsReEvent`
- `getGlobalMechanics`
- `findThrowAnimation`
- `playLocalThrowAnimation`
- `playThrowAnimation`

## QB Aim lifecycle and UI

- `QBAim.new`
- `destroyControl`
- `addConnection`
- `clearHeldBallCache`
- `getCachedHeldBall`
- `getCachedPlayers`
- `changed`
- `isAlive`
- `currentModeKey`
- `isAvailable`
- `setTargetText`
- `updateLeadDelayVisuals`
- `updatePeakHeightVisuals`
- `setLeadDelay`
- `setPeakHeight`
- `canTargetReceiver`
- `getQBAimHighlight`
- `ensureQBAimHighlight`
- `destroyQBAimHighlight`
- `clearTargetHighlights`
- `ensureReceiverData`
- `configuredBinding`
- `bindingMatches`
- `syncControls`

## Arc and release reference

- `c2Y`
- `setPreviewCenterVisible`
- `destroyPreviewCenter`
- `bindArcRigParts`
- `arcRig`
- `ensureC1Marker`
- `cleanupC3InfoGui`
- `updateC1AndC3Info`
- `hideC1AndC3Info`
- `hideQBTrailPreview`
- `clearPreviewVisuals`
- `previewPlan`

## Prediction and projectile math

- `leastSquaresVelocity`
- `currentReceiverRawVelocity`
- `routeVelocity`
- `receiverMaxAt`
- `qbYCorrection`
- `origin`
- `ballAt`
- `landing`
- `targetAtTime`
- `interceptValue`
- `interceptCandidate`
- `betterIntercept`
- `refineInterceptTime`
- `solve`

## Throw flow

- `currentBallPower`
- `hasHeldBallForPreview`
- `clearPreviewForMissingBall`
- `freezePreviewAtCurrentPlan`
- `buildPlan`
- `buildReleasePlan`
- `fireGameplayThrow`
- `fireSquadsThrow`
- `throwTo`
- `lockReceiverUnderCursor`
- `setEnabled`
- `handleQBAimInput`

## Public API methods

- `api.SetQBAimState`
- `api.SetTeamFilterState`
- `api.SetShowArcState`
- `api.SetLeadDelay`
- `api.SetPeakHeight`
- `api.Refresh`
- `api.Reset`
- `api.Destroy`
