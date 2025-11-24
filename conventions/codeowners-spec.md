# 👥 CODEOWNERS Specification – BlackRoad OS

This document defines the CODEOWNERS conventions for BlackRoad OS repositories.

## Overview 🎯

CODEOWNERS files automatically request reviews from specific people or teams when files are changed. This ensures domain experts review relevant changes.

## CODEOWNERS File Location 📁

Place CODEOWNERS in one of these locations (in priority order):
1. `.github/CODEOWNERS` (recommended)
2. `CODEOWNERS` (root)
3. `docs/CODEOWNERS`

**Recommendation:** Use `.github/CODEOWNERS` for consistency.

## Syntax 📝

```
# Comment line

# Pattern matching (like .gitignore)
pattern @owner

# Examples:
*.md @blackroad-os/docs-team
/src/api/ @blackroad-os/api-team
```

### Pattern Rules

- `*` – Matches any file
- `**` – Matches zero or more directories
- `?` – Matches one character
- `[abc]` – Matches character in brackets
- `#` – Comment line

### Owner Syntax

- `@username` – Individual user
- `@org/team` – GitHub team
- `user@example.com` – Email (fallback)

## Standard CODEOWNERS Structure 🏗️

### Template for BlackRoad OS Repos

```ruby
# BlackRoad OS CODEOWNERS
# This file defines code ownership and automatic review assignments

# =============================================================================
# Default Owners
# =============================================================================
# These owners will be requested for review for all files unless overridden

* @blackroad-os/core-team

# =============================================================================
# Documentation
# =============================================================================

# All documentation
*.md @blackroad-os/docs-team
/docs/ @blackroad-os/docs-team
README.md @blackroad-os/docs-team

# API documentation
/docs/api/ @blackroad-os/api-team @blackroad-os/docs-team

# =============================================================================
# Infrastructure & DevOps
# =============================================================================

# CI/CD workflows
/.github/workflows/ @blackroad-os/infra-team

# Docker files
Dockerfile @blackroad-os/infra-team
docker-compose.yml @blackroad-os/infra-team
.dockerignore @blackroad-os/infra-team

# Terraform / Infrastructure as Code
/terraform/ @blackroad-os/infra-team
/infra/ @blackroad-os/infra-team
*.tf @blackroad-os/infra-team

# Kubernetes
/k8s/ @blackroad-os/infra-team
*.yaml @blackroad-os/infra-team

# =============================================================================
# Configuration
# =============================================================================

# Environment configuration
.env.example @blackroad-os/infra-team
*.config.js @blackroad-os/infra-team
*.config.ts @blackroad-os/infra-team

# Package management
package.json @blackroad-os/core-team
package-lock.json @blackroad-os/core-team
pnpm-lock.yaml @blackroad-os/core-team
yarn.lock @blackroad-os/core-team
requirements.txt @blackroad-os/core-team
Cargo.lock @blackroad-os/core-team
go.mod @blackroad-os/core-team
go.sum @blackroad-os/core-team

# =============================================================================
# Security & Compliance
# =============================================================================

# Security-related files
/.github/workflows/security.yml @blackroad-os/security-team
/security/ @blackroad-os/security-team

# Dependency scanning
dependabot.yml @blackroad-os/security-team @blackroad-os/infra-team

# =============================================================================
# Application Code
# =============================================================================

# API code (example for blackroad-os-api)
/src/api/ @blackroad-os/api-team
/src/routes/ @blackroad-os/api-team
/src/middleware/ @blackroad-os/api-team
/src/controllers/ @blackroad-os/api-team

# Web frontend (example for blackroad-os-web)
/src/components/ @blackroad-os/web-team
/src/pages/ @blackroad-os/web-team
/src/styles/ @blackroad-os/web-team

# Operator (example for blackroad-os-operator)
/src/scheduler/ @blackroad-os/operator-team
/src/workers/ @blackroad-os/operator-team
/src/queue/ @blackroad-os/operator-team

# Core library (example for blackroad-os-core)
/src/types/ @blackroad-os/core-team
/src/utils/ @blackroad-os/core-team

# =============================================================================
# Tests
# =============================================================================

# Test files reviewed by same team as source code
*.test.ts @blackroad-os/core-team
*.spec.ts @blackroad-os/core-team
*.test.js @blackroad-os/core-team
*.spec.js @blackroad-os/core-team
/tests/ @blackroad-os/core-team

# Integration tests may need multiple reviewers
/tests/integration/ @blackroad-os/api-team @blackroad-os/operator-team

# =============================================================================
# Database & Migrations
# =============================================================================

/migrations/ @blackroad-os/api-team @blackroad-os/infra-team
/prisma/ @blackroad-os/api-team
/src/db/ @blackroad-os/api-team

# =============================================================================
# Special Files
# =============================================================================

# License and legal
LICENSE @blackroad-os/legal-team
CONTRIBUTING.md @blackroad-os/docs-team
CODE_OF_CONDUCT.md @blackroad-os/docs-team

# This file
.github/CODEOWNERS @blackroad-os/core-team
```

