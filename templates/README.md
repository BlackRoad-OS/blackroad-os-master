# 📋 BlackRoad OS Templates

> Reusable templates and living knowledge base for the BlackRoad OS constellation

---

## 🎯 Overview

This directory contains standardized templates and the BlackRoad Codex - a living knowledge base that helps teams maintain consistency, capture decisions, and share knowledge across the entire BlackRoad OS ecosystem.

---

## 📁 Contents

### 🚦 Status Light Templates
**Location:** [status-lights/](./status-lights/)

Standardized templates for managing component status using the traffic light system:
- **🟢 GreenLight** - Production ready, stable, fully operational
- **🟡 YellowLight** - In-progress, under development, needs attention
- **🔴 RedLight** - Blocked, critical issues, immediate action needed

**Use for:**
- Marking repository status
- Communicating system health
- Tracking component maturity
- Managing incidents

**Quick Start:** [status-lights/README.md](./status-lights/README.md)

---

### 📚 BlackRoad Codex
**Location:** [codex/](./codex/)

The living knowledge base containing:
- **Decisions** - Architecture Decision Records (ADRs)
- **Patterns** - Reusable solutions to common problems
- **Practices** - Team conventions and best practices
- **Glossary** - Terms, acronyms, and definitions

**Use for:**
- Documenting architectural decisions
- Sharing reusable patterns
- Establishing team practices
- Onboarding new members
- Quick reference lookup

**Quick Start:** [codex/README.md](./codex/README.md)

---

## 🚀 Quick Start Guide

### For New Team Members
1. **Read the Glossary** - [codex/glossary/terms.md](./codex/glossary/terms.md)
2. **Understand Status Lights** - [status-lights/README.md](./status-lights/README.md)
3. **Review Recent Decisions** - [codex/decisions/](./codex/decisions/)
4. **Explore Patterns** - [codex/patterns/](./codex/patterns/)

### For Contributors
1. **Choose Right Template**
   - ADR for architectural decisions
   - Pattern for reusable solutions
   - Status light for component status
   
2. **Fill Out Template**
   - Use the provided structure
   - Be clear and concise
   - Include examples

3. **Submit for Review**
   - Create PR with your changes
   - Tag relevant reviewers
   - Incorporate feedback

4. **Keep Updated**
   - Review quarterly
   - Mark deprecated content
   - Link related documents

---

## 📊 Template Usage

### Status Light Templates

```bash
# Check component status
cat status/summary.json | jq '.subsystems.core'

# Use status light template
cp templates/status-lights/greenlight.md \
   /tmp/my-component-greenlight-checklist.md
```

### Codex Templates

```bash
# Create new ADR
cp templates/codex/decisions/template.md \
   templates/codex/decisions/$(date +%Y-%m-%d)-my-decision.md

# Create new pattern
cp templates/codex/patterns/template.md \
   templates/codex/patterns/my-pattern.md
```

---

## 🔗 Integration Points

### With Registries
Templates reference and are referenced by registry files:
- `registries/repos.json` - Links to status light criteria
- `registries/ownership.json` - References team practices

### With Playbooks
Playbooks reference codex patterns and practices:
- `playbooks/new-pack.md` - Uses status light templates
- `playbooks/release-train.md` - References deployment patterns

### With Status
Status files use light template structure:
- `status/summary.json` - Tracks GreenLight/YellowLight/RedLight

---

## 📏 Standards & Guidelines

### Documentation Standards
- ✅ Use provided templates
- ✅ Include examples
- ✅ Link related documents
- ✅ Keep up-to-date
- ✅ Clear ownership

### Review Requirements
- 📝 2+ team member review
- 📝 Examples tested
- 📝 Links validated
- 📝 Tags appropriate

### Maintenance
- 🔄 Quarterly reviews
- 🔄 Deprecate outdated
- 🔄 Update timestamps
- 🔄 Track changes

---

## 🎯 Success Metrics

### Usage Indicators
- Number of ADRs created
- Patterns documented
- Status transitions tracked
- Codex search frequency

### Quality Indicators
- Documents reviewed
- Examples included
- Links maintained
- Regular updates

### Impact Indicators
- Onboarding time reduced
- Duplicate solutions avoided
- Consistent patterns adopted
- Knowledge shared

---

## 🧬 Template Principles

### 1. Consistency
- Standard structure across all templates
- Common terminology and conventions
- Predictable locations and naming

### 2. Practicality
- Templates are useful, not bureaucratic
- Focus on value, not perfection
- Easy to start, evolve over time

### 3. Discoverability
- Clear organization
- Good search capability
- Cross-references
- Living index

### 4. Community
- Everyone can contribute
- Knowledge belongs to team
- Build on each other's work
- Celebrate learning

---

## 📡 Related Resources

### Core Documentation
- [Main README](../README.md) - Repository overview
- [Registries](../registries/) - System maps and ownership
- [Playbooks](../playbooks/) - Orchestration workflows
- [Status](../status/) - Current system state

### Template Sections
- [Status Lights](./status-lights/) - 🚦 GreenLight/YellowLight/RedLight
- [Codex](./codex/) - 📚 Knowledge base
- [Codex Decisions](./codex/decisions/) - ADR templates
- [Codex Patterns](./codex/patterns/) - Pattern templates
- [Codex Glossary](./codex/glossary/terms.md) - Terms & definitions

---

## 🤝 Contributing

### Adding New Templates
1. Identify need for new template type
2. Draft initial structure
3. Get team feedback
4. Document usage guidelines
5. Add to this index

### Improving Existing Templates
1. Use template and note pain points
2. Propose improvements
3. Test with real examples
4. Update and announce changes

### Questions or Suggestions?
- Open an issue in `blackroad-os-master`
- Ask in team channels
- Submit PR with improvements

---

## 🚀 Future Enhancements

### Planned
- [ ] Template validation scripts
- [ ] Auto-generation tools
- [ ] Search functionality
- [ ] Version tracking
- [ ] Template metrics dashboard

### Under Consideration
- [ ] Additional template types
- [ ] Multi-language support
- [ ] Integration with Prism Console
- [ ] AI-assisted template filling

---

*Templates evolve with the system. Contribute your improvements! 🧠*

---

*Last Updated: 2025-12-25*  
*Maintained by: Orchestration Team 🧠*
