# Copilot Workshop - Advanced Track (3-Hour Version)

A streamlined version of the advanced GitHub Copilot workshop designed for a 3-hour session.

**Prerequisites:**
* Visual Studio Code installed (primary IDE)
* GitHub Copilot and Copilot Chat extensions installed
* A terminal window open within the IDE
* Docker installed (for Track 2 MCP exercises)

## Quick Start Options

### Option A: Use Your Own Project
Continue with your existing codebase and apply the techniques directly.

### Option B: Use Our Exercise Project
Clone the provided full-stack task manager application:
```bash
git clone https://github.com/EficodeDemoOrg/copilot-fullstack
cd copilot-fullstack
docker-compose up --build
```

The project includes:
- **Frontend:** React 19 + TypeScript + Vite
- **Backend:** Node.js + Express + TypeScript
- **Database:** PostgreSQL with Docker
- Pre-configured with domain structure (frontend, backend, database)
- Ready for applying custom instructions and workflows

See the [project README](https://github.com/EficodeDemoOrg/copilot-fullstack) for details.

### Option C: Bootstrap a New Project
Create a new project from scratch using AI:
1. Use **Ask mode** with **Claude Sonnet 4**
2. Add `#file:EXERCISE_APP_IDEAS.md` for inspiration
3. Prompt: *"Help me design a [type of application]. Quiz me about requirements, tech stack, and architecture."*
4. Switch to **Agent mode** and initialize the project structure

---

## Track 1: Agent-Driven Development

### Exercise 1: Project Setup & Custom Instructions

#### Part A: Base Instructions
1. **Generate base instructions:**
   * VS Code: Gear icon → "Generate Instructions for Copilot"
   * Creates `.github/copilot-instructions.md`
   * Quick review and adjust key points

2. **Essential content to include:**
   ```markdown
   - Language: [Your primary language]
   - Framework: [Your framework]
   - Testing: [Your test framework]
   - Style: [Key conventions]
   - Security: Always validate inputs, handle errors properly
   ```

#### Part B: Quick Project Blueprint
1. **Create PROJECT_BLUEPRINT.md with AI:**
   * Use **Ask mode** with **Claude Sonnet 4**
   * Prompt: *"Help me create a simple PROJECT_BLUEPRINT.md for a [type] application"*
   * Save the 1-page summary

### Exercise 2: Domain-Specific Instructions

**Focus on ONE domain only** (choose what's most relevant to you):

1. **Identify your domain with AI (Ask mode):**
   * Prompt: *"I want to create domain instructions for [BACKEND/FRONTEND/TESTS]. What glob pattern should I use? What are the key concerns?"*

2. **Create domain instruction file:**
   * VS Code: `Cmd+Shift+P` → "Chat: New Instructions file"
   * Name it: `your-domain.instructions.md`

3. **Generate with Agent mode:**
   * Switch to **Agent mode**
   * Prompt: *"Create domain instructions for [YOUR DOMAIN] using pattern [PATTERN]. Include: validation rules, error handling, and best practices. Keep it concise."*

4. **Quick validation:**
   * Open a file matching your pattern
   * Verify instructions appear in chat context

**Example Output (Backend):**
```markdown
---
applyTo: "src/api/**/*.ts"
---
# Backend API Standards

## Core Rules
- Validate ALL inputs at API boundaries
- Use consistent error format: { error, code, details? }
- Return proper HTTP status codes
- Log errors with context
- Use transactions for multi-step operations

## Security
- Sanitize inputs against injection
- Check authentication on protected routes
- Never expose stack traces

Reference: src/api/examples/user.controller.ts
```

### Exercise 3: Domain Chat Mode

1. **Create ONE specialist mode:**
   * Chat mode selector → "Configure modes" → "Create custom mode"
   * Name: `[domain]-specialist`

2. **Generate with AI (Agent mode):**
   * Prompt: *"Create a chat mode for a [DOMAIN] specialist. Include: responsibilities, boundaries, tools needed, and reference to domain instructions."*

3. **Test it:**
   * Select your new mode
   * Ask a domain question
   * Verify it stays in boundaries

**Quick Template:**
```yaml
---
description: 'Backend API specialist'
tools: ['codebase', 'terminal', 'problems']
---
You are a backend specialist.

Responsibilities:
- API design and implementation
- Database operations
- Security and validation

Boundaries:
- ONLY work on backend files (src/api/**)
- DO NOT modify frontend code

Always follow: #file:.github/instructions/backend.instructions.md
```

### Exercise 4: One Workflow Prompt

1. **Create ONE workflow prompt:**
   * `Cmd+Shift+P` → "Chat: new prompt file"
   * Choose one common task (e.g., new-endpoint, new-component, write-tests)

2. **Generate with AI:**
   * Use Agent mode
   * Prompt: *"Create a prompt file for [TASK]. Use [specialist] mode. Include: gather requirements, implementation steps, and verification."*

**Simplified Template:**
```markdown
---
mode: 'backend-specialist'
tools: ['codebase', 'terminal']
description: 'Create new API endpoint'
---
Create a new REST endpoint.

1. Ask user for:
   - Resource name
   - HTTP methods needed
   - Required fields

2. Implementation:
   - Create route handler
   - Add validation
   - Implement error handling
   - Generate tests

3. Verify:
   - Run tests
   - Check standards compliance

Follow: #file:.github/instructions/backend.instructions.md
```

### Exercise 5: Practical Implementation

**Apply everything to build ONE small feature:**

1. **Choose a simple feature:**
   * Examples: User login, List items, Create record

2. **Use your specialist mode:**
   * Switch to your domain specialist
   * Use your workflow: `/your-workflow-name`

3. **Implementation flow:**
   ```
   1. Planning (Ask mode - Claude Sonnet 4):
      "Plan implementation for [feature]"
   
   2. Implementation (Your specialist mode):
      "/your-workflow"
      → Follow the prompts
   
   3. Testing (Agent mode):
      "Generate tests for what we just created"
   
   4. Validation (Ask mode):
      "Review the code for issues"
   ```

4. **Model selection tips:**
   * Use **Claude Sonnet 4** for: Planning, reviews, complex debugging
   * Use **GPT-4.1** for: Quick code generation, simple fixes
   * Check model indicator in chat

---

## Track 2: MCP Integration

### Exercise 1: Setup Your First MCP Server

1. **Create MCP configuration:**
   * Create `.vscode/mcp.json`

2. **Add Microsoft Learn MCP (remote server):**
   ```json
   {
     "servers": {
       "microsoft.docs.mcp": {
         "type": "http",
         "url": "https://learn.microsoft.com/api/mcp"
       }
     }
   }
   ```

3. **Run and test:**
   * Click "Run" button that appears above config
   * Switch to **Agent mode**
   * Check tools menu for new MCP tools
   * Test: *"Search Microsoft docs for Azure Functions best practices"*

### Exercise 2: Choose Another MCP Server

**Option A: PostgreSQL (if you have Docker):**
```json
{
  "servers": {
    "postgres": {
      "command": "docker",
      "args": [
        "run", "-i", "--rm", "mcp/postgres",
        "postgresql://postgres:password@host.docker.internal:5432/taskmanager"
      ]
    }
  }
}
```

**Option B: GitHub MCP:**
```json
{
  "servers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"]
    }
  }
}
```

**Option C: Browse [github.com/mcp](https://github.com/mcp) and choose any server**

### Exercise 3: MCP with Prompts

1. **Create an MCP-powered prompt file:**
   * Create `.github/prompts/mcp-demo.prompt.md`

2. **Example for database MCP:**
   ```markdown
   ---
   mode: 'agent'
   tools: ['query']
   description: 'Generate database documentation'
   ---
   Use #query to explore the database schema.
   Generate a README with:
   1. Table descriptions
   2. Relationships
   3. Sample queries
   ```

3. **Example for Microsoft Learn MCP:**
   ```markdown
   ---
   mode: 'agent'
   tools: ['search_docs', 'get_doc']
   description: 'Research Azure best practices'
   ---
   Search Microsoft documentation for the user's topic.
   Provide:
   1. Best practices summary
   2. Code examples
   3. Links to full documentation
   ```

4. **Test your prompt:**
   * Type `/mcp-demo` in Agent mode
   * Provide required input
   * Observe MCP tools in action

### MCP Servers in Dev Containers

MCP servers can be configured in Dev Containers through the `devcontainer.json` file, allowing you to include MCP server configurations as part of your containerized development environment.

**Documentation:** [MCP Servers in Dev Containers](https://code.visualstudio.com/docs/copilot/customization/mcp-servers#_dev-containers)

1. **Configure in devcontainer.json:**
   ```json
   {
     "image": "mcr.microsoft.com/devcontainers/typescript-node:latest",
     "customizations": {
       "vscode": {
         "mcp": {
           "servers": {
             "playwright": {
               "command": "npx",
               "args": ["-y", "@microsoft/mcp-server-playwright"]
             }
           }
         }
       }
     }
   }
   ```

2. **Automatic setup:**
   * When the Dev Container is created, VS Code automatically writes the MCP server configurations to the remote `mcp.json` file
   * MCP servers become available automatically in your containerized environment

**Benefits:**
- Consistent setup across team members
- Version-controlled MCP configurations
- No manual setup needed on each machine

---

## Track 3: CLI & APM (Optional/Homework)

### Quick CLI Demo

1. **Install Copilot CLI:**
   ```bash
   # Follow instructions at:
   # https://docs.github.com/en/copilot/github-copilot-in-the-cli
   ```

2. **Try interactive mode:**
   ```bash
   copilot
   # Ask: "List my open PRs"
   # Ask: "What changed in the last commit?"
   ```

3. **Try programmatic mode:**
   ```bash
   copilot -p "Create a .gitignore for Node.js"
   ```

### APM Overview

1. **What is APM?**
   * Package manager for AI workflows (like npm for AI)
   * Share prompts, instructions, and workflows across teams
   * Version control for AI context

2. **Quick example:**
   ```bash
   # Install APM
   curl -sSL "https://raw.githubusercontent.com/danielmeppiel/apm/main/install.sh" | sh
   
   # Create a package
   apm init my-ai-workflows
   cd my-ai-workflows
   
   # Your workflows are now packageable and shareable!
   ```

3. **Learn more:** [github.com/danielmeppiel/apm](https://github.com/danielmeppiel/apm)

---

## Key Takeaways

### Domain-Driven AI Development
✅ **Custom Instructions:** Project-wide and domain-specific standards
✅ **Specialist Modes:** Focused AI assistants with clear boundaries
✅ **Workflow Prompts:** Reusable, automated development workflows
✅ **Model Selection:** Choose the right AI model for each task

### MCP Integration
✅ **External Tools:** Connect databases, APIs, and services to Copilot
✅ **Prompt Integration:** Combine MCP tools with workflow prompts
✅ **Extensibility:** Wide ecosystem of available MCP servers

### Best Practices
1. **Start small:** One domain, one workflow, iterate
2. **Validate often:** Test your instructions and modes work as expected
3. **Use appropriate models:** Claude for complex tasks, GPT-4 for simple generation
4. **Document patterns:** Save successful prompts and workflows

---

## Resources

* **Documentation:**
  * [Custom Instructions](https://code.visualstudio.com/docs/copilot/customization/custom-instructions)
  * [Chat Modes](https://code.visualstudio.com/docs/copilot/chat/chat-modes)
  * [MCP Servers](https://code.visualstudio.com/docs/copilot/customization/mcp-servers)
  * [Model Selection Guide](https://docs.github.com/en/copilot/using-github-copilot/asking-github-copilot-questions-in-your-ide)

* **MCP Servers:**
  * [GitHub MCP Registry](https://github.com/mcp)
  * [MCP Documentation](https://modelcontextprotocol.io/)

* **Full Workshop:**
  * See `README.md` for comprehensive exercises and examples