## Repository-Specific Examples 📚

### blackroad-os-api

```ruby
# Default: API team
* @blackroad-os/api-team

# Routes and endpoints
/src/routes/ @blackroad-os/api-team
/src/controllers/ @blackroad-os/api-team

# Agent-specific endpoints
/src/routes/agents/ @blackroad-os/api-team @blackroad-os/operator-team

# Authentication
/src/auth/ @blackroad-os/api-team @blackroad-os/security-team

# Database
/src/db/ @blackroad-os/api-team
/migrations/ @blackroad-os/api-team @blackroad-os/infra-team

# Infrastructure
/.github/workflows/ @blackroad-os/infra-team
/terraform/ @blackroad-os/infra-team

# Documentation
*.md @blackroad-os/docs-team
/docs/ @blackroad-os/docs-team
```

### blackroad-os-web

```ruby
# Default: Web team
* @blackroad-os/web-team

# Components
/src/components/ @blackroad-os/web-team

# Pages
/src/pages/ @blackroad-os/web-team

# API integration
/src/api/ @blackroad-os/web-team @blackroad-os/api-team

# Styles and design
/src/styles/ @blackroad-os/web-team @blackroad-os/brand-team

# Infrastructure
/.github/workflows/ @blackroad-os/infra-team
/next.config.js @blackroad-os/web-team @blackroad-os/infra-team

# Documentation
*.md @blackroad-os/docs-team
```

### blackroad-os-operator

```ruby
# Default: Operator team
* @blackroad-os/operator-team

# Scheduler
/src/scheduler/ @blackroad-os/operator-team

# Workers
/src/workers/ @blackroad-os/operator-team

# Queue management
/src/queue/ @blackroad-os/operator-team

# API integration
/src/api-client/ @blackroad-os/operator-team @blackroad-os/api-team

# Infrastructure
/.github/workflows/ @blackroad-os/infra-team
/k8s/ @blackroad-os/infra-team @blackroad-os/operator-team

# Documentation
*.md @blackroad-os/docs-team
```

### blackroad-os-infra

```ruby
# Default: Infra team
* @blackroad-os/infra-team

# Terraform
/terraform/ @blackroad-os/infra-team

# Kubernetes
/k8s/ @blackroad-os/infra-team

# CI/CD
/.github/workflows/ @blackroad-os/infra-team

# Monitoring
/monitoring/ @blackroad-os/infra-team

# Security
/security/ @blackroad-os/infra-team @blackroad-os/security-team

# Documentation
*.md @blackroad-os/docs-team @blackroad-os/infra-team
```

## Team Structure 👥

### GitHub Teams

Create these teams in the BlackRoad-OS organization:

**Core Teams:**
- `@blackroad-os/core-team` – Core library maintainers
- `@blackroad-os/api-team` – API developers
- `@blackroad-os/operator-team` – Operator developers
- `@blackroad-os/web-team` – Frontend developers
- `@blackroad-os/prism-team` – Prism console developers

**Supporting Teams:**
- `@blackroad-os/infra-team` – Infrastructure & DevOps
- `@blackroad-os/docs-team` – Documentation writers
- `@blackroad-os/security-team` – Security experts
- `@blackroad-os/brand-team` – Design & branding
- `@blackroad-os/research-team` – Research & experiments

**Domain Packs:**
- `@blackroad-os/pack-education` – Education pack
- `@blackroad-os/pack-infra-devops` – Infra/DevOps pack
- `@blackroad-os/pack-finance` – Finance pack
- `@blackroad-os/pack-legal` – Legal pack
- `@blackroad-os/pack-creator` – Creator Studio pack

