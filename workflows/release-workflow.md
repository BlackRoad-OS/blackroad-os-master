# 🚀 Release Workflow – BlackRoad OS

This document defines the release process for BlackRoad OS projects.

## Overview 🎯

Releases in BlackRoad OS follow semantic versioning and are coordinated across multiple repositories when necessary.

## Semantic Versioning 📊

All BlackRoad OS projects use [Semantic Versioning 2.0.0](https://semver.org/):

```
MAJOR.MINOR.PATCH
```

- **MAJOR** (1.0.0) – Breaking changes, incompatible API changes
- **MINOR** (0.1.0) – New features, backwards-compatible
- **PATCH** (0.0.1) – Bug fixes, backwards-compatible

**Examples:**
- `1.0.0` – Initial stable release
- `1.1.0` – Added new feature
- `1.1.1` – Fixed bug in 1.1.0
- `2.0.0` – Breaking change from 1.x.x

**Pre-release versions:**
- `1.0.0-alpha.1` – Alpha release
- `1.0.0-beta.1` – Beta release
- `1.0.0-rc.1` – Release candidate

## Release Process 🔄

### 1️⃣ Determine Version Bump

**Review changes since last release:**

```bash
# See commits since last tag
git log $(git describe --tags --abbrev=0)..HEAD --oneline

# Or use GitHub compare
# https://github.com/BlackRoad-OS/repo/compare/v1.0.0...main
```

**Decide version bump:**
- Breaking changes? → MAJOR
- New features? → MINOR
- Only bug fixes? → PATCH

### 2️⃣ Update Version Files

**Update version in:**
- `package.json` (Node.js)
- `pyproject.toml` or `setup.py` (Python)
- `Cargo.toml` (Rust)
- `go.mod` (Go)
- Any other version-tracking files

**Example (package.json):**
```json
{
  "version": "1.2.0"
}
```

**Commit version bump:**
```bash
git add package.json
git commit -m "chore: bump version to 1.2.0"
```

### 3️⃣ Update CHANGELOG

**Maintain a CHANGELOG.md:**

```markdown
# Changelog

All notable changes to this project will be documented in this file.

## [1.2.0] - 2024-11-24

### Added
- New agent workflow orchestration endpoints
- Health check endpoint for monitoring

### Changed
- Improved error handling in operator
- Updated dependencies

### Fixed
- Memory leak in scheduler
- Race condition in event processing

### Deprecated
- Old authentication method (use JWT instead)

### Security
- Fixed XSS vulnerability in web interface

## [1.1.0] - 2024-11-01
...
```

**Commit CHANGELOG:**
```bash
git add CHANGELOG.md
git commit -m "docs: update CHANGELOG for 1.2.0"
```

### 4️⃣ Create Git Tag

**Create annotated tag:**

```bash
git tag -a v1.2.0 -m "Release v1.2.0

- Add agent workflow orchestration
- Add health check endpoint
- Fix memory leak in scheduler
"
```

**Push tag:**
```bash
git push origin v1.2.0
```

### 5️⃣ Create GitHub Release

**Option A: GitHub CLI**
```bash
gh release create v1.2.0 \
  --title "v1.2.0 - Agent Workflows" \
  --notes "See CHANGELOG.md for full details" \
  --draft  # Remove --draft when ready to publish
```

**Option B: GitHub Web UI**
1. Go to repository → Releases
2. Click "Draft a new release"
3. Select tag: `v1.2.0`
4. Release title: `v1.2.0 - Agent Workflows`
5. Description: Copy from CHANGELOG or write summary
6. Attach binaries (if applicable)
7. Mark as pre-release (if applicable)
8. Publish release

### 6️⃣ Automated Deployment

**On release publish:**
- CD workflow triggers (see `.github/workflows/cd-template.yml`)
- Deployment to production environment
- Docker images built and pushed (if applicable)
- NPM/PyPI package published (if applicable)

**Deployment checklist:**
- [ ] CI passes on release tag
- [ ] Staging deployment successful
- [ ] Smoke tests pass
- [ ] Monitoring shows healthy metrics
- [ ] Rollback plan ready

### 7️⃣ Post-Release Tasks

**Announce release:**
- Update project status
- Notify team/community
- Update documentation site
- Post to social media (if applicable)

**Monitor:**
- Error rates
- Performance metrics
- User feedback

**Prepare next release:**
- Create milestone for next version
- Prioritize issues for next release

## Release Branches 🌿

For long-term support or coordinating large releases:

**Create release branch:**
```bash
git checkout -b release/v1.2.0
```

**Merge PRs to release branch:**
- Only bug fixes and polish
- No new features

**When ready:**
- Merge release branch to main
- Tag and publish
- Optionally keep branch for LTS

## Hotfix Releases 🔥

For critical production bugs:

**Process:**
1. Create hotfix branch from latest tag:
   ```bash
   git checkout v1.2.0
   git checkout -b hotfix/1.2.1-security-fix
   ```

2. Make minimal fix
3. Update CHANGELOG (add `[1.2.1]` section)
4. Bump version to `1.2.1`
5. Commit and tag:
   ```bash
   git commit -m "fix: patch security vulnerability"
   git tag -a v1.2.1 -m "Hotfix v1.2.1"
   ```

6. Merge back to main:
   ```bash
   git checkout main
   git merge hotfix/1.2.1-security-fix
   git push origin main v1.2.1
   ```

7. Create GitHub release
8. Deploy immediately

## Multi-Repo Releases 🕸️

When releasing changes across multiple repos:

**Coordination:**
1. Identify all affected repos
2. Create issues in each repo
3. Link issues together
4. Coordinate version bumps
5. Release in dependency order

**Example:**
```
blackroad-os-core v1.2.0
  ↓ (dependency)
blackroad-os-api v2.1.0
  ↓ (dependency)
blackroad-os-web v1.5.0
```

**Release order:**
1. Release `core` v1.2.0
2. Update `api` to use `core` v1.2.0, release `api` v2.1.0
3. Update `web` to use `api` v2.1.0, release `web` v1.5.0

## Versioning Edge Cases 🧩

### Pre-1.0.0 Releases

Before first stable release:
- `0.x.x` – Breaking changes allowed in MINOR
- `0.1.x` – Stable features
- `0.0.x` – Experimental

### Monorepo Versioning

For monorepos with multiple packages:
- **Independent versioning** – Each package has own version
- **Fixed versioning** – All packages share same version
- Document strategy in README

### Calendar Versioning

Alternative for certain projects:
- `YYYY.MM.DD` – e.g., `2024.11.24`
- `YYYY.MM.MICRO` – e.g., `2024.11.1`

## Automation Tools 🤖

### Standard Version

```bash
npm install --save-dev standard-version

# Bump version and update CHANGELOG
npm run release
```

### Release Please

GitHub Action for automated releases:
```yaml
# .github/workflows/release-please.yml
- uses: google-github-actions/release-please-action@v3
  with:
    release-type: node
    package-name: blackroad-os-api
```

### Semantic Release

Full automation with semantic-release:
```bash
npm install --save-dev semantic-release

# In CI/CD
npx semantic-release
```

## Release Checklist ✅

For every release:

1. ✅ All PRs merged and CI passing
2. ✅ Version bumped in all relevant files
3. ✅ CHANGELOG.md updated with changes
4. ✅ Git tag created and pushed
5. ✅ GitHub release created
6. ✅ CD pipeline triggered
7. ✅ Deployment successful
8. ✅ Monitoring shows healthy state
9. ✅ Documentation updated
10. ✅ Release announced

## Rollback Plan 🔄

If release has critical issues:

**Immediate:**
1. Revert deployment to previous version
2. Notify team
3. Create hotfix or patch release

**Git revert:**
```bash
# Revert specific commit
git revert <commit-hash>

# Delete bad tag
git tag -d v1.2.0
git push origin :refs/tags/v1.2.0

# Re-tag correct commit
git tag -a v1.2.0 <correct-commit>
git push origin v1.2.0
```

---

**Related docs:**
- [Coding Workflow](./coding-workflow.md)
- [Incident Workflow](./incident-workflow.md)
- [Commit Message Conventions](../conventions/commit-messages.md)
