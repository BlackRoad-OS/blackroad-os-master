# 🔁 BlackRoad OS Master – Workflows & Automations 🤖⚙️

> **The meta-brain for BlackRoad OS ecosystem workflows, automations, and governance** 🧠🕸️

This repository is the **central hub** for workflow definitions, automation templates, and conventions that enable **10,000 agents + 1 human** to collaborate seamlessly across the BlackRoad OS ecosystem.

---

## 🎯 Purpose

**BLACKROAD-OS-MASTER** defines:

- ✅ **GitHub Actions workflows** – Reusable CI/CD templates
- 🏷️ **Labels & conventions** – Standard categorization across repos
- 📋 **Issue/PR templates** – Consistent structure for all repos
- 🗺️ **Project management** – GitHub Projects configuration
- 🌿 **Branch & commit conventions** – Naming and format standards
- 👥 **CODEOWNERS specs** – Code review ownership patterns
- 🤖 **Agent workflows** – How AI agents coordinate work
- 📚 **Process documentation** – Coding, release, and incident workflows

**This is NOT:**
- ❌ An application runtime
- ❌ A place for secrets or credentials
- ❌ A code repository for services

Think of it as: **"BlackRoad OS Governance & Workflow Engine (Blueprint layer)"** 🧬

---

## 📁 Repository Structure

```
blackroad-os-master/
├── .github/
│   ├── workflows/              # Reusable workflow templates
│   │   ├── ci-template.yml     # Standard CI pipeline
│   │   ├── cd-template.yml     # Deployment workflow
│   │   ├── pr-lint.yml         # PR validation
│   │   └── project-sync.yml    # Project automation
│   ├── ISSUE_TEMPLATE/         # Issue templates
│   │   ├── feature.md          # Feature requests
│   │   ├── bug.md              # Bug reports
│   │   └── chore.md            # Maintenance tasks
│   └── PULL_REQUEST_TEMPLATE.md # PR template
├── workflows/                  # Workflow documentation
│   ├── coding-workflow.md      # Branches → PRs → Reviews → Merge
│   ├── release-workflow.md     # Versioning & releases
│   ├── incident-workflow.md    # Incident response
│   └── agent-workflows.md      # Agent coordination patterns
├── conventions/                # Standards & conventions
│   ├── branches.md             # Branch naming
│   ├── labels.md               # Label definitions
│   ├── commit-messages.md      # Commit format
│   └── codeowners-spec.md      # Code ownership
├── projects/                   # Project management
│   ├── blackroad-os-master-orchestration.md  # Main project board
│   └── fields-and-labels.md    # Field mappings
├── .cadlac/                    # Agent prompts
│   └── blackroad-os-master-workflows.prompt.md
└── README.md                   # This file
```

---

## 🚀 Quick Start

### For Humans 👨‍💻

1. **Read the workflows:**
   - [Coding Workflow](workflows/coding-workflow.md) – How to create branches, PRs, and merge
   - [Release Workflow](workflows/release-workflow.md) – How to version and release
   - [Incident Workflow](workflows/incident-workflow.md) – How to handle incidents

2. **Learn the conventions:**
   - [Branch Naming](conventions/branches.md) – `feature/api-new-endpoint`
   - [Commit Messages](conventions/commit-messages.md) – `feat(api): add new endpoint`
   - [Labels](conventions/labels.md) – `Team: API`, `Type: Feature`, etc.

3. **Use the templates:**
   - Copy workflows from `.github/workflows/` to your repo
   - Use issue templates from `.github/ISSUE_TEMPLATE/`
   - Follow PR template in `.github/PULL_REQUEST_TEMPLATE.md`

### For AI Agents 🤖

1. **Read the agent prompt:**
   - [System Prompt](.cadlac/blackroad-os-master-workflows.prompt.md) – Your role and responsibilities

2. **Study agent workflows:**
   - [Agent Workflows](workflows/agent-workflows.md) – Coordination patterns and best practices

3. **Follow conventions:**
   - Use same branch naming as humans
   - Follow same PR process
   - Respect labels and project fields
   - Update status as work progresses

---

## 📚 Core Documentation

### Workflow Documentation

| Document | Description |
|----------|-------------|
| [Coding Workflow](workflows/coding-workflow.md) | Complete process: branches → PRs → reviews → merge |
| [Release Workflow](workflows/release-workflow.md) | Versioning, tagging, and release process |
| [Incident Workflow](workflows/incident-workflow.md) | Incident detection, response, and post-mortems |
| [Agent Workflows](workflows/agent-workflows.md) | How agents discover work and coordinate |

### Conventions

| Document | Description |
|----------|-------------|
| [Branch Naming](conventions/branches.md) | `type/area-description` format |
| [Commit Messages](conventions/commit-messages.md) | Conventional Commits specification |
| [Labels](conventions/labels.md) | Canonical label set for all repos |
| [CODEOWNERS](conventions/codeowners-spec.md) | Code ownership and review patterns |

### Project Management

| Document | Description |
|----------|-------------|
| [Master Orchestration](projects/blackroad-os-master-orchestration.md) | GitHub Projects configuration |
| [Fields and Labels](projects/fields-and-labels.md) | Label → Field mappings |

---

## 🏷️ Standard Labels

All BlackRoad OS repositories should use these labels:

