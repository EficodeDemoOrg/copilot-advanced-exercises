# Copilot Workshop - Advanced Track

Master advanced GitHub Copilot techniques through hands-on exercises organized into flexible learning tracks.

---

## Prerequisites

**Required:**
- VS Code, Visual Studio, or JetBrains IDE installed
- GitHub Copilot and Copilot Chat extensions installed
- Git and a terminal

**Recommended:**
- Docker (for MCP database exercises)
- Node.js 18+ (for some MCP servers and APM)
- GitHub CLI (for CLI exercises)


**Track Structure:**
- 🔵 **Track 1 (Foundation):** Recommended starting point - establishes domain-driven AI development
- 🟡 **Tracks 2-4 (Quality):** Apply AI to code review, refactoring, and migration
- 🟣 **Tracks 5-6 (Tools):** Enhance Copilot with external tools and package workflows

**All tracks are optional** after Track 1, but Track 1 enhances the experience of all others.

---

## Learning Tracks

| Track | Title | Key Topics |
|-------|-------|------------|
| **1** | [**Agent-Driven Development**](TRACK1_AGENT_DRIVEN_DEVELOPMENT.md)  | Custom instructions, domain specialists, prompt files, feature development |
| **2** | [**Code Review**](TRACK2_CODE_REVIEW.md)  | Security audits, performance analysis, architecture review, validation |
| **3** | [**Refactoring**](TRACK3_REFACTORING.md)  | Find code smells, refactoring patterns, test-driven refactoring, validation |
| **4** | [**Migration**](TRACK4_MIGRATION.md)  | Language/framework migration, testing equivalence, optimization |
| **5** | [**MCP Integration**](TRACK5_MCP_INTEGRATION.md)  | External tools, databases, APIs, browser automation, workflow integration |
| **6** | [**CLI & APM**](TRACK6_CLI_AND_APM.md)  | Terminal integration, Copilot CLI, package AI workflows, team distribution |

**JetBrains Users:** Custom agents are VS Code only. Use [**JetBrains Prompt Templates**](JETBRAINS_PROMPTS.md) for equivalent workflows.

---

## Getting Started

**Mix and match tracks based on your needs:**

- **New to advanced Copilot?** → Start with [Track 1](TRACK1_AGENT_DRIVEN_DEVELOPMENT.md)
- **Need code review workflows?** → [Track 2](TRACK2_CODE_REVIEW.md)
- **Refactoring legacy code?** → [Track 3](TRACK3_REFACTORING.md) (consider Track 2 first)
- **Migrating tech stacks?** → [Track 4](TRACK4_MIGRATION.md) (consider Track 3 first)
- **Want database/API integration?** → [Track 5](TRACK5_MCP_INTEGRATION.md)
- **Building team workflows?** → [Track 6](TRACK6_CLI_AND_APM.md)

**For rapid hands-on experience:**

Follow the [**3-Hour Lite Version**](EXERCISES_LITE.md) covering essentials from Track 1 and Track 5.

---

## Project Setup Options

### Option A: Use Your Own Project

Apply techniques directly to your existing codebase. Ideal for immediate productivity gains.

### Option B: Use Exercise Project

Clone the provided full-stack task manager:

```bash
git clone https://github.com/EficodeDemoOrg/copilot-fullstack
cd copilot-fullstack
docker-compose up --build
```

**Includes:**
- React 19 + TypeScript + Vite (frontend)
- Node.js + Express + TypeScript (backend)
- PostgreSQL with Docker (database)
- Pre-configured domain structure
- Ready for Track 1-6 exercises

