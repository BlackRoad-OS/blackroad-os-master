# 📝 Commit Message Conventions – BlackRoad OS

This document defines the commit message conventions for all BlackRoad OS repositories.

## Overview 🎯

Clear commit messages help humans and agents understand the history of a project, enable automated changelog generation, and improve collaboration.

## Standard Format 📋

BlackRoad OS follows the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### Components

- **type** – The kind of change (feat, fix, chore, etc.)
- **scope** – The area affected (optional but recommended)
- **description** – Brief summary (max 72 characters)
- **body** – Detailed explanation (optional)
- **footer** – References, breaking changes (optional)

## Commit Types 🏷️

### `feat` – Features
New functionality or capabilities

**Examples:**
```
feat(api): add agent workflow orchestration endpoints
feat(core): implement type registry system
feat(web): add dashboard widget system
feat(operator): add auto-scaling support
```

**Note:** For breaking changes, add `!` after type/scope: `feat(api)!: ...`

### `fix` – Bug Fixes
Corrections to existing functionality

**Examples:**
```
fix(operator): resolve memory leak in scheduler
fix(api): handle null values in agent status
fix(web): correct button alignment on mobile
fix(core): prevent circular dependencies
```

### `chore` – Maintenance
Routine tasks, dependencies, tooling

**Examples:**
```
chore(api): update express to v4.18.2
chore(web): upgrade React to v18.2.0
chore(infra): update Terraform providers
chore: update .gitignore for IDE files
```

### `docs` – Documentation
Documentation-only changes

**Examples:**
```
docs(api): add authentication guide
docs(core): update architecture overview
docs: fix typo in README
docs(web): add component library examples
```

### `style` – Code Style
Formatting, whitespace, linting (no logic changes)

**Examples:**
```
style(api): format code with prettier
style(core): fix linting errors
style: add missing semicolons
```

### `refactor` – Refactoring
Code restructuring without changing behavior

**Examples:**
```
refactor(operator): extract scheduler logic to separate module
refactor(api): simplify middleware chain
refactor(core): use composition over inheritance
```

### `test` – Tests
Adding or updating tests

**Examples:**
```
test(api): add integration tests for agent endpoints
test(core): add unit tests for type registry
test(operator): add load tests for scheduler
```

### `perf` – Performance
Performance improvements

**Examples:**
```
perf(api): optimize database query for agent list
perf(operator): reduce memory allocation in hot path
perf(web): lazy load dashboard widgets
```

### `ci` – CI/CD
Changes to CI/CD pipelines

**Examples:**
```
ci: add automated release workflow
ci: update GitHub Actions to v4
ci(api): add deployment workflow for Railway
```

### `build` – Build System
Changes to build configuration

**Examples:**
```
build: update webpack config for production
build(web): configure Next.js for static export
build: add Docker multi-stage builds
```

### `revert` – Reverts
Reverting previous commits

**Examples:**
```
revert: revert "feat(api): add experimental endpoint"
```

## Scope Guidelines 🗺️

Scope indicates which part of the codebase is affected.

### Common Scopes

**By Repository:**
- `core` – blackroad-os-core
- `api` – blackroad-os-api
- `operator` – blackroad-os-operator
- `web` – blackroad-os-web
- `prism` – blackroad-os-prism-console

**By Component/Module:**
- `auth` – Authentication/authorization
- `db` – Database layer
- `routes` – API routes/endpoints
- `ui` – User interface
- `cli` – Command-line interface
- `config` – Configuration
- `utils` – Utility functions

**By Team/Area:**
- `infra` – Infrastructure
- `docs` – Documentation
- `research` – Research/experimental
- `brand` – Branding/design

**Special Scopes:**
- `deps` – Dependencies
- `release` – Release-related
- `security` – Security fixes

### When to Omit Scope

Scope is optional for:
- Very small repositories
- Changes affecting entire repo (e.g., `chore: update .gitignore`)
- General documentation (e.g., `docs: fix typo in README`)

## Description Guidelines ✍️

### DO ✅
- **Use imperative mood** ("add" not "added" or "adds")
- **Start with lowercase** (unless proper noun)
- **No period at end**
- **Be concise** (max 72 characters)
- **Be specific** (what and why)

**Good examples:**
```
feat(api): add health check endpoint
fix(operator): prevent race condition in task scheduler
chore(deps): update express to v4.18.2
docs(core): clarify type system architecture
```

### DON'T ❌
- Use past tense ("added", "fixed")
- Start with uppercase (unless proper noun)
- End with period
- Be vague ("update stuff", "fix bug")
- Be too verbose

**Bad examples:**
```
Added new feature          ❌ (past tense)
Fix: Bug in API           ❌ (uppercase Fix, vague)
feat(api): add endpoint.  ❌ (period at end)
fix: fix                  ❌ (not descriptive)
```

## Body Guidelines 📄

The body provides additional context (optional but recommended for complex changes).

**Format:**
- Wrap at 72 characters
- Separate from description with blank line
- Explain **what** and **why**, not **how**
- Use bullet points for multiple items

**Example:**
```
feat(operator): add auto-scaling support

Add automatic scaling based on queue depth and CPU usage.
This allows the operator to handle traffic spikes without
manual intervention.

- Monitor queue depth every 30 seconds
- Scale up when queue > 100 items
- Scale down when queue < 10 items for 5 minutes
- Configurable via AUTOSCALE_ENABLED env var
```

## Footer Guidelines 🔗

Footers are used for:
- **Issue references** – Link to GitHub issues
- **Breaking changes** – Highlight incompatible changes
- **Co-authors** – Credit contributors
- **Reviewers** – Note reviewers

### Issue References

