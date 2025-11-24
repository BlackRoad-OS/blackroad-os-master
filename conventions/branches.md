# 🌿 Branch Naming Conventions – BlackRoad OS

This document defines the standard branch naming conventions for all BlackRoad OS repositories.

## Overview 🎯

Consistent branch naming helps humans and agents quickly understand the purpose of a branch and improves repository organization.

## Standard Format 📋

```
<type>/<area>-<short-description>
```

### Components

- **type** – The kind of change (feature, fix, chore, docs, research)
- **area** – The domain or component affected (core, api, operator, web, etc.)
- **short-description** – Brief description using kebab-case

## Branch Types 🏷️

### `feature/`
New features, enhancements, or capabilities

**Examples:**
```
feature/api-agent-workflows
feature/core-health-endpoint
feature/web-dashboard-redesign
feature/operator-auto-scaling
feature/prism-theme-switcher
```

**When to use:**
- Adding new functionality
- Implementing new API endpoints
- Building new UI components
- Adding new services

### `fix/`
Bug fixes, error corrections, issue resolutions

**Examples:**
```
fix/api-memory-leak
fix/operator-race-condition
fix/web-button-alignment
fix/core-null-pointer
fix/infra-deployment-timeout
```

**When to use:**
- Fixing bugs
- Resolving errors
- Correcting unexpected behavior
- Patching security vulnerabilities

### `chore/`
Maintenance, refactoring, dependencies, tooling

**Examples:**
```
chore/api-update-dependencies
chore/core-refactor-auth
chore/web-upgrade-react
chore/infra-terraform-cleanup
chore/operator-improve-logging
```

**When to use:**
- Updating dependencies
- Refactoring code
- Improving code quality
- Updating build tools
- Cleaning up technical debt

### `docs/`
Documentation changes only

**Examples:**
```
docs/api-endpoint-reference
docs/core-architecture-guide
docs/web-component-library
docs/operator-deployment-guide
docs/readme-quickstart
```

**When to use:**
- Writing new documentation
- Updating existing docs
- Adding code comments
- Creating tutorials
- Updating README

### `research/`
Experimental work, prototypes, investigations

**Examples:**
```
research/llm-routing-optimization
research/core-new-architecture
research/api-graphql-migration
research/web-3d-visualization
research/operator-kubernetes-integration
```

**When to use:**
- Prototyping new ideas
- Investigating technical approaches
- Experimenting with new technologies
- Proof-of-concept implementations
- Research and development

### `hotfix/`
Critical production fixes (from main or release branches)

**Examples:**
```
hotfix/1.2.1-security-patch
hotfix/api-critical-bug
hotfix/web-production-error
hotfix/operator-crash-fix
```

**When to use:**
- Critical production bugs
- Security vulnerabilities
- Data corruption issues
- Service outages

### `release/`
Release preparation (for coordinating large releases)

**Examples:**
```
release/v1.2.0
release/v2.0.0-beta
release/2024-11-release
```

**When to use:**
- Preparing major releases
- Coordinating multi-repo releases
- Final polish before release
- Release candidate testing

## Area Codes 🗺️

Areas correspond to teams and repositories:

### Core Areas
- `core` – blackroad-os-core (type system, shared logic)
- `api` – blackroad-os-api (HTTP API, REST endpoints)
- `operator` – blackroad-os-operator (orchestration, scheduling)
- `web` – blackroad-os-web (web frontend)
- `prism` – blackroad-os-prism-console (admin interface)

### Infrastructure
- `infra` – Infrastructure, deployment, DevOps
- `platform` – Platform-level changes

### Documentation & Research
- `docs` – Documentation across all projects
- `research` – Research and experimental work

### Brand & Content
- `brand` – Branding, design system, marketing
- `content` – Content creation, blog posts

### Packs (Domain-Specific)
- `pack-education` – Education pack
- `pack-infra-devops` – Infrastructure/DevOps pack
- `pack-finance` – Finance pack
- `pack-legal` – Legal pack
- `pack-creator` – Creator Studio pack

### Multi-Area
- `multi` – Changes affecting multiple areas
- `cross-repo` – Cross-repository changes

## Short Description Guidelines ✍️

### DO ✅
- Use **kebab-case** (lowercase with hyphens)
- Be **concise** (3-5 words max)
- Be **descriptive** (what, not how)
- Use **present tense** verbs
- Use **nouns** for features

**Good examples:**
```
feature/api-workflow-endpoints
fix/operator-memory-leak
chore/web-update-dependencies
docs/api-authentication-guide
```

### DON'T ❌
- Use spaces or underscores
- Use CamelCase or PascalCase
- Be too verbose
- Include issue numbers (use PR description instead)
- Use past tense

**Bad examples:**
```
feature/api_WorkflowEndpoints  ❌ (use kebab-case)
fix/operator fix memory leak   ❌ (no spaces)
chore/web-update-all-the-dependencies-to-latest-versions  ❌ (too long)
docs/API-Authentication        ❌ (use lowercase)
feature/api-issue-123          ❌ (don't include issue numbers)
```

## Special Cases 🔧

