# 📚 BlackRoad Codex

> **The Living Knowledge Base** — Central registry of patterns, practices, decisions, and tribal knowledge for BlackRoad OS

---

## 🎯 Mission

The BlackRoad Codex serves as:
- **Decision Record** - Document architectural decisions and their rationale
- **Pattern Library** - Reusable solutions to common problems
- **Tribal Knowledge** - Capture institutional knowledge before it's lost
- **Learning Resource** - Onboard new team members effectively
- **Reference Guide** - Quick lookup for standards and conventions

---

## 📁 Codex Structure

```
templates/codex/
├── README.md                    This file
├── decisions/                   Architecture Decision Records (ADRs)
│   ├── template.md
│   └── [YYYY-MM-DD]-{decision-title}.md
├── patterns/                    Reusable patterns and solutions
│   ├── template.md
│   └── {pattern-name}.md
├── practices/                   Team practices and conventions
│   ├── code-review.md
│   ├── deployment.md
│   └── testing.md
├── glossary/                    Terms and definitions
│   └── terms.md
└── playbooks/                   Links to orchestration playbooks
    └── index.md
```

---

## 📖 Codex Categories

### 1. Architecture Decision Records (ADRs)
**Purpose:** Document significant architectural decisions

**When to create:**
- Choosing between technical alternatives
- Adopting new technologies or patterns
- Making breaking changes
- Establishing new standards

**Template:** [decisions/template.md](./decisions/template.md)

**Examples:**
- "Use Event Sourcing for Financial Transactions"
- "Adopt GraphQL for Cross-Service Communication"
- "Implement Multi-Tenancy at Database Level"

---

### 2. Patterns
**Purpose:** Document reusable solutions to recurring problems

**When to create:**
- Solved a problem that others will face
- Established a pattern across multiple services
- Created a template worth sharing

**Template:** [patterns/template.md](./patterns/template.md)

**Examples:**
- "Circuit Breaker for External APIs"
- "Saga Pattern for Distributed Transactions"
- "Feature Flag Implementation"

---

### 3. Practices
**Purpose:** Document team conventions and best practices

**When to create:**
- Establishing coding standards
- Defining process workflows
- Setting quality guidelines

**Files:** [practices/](./practices/)

**Examples:**
- Code Review Guidelines
- Deployment Procedures
- Testing Strategies
- On-call Rotation

---

### 4. Glossary
**Purpose:** Define terms, acronyms, and concepts

**When to update:**
- New terminology introduced
- Existing term needs clarification
- Acronym definitions needed

**File:** [glossary/terms.md](./glossary/terms.md)

---

## 🔄 Codex Workflow

### Contributing to the Codex

1. **Identify Need**
   - Found yourself explaining something repeatedly?
   - Made a significant decision?
   - Discovered a useful pattern?

2. **Choose Category**
   - Decision → ADR in `decisions/`
   - Pattern → Pattern doc in `patterns/`
   - Practice → Update `practices/`
   - Term → Add to `glossary/terms.md`

3. **Use Template**
   - Copy the appropriate template
   - Fill out all sections
   - Be clear and concise

4. **Get Review**
   - Submit PR with codex updates
   - Tag relevant team members
   - Incorporate feedback

5. **Maintain**
   - Keep documents up-to-date
   - Mark deprecated entries
   - Link related documents

---

## 📝 Writing Guidelines

### Be Clear
- Use simple language
- Avoid jargon (or define it)
- Include examples
- Add diagrams when helpful

### Be Concise
- Get to the point quickly
- Use bullet points
- Break up long paragraphs
- Highlight key information

### Be Practical
- Include code examples
- Show real-world usage
- Document edge cases
- Provide context

### Be Honest
- Document tradeoffs
- Admit unknowns
- Update when wrong
- Deprecate outdated content

---

## 🔍 Finding Information

### Quick Search
```bash
# Search for a pattern
grep -r "circuit breaker" templates/codex/

# Find decisions about authentication
ls templates/codex/decisions/ | grep auth

# List all practices
ls templates/codex/practices/
```

### By Category
- **Decisions:** Browse `decisions/` by date
- **Patterns:** Browse `patterns/` by name
- **Practices:** Check `practices/` index
- **Terms:** Search `glossary/terms.md`

### By Tag
Documents can be tagged:
```yaml
tags: [authentication, security, api]
```

---

## 🏆 Codex Metrics

### Quality Indicators
- ✅ Documents reviewed by 2+ team members
- ✅ Examples included and tested
- ✅ Updated within last 6 months
- ✅ Linked to related documents
- ✅ Clear ownership assigned

### Success Metrics
- Number of documents created
- Search/reference frequency
- Time to onboard new members
- Reduced duplicate solutions
- Increased knowledge sharing

---

## 🔗 Integration with BlackRoad OS

### With Registries
Link codex decisions to registry entries:
```json
{
  "id": "blackroad-os-api",
  "codexReferences": [
    "decisions/2025-12-01-graphql-adoption.md",
    "patterns/api-versioning.md"
  ]
}
```

### With Playbooks
Reference codex patterns in playbooks:
```markdown
## Step 3: Implement Circuit Breaker
See: [Codex Pattern - Circuit Breaker](../templates/codex/patterns/circuit-breaker.md)
```

### With Agent Lanes
Codex defines conventions that agents must follow:
```json
{
  "lane": "code-quality",
  "conventions": [
    "codex/practices/code-review.md",
    "codex/practices/testing.md"
  ]
}
```

---

## 🎯 Codex Principles

### 1. Living Document
- Codex evolves with the system
- Regular reviews and updates
- Deprecate outdated content
- Celebrate learning and improvement

### 2. Community Owned
- Everyone can contribute
- Knowledge belongs to the team
- Share openly and often
- Build on each other's work

### 3. Practical Over Perfect
- Ship documentation early
- Improve through iteration
- Real examples over theory
- Useful > comprehensive

### 4. Findable and Usable
- Clear organization
- Good search capability
- Cross-references
- Regular maintenance

---

## 📚 Getting Started

### For New Team Members
1. Start with [glossary/terms.md](./glossary/terms.md)
2. Review recent [decisions/](./decisions/)
3. Explore common [patterns/](./patterns/)
4. Read team [practices/](./practices/)

### For Contributors
1. Read this README
2. Choose the right template
3. Write your document
4. Submit for review
5. Keep it updated

### For Leaders
1. Encourage documentation
2. Review regularly
3. Celebrate contributions
4. Enforce standards
5. Model good practices

---

## 📡 Related Resources

- [Architecture Decision Records](./decisions/)
- [Pattern Library](./patterns/)
- [Team Practices](./practices/)
- [Glossary](./glossary/terms.md)
- [Playbooks](../../playbooks/)
- [Registries](../../registries/)

---

## 🚀 Quick Commands

```bash
# Create new ADR
cp templates/codex/decisions/template.md \
   templates/codex/decisions/$(date +%Y-%m-%d)-my-decision.md

# Create new pattern
cp templates/codex/patterns/template.md \
   templates/codex/patterns/my-pattern.md

# Search codex
grep -r "search term" templates/codex/

# List recent decisions
ls -lt templates/codex/decisions/ | head -10
```

---

*The Codex grows with every contribution. Share your knowledge! 🧠*

---

*Last Updated: 2025-12-25*  
*Maintained by: Orchestration Team 🧠*
