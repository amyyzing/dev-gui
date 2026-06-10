# Function index

Current live `page-1/qb-aim/logic.lua` function map.

## Shared helpers

- `flat`
- `distXZ`
- `unit`
- `clampMagnitude`
- `safeVectorLerp`
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
- `previewArcCFrame`
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
- `updateCatchAheadVisuals`
- `updatePeakHeightVisuals`
- `setCatchAhead`
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

- `originalC2Frame`
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
- `catchOffset`
- `targetAtTime`
- `requiredVelocityAt`
- `interceptValue`
- `speedErrorValue`
- `interceptCandidate`
- `betterIntercept`
- `refineInterceptTime`
- `refineMinimumTime`
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
- `api.SetCatchAhead`
- `api.SetPeakHeight`
- `api.Refresh`
- `api.Reset`
- `api.Destroy`
