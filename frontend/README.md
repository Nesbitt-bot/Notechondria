# Frontend split workspace

The repository now has an incremental split plan under `frontend/`:

- `shared/` — extracted shared Flutter shell, modules, helpers, and components
- `editor_app/` — thin app wrapper aimed at the legacy learner editor flow
- `planner_app/` — thin app wrapper for course/activity/front orchestration
- `portal_app/` — thin auth/settings/orchestration portal
- root `lib/`, `pubspec.yaml`, `Dockerfile`, and `docker-compose.yml` — legacy compatibility app kept in place during extraction

## Environment Variables Configuration

This project uses environment variables for API endpoints and feature flags. There are two ways to configure them:

### Option 1: GitHub Actions Secrets (Recommended for CI/CD)

For production deployments via GitHub Actions, set the following repository secrets:

1. Go to your repository settings → Secrets and variables → Actions
2. Add these secrets:
   - `FRONTEND_API_BASE_URL` — Backend API base URL (e.g., `https://api.example.com/api/v1`)
   - `FRONTEND_BACKEND_ORIGIN` — Backend origin for proxy configuration (e.g., `https://api.example.com`)
   - `DEPLOY_ENVIRONMENT` — Environment name (e.g., `production`, `staging`)

The workflows automatically inject these values during the build process.

### Option 2: Local Development with `.env` File

For local development, create a `.env` file in the root of each app directory:

```env
# frontend/editor_app/.env or frontend/planner_app/.env etc.
FRONTEND_API_BASE_URL=http://localhost:9090/api/v1
FRONTEND_BACKEND_ORIGIN=http://localhost:9090
DEPLOY_ENVIRONMENT=development
```

**Important Notes:**
- Never commit `.env` files to git (they are in `.gitignore`)
- Use `sample.env` as a template if available
- Environment variables must be absolute URLs for web builds
- For Docker deployments, use service names like `http://nginx` as the backend origin

### Building with Custom Environment

```bash
cd frontend/editor_app
flutter build web --release --base-href /editor/ \
  --dart-define=API_BASE_URL=$FRONTEND_API_BASE_URL \
  --dart-define=BACKEND_ORIGIN=$FRONTEND_BACKEND_ORIGIN
```

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

## CI/CD Status

Three independent GitHub Actions workflows are configured:
- `frontend-editor-pages.yml` — Builds and deploys editor to `/editor/`
- `frontend-planner-pages.yml` — Builds and deploys planner to `/planner/`
- `frontend-portal-pages.yml` — Builds and deploys portal to `/portal/`

All deployments go to the `gh-pages` branch as subpaths since GitHub Pages supports only one site per repository.

### Running workflows manually

Go to Actions tab → select workflow → "Run workflow" → choose branch.
