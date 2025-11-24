# Connectors handbook

This document describes how external sources should route requests into GitHub issues and projects. It is configuration-only—no secrets or runtime code live here. Emoji meanings inherit from the canonical workflow spec in [`BlackRoad-OS/blackroad-os/handbooks/workflows/emoji-workflows.md`](https://github.com/BlackRoad-OS/blackroad-os/blob/main/handbooks/workflows/emoji-workflows.md).

## How to use `registry/connectors.yml`

- Each entry defines a **source** (e.g., web form, inbox, API endpoint) and its target repo/project.
- Downstream services should read the YAML and create issues using the **🪧 Work Card** template referenced in the `template` field.
- Defaults such as status emoji or tags guide initial triage; teams can refine after creation.
- No credentials or tokens belong here. Keep secrets in a dedicated secrets manager (e.g., GitHub Actions secrets, Railway variables, or cloud secret stores).

## Implementation guidance for integrators

1. Load `registry/connectors.yml` at startup or on a schedule to keep routing rules current.
2. Map inbound payloads to the required fields in the Work Card template (title, requester, service line, etc.).
3. Apply the default status emoji (🟢 ready, 🆘 emergency, etc.) as defined per connector to align with Project views.
4. Use repository-specific labels (e.g., `incident`) from the registry entry to ensure cards flow into the right views and automations.
5. Log routing decisions for auditability; configuration changes here should be enough to adjust behavior without code changes elsewhere.

By keeping connectors declarative, teams can onboard new inputs quickly while staying aligned to the shared emoji workflow language.
