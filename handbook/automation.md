# Automation handbook

Automations in this repository describe **policy**, not code. Scripts, bots, or GitHub Actions in other repos should read these configurations and act accordingly. Emoji meanings come from the canonical spec in [`BlackRoad-OS/blackroad-os/handbooks/workflows/emoji-workflows.md`](https://github.com/BlackRoad-OS/blackroad-os/blob/main/handbooks/workflows/emoji-workflows.md), so automation logic should treat emojis as first-class signals.

## Principles

- **Signal-driven:** Status emojis like 🔴 (blocked) or 🤔 (needs clarification) drive routing and notifications.
- **Declarative:** `registry/automations.yml` captures triggers and actions in YAML; downstream code should interpret, not redefine, these policies.
- **Safe by default:** No secrets live here. Automations reference repositories, labels, and templates only.

## Using `registry/automations.yml`

1. Load the YAML file and evaluate triggers (connector tags, project status emojis, etc.).
2. When conditions match, perform the referenced actions: create a 🪧 Work Card, add labels, or notify channels.
3. Keep runtime credentials in secure storage; this repo should remain safe to publish.
4. When updating automation behavior, change this YAML first so every agent and human can review the policy before code ships.

## Common patterns

- **Incident intake:** 🆘 status plus `incident` label should escalate and notify ops.
- **Blocked flow:** 🔴 or 🛑 statuses should add a `blocked` label and alert owners.
- **Clarification loop:** 🤔 status should move cards to the “Needs Clarification” view and ping product or requester roles.

Automations stay predictable when every repo and service respects the same emoji language and templates defined here.
