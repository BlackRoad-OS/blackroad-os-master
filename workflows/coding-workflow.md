# 🌿 Coding Workflow – BlackRoad OS

This document defines the standard coding workflow for all BlackRoad OS repositories.

## Overview 🎯

The coding workflow ensures smooth collaboration between human developers and AI agents across all BlackRoad OS projects.

## Workflow Steps 🔄

### 1️⃣ Create Issue

**When:** Starting any new feature, bug fix, or maintenance task

**Process:**
1. Create issue in the appropriate repository
2. Use the correct issue template:
   - **Feature Request** for new functionality
   - **Bug Report** for defects
   - **Chore/Maintenance** for technical debt, refactoring, etc.
3. Add appropriate labels:
   - **Team:** `Team: Core`, `Team: API`, etc.
   - **Type:** `Type: Feature`, `Type: Bug`, `Type: Chore`, etc.
   - **Priority:** `Priority: High`, `Priority: Medium`, `Priority: Low` (if applicable)
4. Link to relevant project board (auto-synced via workflow)

**Example:**
```
Title: [core] Add health check endpoint
Labels: Team: Core, Type: Feature, Priority: Medium
```

### 2️⃣ Create Branch

**When:** Ready to start coding

**Branch Naming Convention:**
```
<type>/<area>-<short-description>
```

**Types:**
- `feature/` – New features
- `fix/` – Bug fixes
- `chore/` – Maintenance, refactoring, dependencies
- `docs/` – Documentation updates
- `research/` – Experimental work

**Areas:**
- `core`, `api`, `operator`, `web`, `prism`, `infra`, `docs`, `research`, `brand`, `pack-*`

**Examples:**
```bash
feature/api-agent-workflows
fix/operator-memory-leak
chore/infra-update-dependencies
docs/api-endpoint-specs
research/llm-routing-optimization
```

**Commands:**
```bash
git checkout -b feature/api-agent-workflows
```

### 3️⃣ Code Changes

**Best Practices:**
- ✅ **Keep changes atomic** – One logical change per commit
- ✅ **Write clear commit messages** (see `conventions/commit-messages.md`)
- ✅ **Add/update tests** for new functionality
- ✅ **Update documentation** when changing behavior
- ✅ **No secrets** in code – Use environment variables
- ✅ **Follow existing code style** – Use linters

**While Coding:**
```bash
# Run tests frequently
npm test  # or pytest, go test, etc.

# Run linter
npm run lint  # or ruff, golangci-lint, etc.

# Commit incrementally
git add -A
git commit -m "feat(api): add health check endpoint"
```

### 4️⃣ Open Pull Request

**When:** Code is ready for review (or draft PR for early feedback)

**PR Title Format:**
```
[area] Description
```
or
```
type: Description
```

**Examples:**
```
[core] Implement health endpoint spec
feat(api): add agent workflow orchestration
fix(operator): resolve memory leak in scheduler
```

**PR Process:**
1. Push your branch:
   ```bash
   git push origin feature/api-agent-workflows
   ```
2. Open PR on GitHub
3. Fill out PR template completely
4. Link related issue(s): `Closes #123`
5. Add reviewers (or rely on CODEOWNERS)
6. Mark as **draft** if work-in-progress

**PR Checklist (from template):**
- [ ] Tests added/updated (if relevant)
- [ ] Workflows still passing
- [ ] No secrets added
- [ ] Linked to issue / project as needed
- [ ] Documentation updated (if relevant)
- [ ] Follows branch naming conventions
- [ ] Follows commit message conventions

### 5️⃣ Code Review

**Automated Checks:**
- ✅ CI pipeline runs (lint, test, build)
- ✅ PR title/description validation
- ✅ Code coverage (if configured)
- ✅ Security scans

**Human Review:**
- Required approvals based on CODEOWNERS
- Address feedback promptly
- Push additional commits to the same branch
- Re-request review after major changes

**Review Guidelines:**
- Be respectful and constructive
- Focus on code quality, security, and maintainability
- Approve when ready, or request changes with clear feedback

### 6️⃣ Merge to Main

**When:** All checks pass + required approvals obtained

**Merge Strategy:**
- **Squash and merge** (default for most repos) – Clean history
- **Merge commit** (for preserving detailed history)
- **Rebase and merge** (for linear history)

**Post-Merge:**
- Branch is automatically deleted
- CD pipeline may trigger deployment (for applicable repos)
- Issue is automatically closed (if PR had "Closes #123")
- Project status updated

**Commands:**
```bash
# After merge, update local main
git checkout main
git pull origin main

# Delete local feature branch
git branch -d feature/api-agent-workflows
```

### 7️⃣ Deploy (if applicable)

**Automatic Deployment:**
- Merges to `main` trigger CD workflow
- Deploys to staging/production (configured per repo)
- Uses Railway, Vercel, Fly.io, or other platforms

**Manual Deployment:**
- For repos requiring manual approval
- Follow repo-specific deployment docs

## Special Cases 🔧

### Hotfixes

For critical production bugs:

```bash
# Create hotfix branch from main
git checkout main
git pull
git checkout -b fix/critical-security-patch

# Make minimal fix
# ... edit files ...

# Fast-track PR
# - Mark as high priority
# - Request immediate review
# - Deploy ASAP after merge
```

### Experiments

For research/experimental work:

```bash
# Use research/ prefix
git checkout -b research/new-llm-architecture

# Work freely, iterate
# When ready to productionize:
# 1. Create feature branch
# 2. Refine code for production
# 3. Follow standard workflow
```

### Multi-Repo Changes

When changes span multiple repos:

1. Create issues in each affected repo
2. Link issues together (cross-reference)
3. Coordinate PRs (mention related PRs)
4. Merge in dependency order
5. Update project board to track progress

## Agent Workflow Integration 🤖

**For AI agents working in repos:**

1. **Read this workflow** before starting work
2. **Follow conventions** exactly (branches, commits, PRs)
3. **Use issue templates** when creating issues
4. **Fill PR templates** completely
5. **Run tests/lints** before opening PR
6. **Respond to review feedback** promptly

**Agent-Specific Tips:**
- Always check for existing issues/PRs first
- Create draft PRs for work-in-progress
- Add detailed context in PR descriptions
- Reference documentation and specs
- Ask for human review when uncertain

## Tools & Automation 🛠️

### GitHub CLI (gh)

```bash
# Create issue
gh issue create --title "[core] Add feature" --label "Type: Feature"

# Create PR
gh pr create --title "[core] Add feature" --body "Description..."

# Check CI status
gh pr checks

# Merge PR
gh pr merge --squash
```

### Git Hooks

Recommended pre-commit hooks:
- Lint check
- Test run (for small test suites)
- Commit message validation

### IDE Integration

- Use GitHub Copilot for code assistance
- Configure linters in IDE
- Enable auto-formatting

## Summary Checklist ✅

For every change:

1. ✅ Issue created with proper labels
2. ✅ Branch follows naming convention
3. ✅ Code follows style guide
4. ✅ Tests added/updated
5. ✅ Commits follow convention
6. ✅ PR uses template, has clear title
7. ✅ CI passes
8. ✅ Reviews obtained
9. ✅ Merged to main
10. ✅ Deployed (if applicable)

---

**Questions?** Check other workflow docs:
- [Release Workflow](./release-workflow.md)
- [Incident Workflow](./incident-workflow.md)
- [Agent Workflows](./agent-workflows.md)

**Conventions:** See `conventions/` directory for detailed specs.
