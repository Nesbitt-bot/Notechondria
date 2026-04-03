# Frontend split plan

This repository is moving from one Flutter app to three Flutter apps under `frontend/` while reusing code through `frontend/shared/`.

## Current state in this pass

- `frontend/shared/` contains extracted code copied from the legacy root frontend library.
- `frontend/editor_app/` starts the shared shell on the learner/editor surface.
- `frontend/planner_app/` starts the shared shell on the planning/course surface.
- `frontend/portal_app/` starts the shared shell on the auth/settings surface.
- The existing root frontend package is still present as the compatibility path and remains the only deployment path previously documented and partially verified.

## Intended ownership

- `editor_app`: learner note reading, editing, local drafts, import/export, note history, and related sync work.
- `planner_app`: front-page discovery, courses, subscriptions, activity, deadlines, and module discussions.
- `portal_app`: authentication, profile/settings, orchestration, and cross-app launch routing.

## Deployment implication

Separate Pages deploys are the target, but this pass only updates repository structure and documentation. It does not claim working Pages pipelines for each app yet.