**Team Labels:**
- `Team: Core`, `Team: API`, `Team: Operator`, `Team: Web`, `Team: Prism Console`
- `Team: Infra`, `Team: Docs`, `Team: Research`, `Team: Brand`
- `Team: Packs – Education`, `Team: Packs – Infra DevOps`, etc.

**Type Labels:**
- `Type: Feature`, `Type: Bug`, `Type: Chore`, `Type: Docs`, `Type: Research`

**Status Labels:**
- `Status: New`, `Status: Ready`, `Status: In Progress`, `Status: Blocked`, `Status: Needs Review`

**Priority Labels:**
- `Priority: Critical`, `Priority: High`, `Priority: Medium`, `Priority: Low`

**Size Labels:**
- `Size: XS`, `Size: S`, `Size: M`, `Size: L`, `Size: XL`

**Agent Labels:**
- `Agent: Available`, `Agent: In Progress`, `Agent: Blocked`, `Agent: Human Required`

See [full label documentation](conventions/labels.md) for details.

---

## 🌿 Branch Naming Convention

```
<type>/<area>-<short-description>
```

**Examples:**
```
feature/api-agent-workflows
fix/operator-memory-leak
chore/web-update-dependencies
docs/api-authentication-guide
research/llm-routing-optimization
```

**Types:** `feature`, `fix`, `chore`, `docs`, `research`, `hotfix`, `release`

**Areas:** `core`, `api`, `operator`, `web`, `prism`, `infra`, `docs`, `brand`, `pack-*`

See [branch naming guide](conventions/branches.md) for full details.

---

## 📝 Commit Message Format

BlackRoad OS uses [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

**Examples:**
```
feat(api): add health check endpoint
fix(operator): resolve memory leak in scheduler
chore(deps): update express to v4.18.2
docs(core): clarify type system architecture
```

**Types:** `feat`, `fix`, `chore`, `docs`, `style`, `refactor`, `test`, `perf`, `ci`, `build`

See [commit message guide](conventions/commit-messages.md) for full specification.

---

## 🤖 GitHub Actions Workflows

### Reusable Templates

Copy these templates to your repository:

- **[ci-template.yml](.github/workflows/ci-template.yml)** – Standard CI pipeline (lint, test, build)
- **[cd-template.yml](.github/workflows/cd-template.yml)** – Deployment workflow
- **[pr-lint.yml](.github/workflows/pr-lint.yml)** – PR title and format validation
- **[project-sync.yml](.github/workflows/project-sync.yml)** – Auto-sync to GitHub Projects

### Usage

1. Copy template to your repo's `.github/workflows/` directory
2. Customize for your tech stack (uncomment relevant sections)
3. Update secrets in repository settings
4. Test with a PR

---

## 🗂️ GitHub Projects Integration

All issues and PRs automatically sync to the **BlackRoad OS – Master Orchestration** project.

**Project URL:** `https://github.com/orgs/BlackRoad-OS/projects/1`

**Auto-synced fields:**
- **Team** ← `Team: *` labels
- **Type** ← `Type: *` labels
- **Status** ← `Status: *` labels
- **Priority** ← `Priority: *` labels
- **Size** ← `Size: *` labels

See [project documentation](projects/blackroad-os-master-orchestration.md) for configuration details.

---

## 👥 Contributing

### Adding New Workflows

1. Create workflow file in `.github/workflows/`
2. Add documentation in `workflows/`
3. Update this README
4. Open PR with clear description

### Updating Conventions

1. Edit convention file in `conventions/`
2. Ensure consistency with other conventions
3. Update related documentation
4. Open PR for review

### Testing Workflows

1. Create test repository or use existing one
2. Copy workflow to test repo
3. Verify it works as expected
4. Document any prerequisites or setup

---

## 🔐 Security

**Important:** This repository contains workflow **templates**, not actual secrets.

✅ **DO:**
- Reference secrets as `secrets.SECRET_NAME`
- Reference env vars as `env.VAR_NAME`
- Document required secrets in workflow comments

❌ **DON'T:**
- Hardcode tokens, passwords, or API keys
- Commit actual secret values
- Include sensitive data in examples

If you find a secret accidentally committed, report it immediately.

---

## 📖 Additional Resources

### Internal Docs
- [System Prompt for Agents](.cadlac/blackroad-os-master-workflows.prompt.md)

### External Resources
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [GitHub Projects Documentation](https://docs.github.com/en/issues/planning-and-tracking-with-projects)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)

---

## 🎯 Goals

This repository enables:

1. ✅ **Consistency** – All repos follow same conventions
2. ✅ **Automation** – Workflows handle repetitive tasks
3. ✅ **Coordination** – Agents and humans work together smoothly
4. ✅ **Scalability** – Support 10,000 agents without chaos
5. ✅ **Visibility** – Clear view of work across ecosystem
6. ✅ **Quality** – Standardized review and testing processes

---

## 📞 Support

**Questions about workflows?** Open an issue with `Type: Question` label.

**Found a problem?** Open an issue with `Type: Bug` label.

**Have a suggestion?** Open an issue with `Type: Feature` label.

**Need help?** Tag `@blackroad-os/core-team` in your issue.

---

## 📜 License

See [LICENSE](LICENSE) file for details.

---

**Built with 💚 by the BlackRoad OS team**

*Enabling 10,000 agents + 1 human to build the future together* 🤖🧑‍💻✨