[View Project →](https://github.com/EficodeDemoOrg/copilot-fullstack)

### Option C: Create New Project

Start from scratch using AI collaboration (covered in [Track 1, Exercise 1](TRACK1_AGENT_DRIVEN_DEVELOPMENT.md#exercise-1-create-a-new-project-with-ai-collaboration)).

---

## IDE Support

### VS Code / Visual Studio

✅ **Full support** for all features including:
- Custom agents (VS Code only)
- MCP servers
- Prompt files
- Custom instructions
- Terminal integration

### JetBrains IDEs

✅ **Most features supported:**
- Custom instructions
- Prompt files (manual invocation)
- MCP servers (check IDE version)
- Terminal integration

⚠️ **Not supported:** Custom agents (VS Code feature)

**Solution:** Use [**JetBrains Prompt Templates**](JETBRAINS_PROMPTS.md) for equivalent workflows without custom agents.

---

## Key Concepts

### Domain-Driven AI Development (Track 1)

Structure your AI assistance around your code architecture:
- **Custom Instructions:** Project-wide and domain-specific coding standards
- **Domain Specialists:** AI assistants focused on specific parts of your codebase
- **Prompt Files:** Reusable workflows for common development tasks

### Quality Workflows (Tracks 2-4)

Apply AI to systematic quality improvements:
- **Code Review:** Security, performance, architecture analysis
- **Refactoring:** Transform code structure while preserving behavior
- **Migration:** Move between languages, frameworks, or architectures

### Tool Enhancement (Tracks 5-6)

Extend Copilot with external capabilities:
- **MCP Integration:** Connect databases, APIs, documentation, browsers
- **CLI & APM:** Command-line workflows and package AI context for teams

---

## Learning Resources

### Workshop Files
- [3-Hour Lite Version](EXERCISES_LITE.md) - Quick hands-on introduction
- [JetBrains Prompt Templates](JETBRAINS_PROMPTS.md) - Pre-made prompts for JetBrains users
- [App Ideas](EXERCISE_APP_IDEAS.md) - Project inspiration

### Official Documentation
- [Custom Instructions](https://code.visualstudio.com/docs/copilot/customization/custom-instructions)
- [Custom Agents](https://code.visualstudio.com/docs/copilot/customization/custom-agents) (VS Code)
- [MCP Servers](https://code.visualstudio.com/docs/copilot/customization/mcp-servers)
- [Model Selection Guide](https://docs.github.com/en/copilot/using-github-copilot/asking-github-copilot-questions-in-your-ide)

### External Resources
- [GitHub MCP Registry](https://github.com/mcp) - Curated MCP servers
- [MCP Documentation](https://modelcontextprotocol.io/)
- [APM Documentation](https://github.com/danielmeppiel/apm) - Agent Package Manager
- [Copilot CLI](https://docs.github.com/en/copilot/github-copilot-in-the-cli)

---

## Track Details

### [Track 1: Agent-Driven Development](TRACK1_AGENT_DRIVEN_DEVELOPMENT.md)

**Build a complete domain-driven AI development workflow**

**What you'll learn:**
- Create project blueprints with AI collaboration
- Setup base custom instructions
- Identify and define architectural domains
- Generate domain-specific instructions
- Create domain specialist custom agents (VS Code)
- Build reusable prompt file workflows
- Implement features using your domain system

**Key exercises:**
- Exercise 1: Project setup with AI
- Exercise 2: Base custom instructions
- Exercise 3: Domain-specific instructions (Part A/B/C/D)
- Exercise 4: Domain custom agents (VS Code only)
- Exercise 5: Prompt file workflows (Part A/B/C/D)
- Exercise 6: Feature implementation

**Outcome:** A structured AI development system tailored to your project architecture.

---

### [Track 2: Code Review](TRACK2_CODE_REVIEW.md)

**Perform comprehensive AI-assisted code reviews**

**What you'll learn:**
- Identify code needing review with AI
- Create review checklists (security, performance, architecture)
- Execute systematic reviews with AI
- Validate AI findings and prioritize actions

**Review types:**
- Security audits (injection, XSS, auth, data exposure)
- Performance analysis (queries, caching, complexity)
- Architecture evaluation (separation of concerns, maintainability)
- Accessibility checks (WCAG compliance)

**Outcome:** Systematic, AI-powered code review workflows.

---

### [Track 3: Refactoring](TRACK3_REFACTORING.md)

**Transform legacy or complex code with AI assistance**

**What you'll learn:**
- Find refactoring targets with AI
- Plan safe refactoring strategies
- Execute refactoring with behavior preservation
- Validate results with tests

**Refactoring patterns:**
- Extract Method/Class
- Simplify Conditionals
- Remove Duplication
- Improve Naming
- Replace Conditional with Polymorphism

**Outcome:** Cleaner, maintainable code with AI-assisted refactoring.

---

### [Track 4: Migration](TRACK4_MIGRATION.md)

**Migrate code between languages, frameworks, or architectures**

**What you'll learn:**
- Analyze source codebase for migration
- Create phased migration plans
- Setup target environment
- Migrate code layer by layer
- Validate equivalence and optimize

**Common migrations:**
- Python → TypeScript/Node.js
- Ruby/Rails → Node.js/Express
- JavaScript → TypeScript
- Monolith → Microservices

**Outcome:** Successful tech stack migrations with AI acceleration.

---

### [Track 5: MCP Integration](TRACK5_MCP_INTEGRATION.md)

**Connect external tools and data to enhance Copilot**

**What you'll learn:**
- Setup and configure MCP servers
- Query databases from Copilot
- Automate browsers with Playwright
- Access live documentation
- Integrate MCP with prompt files

**MCP servers covered:**
- Microsoft Learn (documentation)
- Playwright (browser automation)
- PostgreSQL (database queries)
- Other community servers

**Outcome:** Copilot connected to your development ecosystem.

---

### [Track 6: CLI & APM](TRACK6_CLI_AND_APM.md)

**Master command-line AI and package workflows for teams**

**What you'll learn:**
- Use Copilot in IDE terminal
- Command-line workflows with Copilot CLI
- Manage GitHub repos from CLI
- Package AI context with APM
- Share workflows across teams

**Key topics:**
- Terminal integration (Ctrl+I)
- Interactive and programmatic CLI modes
- GitHub repository management
- APM package creation
- Team distribution strategies

**Outcome:** Command-line mastery and packaged AI workflows.

---

## What's Next?

1. **Choose your path** above based on your needs
2. **Start with Track 1** (recommended) or jump to a specific track
3. **Complete exercises** at your own pace
4. **Apply to real projects** for immediate value
5. **Share learnings** with your team

---

## Support & Feedback

**Questions?** Check track-specific Platform Notes sections for IDE-specific guidance.

**JetBrains users?** See [JetBrains Prompt Templates](JETBRAINS_PROMPTS.md) for all tracks.

**Need quick version?** Try the [3-Hour Lite Version](EXERCISES_LITE.md).

---

**Ready to start?** → [Track 1: Agent-Driven Development](TRACK1_AGENT_DRIVEN_DEVELOPMENT.md)
