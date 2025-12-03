# Blackroad OS

This repository tracks the infrastructure scaffolding for the Blackroad OS services. Use it as the entry point for preparing deployments and coordinating moves of services into the `blackroad.*` domains.

## Deployment

- The Dockerfile targets Node 20 on Alpine Linux, enables `corepack`, installs dependencies with `pnpm` (falling back to `npm`), and tries to run common build/start commands.
- Railway is configured to deploy the container with a single replica, expose port `8080`, and serve health checks from `/health`.

## Domain transfer guidance

- All agents and supporting services—especially those built from exploratory or memory-leak mitigation work—should be migrated to live under `blackroad` domains.
- When moving a service, update any hard-coded URLs, environment variables, or callbacks to use the new domain names before deployment.
- Verify deployments against the health check (`/health`) after switching DNS to confirm the service is responding from the new domain.

## Next steps

- Add your application source (e.g., `index.js`/`server.js` and `package.json` scripts) to leverage the existing Docker and Railway configurations.
- Document any domain-specific environment variables in `railway.toml` so they are tracked alongside the deployment settings.