**Format:**
```
Fixes #123
Closes #456
Refs #789
```

**Keywords:**
- `Fixes #123` – Closes issue on merge
- `Closes #123` – Closes issue on merge
- `Resolves #123` – Closes issue on merge
- `Refs #123` – References issue (doesn't close)
- `Related to #123` – Related issue

**Example:**
```
fix(api): handle null values in agent status

Fixes #123
Refs #456
```

### Breaking Changes

**Format:**
```
BREAKING CHANGE: <description>
```

**Example:**
```
feat(api): redesign authentication flow

BREAKING CHANGE: The /auth endpoint now returns JWT tokens
instead of session cookies. Clients must update to use
Authorization headers.

Fixes #234
```

### Co-Authors

**Format:**
```
Co-authored-by: Name <email@example.com>
```

**Example:**
```
feat(core): implement type registry

Co-authored-by: Alice <alice@blackroad.io>
Co-authored-by: Bob <bob@blackroad.io>
```

## Complete Examples 📚

### Simple Commit
```
feat(api): add health check endpoint
```

### Commit with Body
```
fix(operator): resolve memory leak in scheduler

The scheduler was holding references to completed tasks,
preventing garbage collection. Now we clear task references
immediately after completion.

Fixes #789
```

### Breaking Change
```
feat(api)!: redesign authentication flow

Replace session-based auth with JWT tokens for better
scalability and stateless operation.

BREAKING CHANGE: The /auth endpoint now returns JWT tokens
in the response body instead of setting session cookies.
Clients must update to include tokens in Authorization headers.

Migration guide: docs/migration/auth-v2.md

Fixes #456
Refs #123
```

### Multiple Issues
```
fix(web): correct layout issues on mobile

- Fix button alignment on small screens
- Adjust padding for better readability
- Improve responsive breakpoints

Fixes #111
Fixes #222
Fixes #333
```

### Revert
```
revert: revert "feat(api): add experimental caching"

This reverts commit abc123def456.

The caching implementation caused data consistency issues
in production. Reverting while we redesign the approach.

Refs #999
```

## Automated Tools 🤖

### Commitlint

Enforce commit message format:

```bash
# Install
npm install --save-dev @commitlint/cli @commitlint/config-conventional

# Configure (.commitlintrc.json)
{
  "extends": ["@commitlint/config-conventional"]
}

# Add to pre-commit hook
npx commitlint --edit $1
```

### Commitizen

Interactive commit message builder:

```bash
# Install
npm install --save-dev commitizen cz-conventional-changelog

# Configure (package.json)
{
  "config": {
    "commitizen": {
      "path": "cz-conventional-changelog"
    }
  }
}

# Use
npm run commit
# or
npx cz
```

### Husky

Git hooks for enforcing conventions:

```bash
# Install
npm install --save-dev husky

# Configure
npx husky install
npx husky add .husky/commit-msg 'npx commitlint --edit $1'
```

## Changelog Generation 📝

With conventional commits, changelogs can be auto-generated:

### Standard Version

```bash
npm install --save-dev standard-version

# Generate changelog and bump version
npx standard-version

# Preview
npx standard-version --dry-run
```

### Conventional Changelog

```bash
npm install --save-dev conventional-changelog-cli

# Generate CHANGELOG.md
npx conventional-changelog -p angular -i CHANGELOG.md -s
```

## Special Cases 🔧

### Merge Commits

For merge commits (if not using squash):
```
Merge branch 'feature/api-endpoints' into main
```

### Multiple Types

If a commit has multiple types, use the most significant:
```
# If both feature + docs, use feat
feat(api): add new endpoint with documentation
```

### Scope with Multiple Areas

Use the primary area:
```
feat(api): add cross-service authentication
# Even if it affects operator too
```

### WIP Commits

For work-in-progress (avoid in main, OK in feature branches):
```
wip: experimenting with caching strategy
```

## Agent-Specific Guidelines 🤖

For AI agents creating commits:

1. **Always use conventional format**
2. **Be descriptive** – More detail is better
3. **Link issues** – Always include "Fixes #123"
4. **Add agent identifier** (optional):
   ```
   feat(api): add workflow endpoints
   
   Generated by: agent-code-gen-v1.0.0
   Fixes #123
   ```

## Quick Reference Card 🎴

```
┌─────────────────────────────────────────┐
│ BlackRoad OS Commit Messages            │
├─────────────────────────────────────────┤
│ Format: type(scope): description        │
│                                         │
│ Types:                                  │
│   feat     – New feature                │
│   fix      – Bug fix                    │
│   chore    – Maintenance                │
│   docs     – Documentation              │
│   style    – Code formatting            │
│   refactor – Code restructuring         │
│   test     – Tests                      │
│   perf     – Performance                │
│   ci       – CI/CD                      │
│   build    – Build system               │
│   revert   – Revert commit              │
│                                         │
│ Description:                            │
│   - Imperative mood ("add" not "added") │
│   - Lowercase (unless proper noun)      │
│   - Max 72 characters                   │
│   - No period at end                    │
│                                         │
│ Footer:                                 │
│   Fixes #123                            │
│   BREAKING CHANGE: description          │
│   Co-authored-by: Name <email>          │
│                                         │
│ Examples:                               │
│   feat(api): add health endpoint        │
│   fix(operator): resolve memory leak    │
│   docs: update README                   │
└─────────────────────────────────────────┘
```

---

**Related docs:**
- [Coding Workflow](../workflows/coding-workflow.md)
- [Branch Naming](./branches.md)
- [Release Workflow](../workflows/release-workflow.md)

**External resources:**
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Angular Commit Guidelines](https://github.com/angular/angular/blob/main/CONTRIBUTING.md#commit)
