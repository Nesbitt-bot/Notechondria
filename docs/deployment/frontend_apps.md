# Frontend app deployment notes

Target shape:

- `frontend/editor_app`
- `frontend/planner_app`
- `frontend/portal_app`

Shared code is in `frontend/shared`.

## Verified in this pass

- directory scaffolding exists
- each app has a `pubspec.yaml`, `lib/main.dart`, and README
- shared package extraction exists

## Not verified in this pass

- individual Flutter build output per app
- GitHub Pages or Cloudflare Pages publish configuration per app
- Jenkins automation for three separate frontend builds

## CI/CD note

The repository still has one legacy frontend Docker/Jenkins path at the root `frontend/` package. Keep treating that as the compatibility build until the three-app pipeline is wired and verified.