**Special Teams:**
- `@blackroad-os/maintainers` – Repository maintainers
- `@blackroad-os/admins` – Organization admins

## Review Requirements 🔍

### Number of Reviewers

Configure in branch protection rules:

**Recommended settings:**
- **Default:** 1 required review
- **Critical files:** 2 required reviews
- **Security:** 2 required reviews (including security team)

**Example critical files:**
- `/src/auth/`
- `/migrations/`
- `/.github/workflows/`
- `/terraform/`
- `/k8s/`

### Auto-Request Reviews

When CODEOWNERS is set up:
1. PR opened
2. GitHub automatically requests reviews from owners
3. At least one owner must approve
4. PR can be merged

### Dismissing Reviews

When CODEOWNERS file changes:
- Stale reviews can be dismissed
- Re-request reviews from new owners

## Best Practices ✅

### DO ✅
- **Keep patterns specific** – More specific patterns override general ones
- **Use teams, not individuals** – Teams are easier to manage
- **Document teams** – Explain what each team owns
- **Test CODEOWNERS** – Verify auto-requests work
- **Update regularly** – Keep in sync with team changes
- **Use for critical files** – Especially security, infra, migrations

### DON'T ❌
- **Over-assign** – Too many reviewers slow down PRs
- **Under-assign** – Critical code needs reviews
- **Use stale teams** – Remove inactive team members
- **Forget wildcards** – Use `*` for broad coverage
- **Ignore order** – Last matching pattern wins

## Testing CODEOWNERS 🧪

### Validate Syntax

Use GitHub's CODEOWNERS validator:

```bash
# Install
npm install -g codeowners

# Validate
codeowners .github/CODEOWNERS
```

### Test Review Requests

1. Create test PR
2. Verify correct teams/users are requested
3. Adjust patterns if needed

### GitHub CLI

```bash
# Check who owns a file
gh api repos/BlackRoad-OS/blackroad-os-api/codeowners/errors
```

## Automation 🤖

### Auto-Assign Reviewers

CODEOWNERS automatically assigns reviewers, but you can enhance with workflows:

```yaml
# .github/workflows/auto-assign.yml
name: Auto Assign Reviewers

on:
  pull_request:
    types: [opened, ready_for_review]

jobs:
  assign:
    runs-on: ubuntu-latest
    steps:
      - name: Auto-assign based on files
        uses: kentaro-m/auto-assign-action@v1.2.5
        with:
          repo-token: ${{ secrets.GITHUB_TOKEN }}
```

### Notify on Critical Files

```yaml
# .github/workflows/notify-critical.yml
name: Notify Critical Changes

on:
  pull_request:
    paths:
      - '.github/workflows/**'
      - 'terraform/**'
      - 'migrations/**'

jobs:
  notify:
    runs-on: ubuntu-latest
    steps:
      - name: Notify security team
        run: |
          echo "Critical files changed, notifying security team"
          # Send Slack message, email, etc.
```

## Fallback Strategies 🔄

If CODEOWNERS team member is unavailable:

1. **Team hierarchy** – Escalate to team lead
2. **Backup reviewers** – List alternative reviewers
3. **Auto-merge rules** – For low-risk changes
4. **Time-based approval** – Auto-approve after X days (rare)

**Example with fallback:**
```ruby
# Primary owners
/src/api/ @blackroad-os/api-team

# Fallback: any core team member can approve if API team unavailable
/src/api/ @blackroad-os/core-team
```

## Special Cases 🔧

### Monorepo

For monorepos with multiple projects:

```ruby
# Project A
/apps/project-a/ @blackroad-os/team-a

# Project B
/apps/project-b/ @blackroad-os/team-b

# Shared packages
/packages/ @blackroad-os/core-team

# Specific shared package
/packages/ui/ @blackroad-os/web-team
```

### External Contributors

For open-source repos with external contributors:

```ruby
# Core team reviews all changes
* @blackroad-os/core-team

# But allow external contributions without required reviews for docs
*.md
```

### Bot PRs

Exclude bot PRs from CODEOWNERS:
- Dependabot PRs: Configure auto-merge for low-risk updates
- Agent PRs: Require human review (use CODEOWNERS)

---

**Related docs:**
- [Coding Workflow](../workflows/coding-workflow.md)
- [Labels](./labels.md)
- [GitHub Teams Documentation](https://docs.github.com/en/organizations/organizing-members-into-teams)