### Multi-Area Changes

When a change affects multiple areas:

```
feature/multi-agent-system
fix/cross-repo-auth-flow
chore/platform-upgrade-node
```

### User/Bot Prefixes

For team members or bots working on personal branches:

```
username/feature/api-experiment
agent-bot/fix/operator-auto-fix
copilot/feature/web-suggestion
```

### Temporary Branches

For very short-lived experiments (should be deleted quickly):

```
tmp/performance-test
tmp/debug-issue
tmp/quick-fix
```

**Note:** Avoid `tmp/` branches in shared repositories. Use local branches or forks.

## Branch Lifecycle 🔄

### Creating Branches

**From main:**
```bash
git checkout main
git pull origin main
git checkout -b feature/api-new-endpoint
```

**From another branch (rare):**
```bash
git checkout feature/api-base-work
git checkout -b feature/api-extended-work
```

### Pushing Branches

```bash
# First push
git push -u origin feature/api-new-endpoint

# Subsequent pushes
git push
```

### Deleting Branches

**After PR merge (automatic on GitHub):**
```bash
# Update local main
git checkout main
git pull origin main

# Delete local branch
git branch -d feature/api-new-endpoint
```

**Delete remote branch (if needed):**
```bash
git push origin --delete feature/api-new-endpoint
```

## Branch Protection 🛡️

### Protected Branches

The following branches should have protection rules:

- `main` – Primary branch
  - Require PR reviews
  - Require CI to pass
  - No force push
  - No deletions

- `release/*` – Release branches (if used)
  - Require PR reviews
  - Require CI to pass
  - No force push

### Unprotected Branches

- `feature/*` – Can be force-pushed during development
- `fix/*` – Can be force-pushed during development
- `chore/*` – Can be force-pushed during development
- `docs/*` – Can be force-pushed during development
- `research/*` – Can be force-pushed (experimental)

## Integration with GitHub 🔗

### Labels

Branch types should match issue/PR labels:

| Branch Type | PR Label |
|-------------|----------|
| `feature/` | `Type: Feature` |
| `fix/` | `Type: Bug` |
| `chore/` | `Type: Chore` |
| `docs/` | `Type: Docs` |
| `research/` | `Type: Research` |

### Automation

GitHub Actions can use branch names to:
- Auto-label PRs
- Trigger specific workflows
- Route to correct reviewers

**Example:**
```yaml
# .github/workflows/auto-label.yml
name: Auto Label PR

on:
  pull_request:
    types: [opened]

jobs:
  label:
    runs-on: ubuntu-latest
    steps:
      - name: Label based on branch
        uses: actions/github-script@v7
        with:
          script: |
            const branch = context.payload.pull_request.head.ref;
            let label = null;
            
            if (branch.startsWith('feature/')) label = 'Type: Feature';
            else if (branch.startsWith('fix/')) label = 'Type: Bug';
            else if (branch.startsWith('chore/')) label = 'Type: Chore';
            else if (branch.startsWith('docs/')) label = 'Type: Docs';
            
            if (label) {
              github.rest.issues.addLabels({
                owner: context.repo.owner,
                repo: context.repo.repo,
                issue_number: context.payload.pull_request.number,
                labels: [label]
              });
            }
```

## Examples by Repository 📚

### blackroad-os-core
```
feature/core-type-registry
fix/core-circular-dependency
chore/core-update-typescript
docs/core-architecture-overview
```

### blackroad-os-api
```
feature/api-agent-endpoints
fix/api-rate-limiting
chore/api-refactor-middleware
docs/api-openapi-spec
```

### blackroad-os-operator
```
feature/operator-auto-scaling
fix/operator-scheduler-race
chore/operator-improve-logging
docs/operator-configuration
```

### blackroad-os-web
```
feature/web-dashboard-widgets
fix/web-responsive-layout
chore/web-upgrade-nextjs
docs/web-component-guide
```

### blackroad-os-infra
```
feature/infra-monitoring-stack
fix/infra-terraform-state
chore/infra-update-github-actions
docs/infra-deployment-runbook
```

## Quick Reference Card 🎴

```
┌─────────────────────────────────────────┐
│ BlackRoad OS Branch Naming              │
├─────────────────────────────────────────┤
│ Format: type/area-description           │
│                                         │
│ Types:                                  │
│   feature/  – New features              │
│   fix/      – Bug fixes                 │
│   chore/    – Maintenance               │
│   docs/     – Documentation             │
│   research/ – Experiments               │
│   hotfix/   – Critical fixes            │
│   release/  – Release prep              │
│                                         │
│ Areas:                                  │
│   core, api, operator, web, prism       │
│   infra, docs, research, brand          │
│   pack-*, multi, cross-repo             │
│                                         │
│ Examples:                               │
│   feature/api-agent-workflows           │
│   fix/operator-memory-leak              │
│   chore/web-update-deps                 │
│   docs/api-auth-guide                   │
└─────────────────────────────────────────┘
```

---

**Related docs:**
- [Coding Workflow](../workflows/coding-workflow.md)
- [Commit Messages](./commit-messages.md)
- [Labels](./labels.md)
