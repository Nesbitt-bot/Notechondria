# frontend/shared

This package is the extracted shared Flutter code from the legacy single-app frontend.

Current status:

- `lib/main.dart` is a direct extraction of the existing shell/library code.
- `lib/components/`, `lib/core/`, and `lib/modules/` still match the legacy structure.
- New app packages under `frontend/editor_app`, `frontend/planner_app`, and `frontend/portal_app` depend on this package.

This pass does not claim a clean runtime split yet. It creates a reusable package boundary first so the old root app can keep working while the new apps are extracted incrementally.
