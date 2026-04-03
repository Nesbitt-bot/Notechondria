# Frontend split workspace

The repository now has an incremental split plan under `frontend/`:

- `shared/` — extracted shared Flutter shell, modules, helpers, and components
- `editor_app/` — thin app wrapper aimed at the legacy learner editor flow
- `planner_app/` — thin app wrapper for course/activity/front orchestration
- `portal_app/` — thin auth/settings/orchestration portal
- root `lib/`, `pubspec.yaml`, `Dockerfile`, and `docker-compose.yml` — legacy compatibility app kept in place during extraction

## Mapping from old modules

Legacy module | Target app in this split
--- | ---
`modules/learner.dart` | `editor_app`
`modules/course.dart` | `planner_app` first, with portal hooks for auth/subscription surfaces
`modules/activity.dart` | `planner_app`
`modules/front.dart` | `planner_app` for planning discovery, with selected auth/orchestration surfaces later reachable from `portal_app`
`modules/settings.dart` | `portal_app`

## Current verification status

This pass extracts shared code and creates app package boundaries. It does **not** claim that each new app is fully isolated or production-ready yet. The legacy root frontend remains the compatibility runtime until the split is verified further.
