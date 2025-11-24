# BlackRoad OS – Master Orchestration Hub

This repository is the control tower for BlackRoad OS projects, connectors, and automations. It holds human-readable configuration, templates, and registry files that downstream tools and repos can consume. There is no application code here—only the documentation and config needed to keep projects consistent across the organization.

## Source of truth for emoji workflows

All status, document, and human/agent emoji meanings are defined once in [`BlackRoad-OS/blackroad-os/handbooks/workflows/emoji-workflows.md`](https://github.com/BlackRoad-OS/blackroad-os/blob/main/handbooks/workflows/emoji-workflows.md). Do not invent new meanings locally; instead, inherit the canonical definitions and reuse them in every template and project description.

## Repository layout

- `handbook/` – human-facing guidance for projects, connectors, and automation policies.
- `templates/` – issue and project templates that apply the emoji workflow language.
- `registry/` – YAML registries for projects, connectors, and automation blueprints (no secrets).
- `PROMPTS/` – prompt packages for agents and copilots, including the Cadillac Hub prompt.

## How to use this repo

1. Copy the issue and project templates into new repos or GitHub Project settings.
2. Reference the registries when wiring connectors or automation scripts—treat these files as configuration inputs, not code.
3. Keep secrets and credentials in your preferred secrets manager; this repo should remain safe to share publicly.

## Relationship to other BlackRoad OS repos

- Emoji workflow language, standard fields, and team definitions live in `blackroad-os` and are imported here by reference.
- Runtime agents and scripts (e.g., Slack bots, incident pipelines) should be housed in operational repos like `blackroad-os-operator` while reading configuration from this hub.

By keeping this repository simple and declarative, every human and agent can understand the operating model in a few minutes and ship changes without duplicating logic.
