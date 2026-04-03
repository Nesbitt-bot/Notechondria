# Frontend app deployment notes

Target shape:

- `frontend/editor_app`
- `frontend/planner_app`
- `frontend/portal_app`

Shared code is in `frontend/shared`.

## CI/CD direction

Jenkins is now backend-only.

Frontend CI/CD is wired through GitHub Actions workflows:
- `.github/workflows/frontend-editor-pages.yml`
- `.github/workflows/frontend-planner-pages.yml`
- `.github/workflows/frontend-portal-pages.yml`

Because one GitHub repository exposes one Pages site, the current implementation deploys the three frontends independently into subpaths on a shared `gh-pages` branch:
- `/editor/`
- `/planner/`
- `/portal/`

This keeps the frontend pipelines separated even though the final hosting surface is one Pages site with three paths.

## Verified in this pass

- directory scaffolding exists
- each app has a `pubspec.yaml`, `lib/main.dart`, and README
- shared package extraction exists
- GitHub Actions workflow files exist for 3 frontend deploy paths
- Jenkinsfile is reduced to backend-only stages

## Not verified in this pass

- individual Flutter build output per app on this local machine
- successful GitHub Pages publish from Actions
- runtime validation of the three deployed frontends
