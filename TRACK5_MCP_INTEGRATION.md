# Track 5: Model Context Protocol (MCP) Integration

Connect external tools, databases, and APIs to enhance Copilot's capabilities with real-time context.

**Duration:** 2-3 hours

---

## Cross-Track Enhancements

💡 **Enhanced with Track 1:** Use domain specialists with MCP tools for context-aware workflows  
📦 **Complements Track 6:** Package MCP-powered workflows with APM

---

## Prerequisites

**Required:**
- VS Code or Visual Studio installed
- GitHub Copilot and Copilot Chat extensions
- Docker installed (for database MCP servers) OR Node.js 18+ (for npm-based servers)

**Recommended (Optional):**
- Track 1 completed (domain prompts can leverage MCP tools)

---

## Workshop Flow

```mermaid
graph LR
    A[Setup MCP] --> B[Microsoft Learn MCP]
    B --> C[Playwright MCP]
    C --> D[PostgreSQL MCP]
    D --> E[Integrate with Workflows]
    
    Note[Works standalone or with Track 1]
```

---

## Quick-Start (15 minutes)

Get started with MCP:

1. **Setup Microsoft Learn MCP** (5 min)
   - Create `.vscode/mcp.json` with Microsoft Learn server config
   - Run the server
2. **Query Microsoft Docs** (5 min)
   - Agent mode: *"Search Microsoft docs for Azure Container Apps CLI commands and fetch full doc"*
3. **Explore MCP tools** (5 min)
   - Check tools menu to see available MCP server tools

**Ready for full integration?** Continue with the full exercises below.

---

## What is MCP?

**Model Context Protocol (MCP)** provides a standardized way for Copilot to interact with external tools, services, and systems in real-time.

### Key Concepts

- **MCP Servers:** Programs that expose tools, resources, and prompts to AI assistants
- **Local & Remote:** Run as Docker containers, Node.js processes, or remote HTTP services
- **Real-Time Access:** Query databases, browse APIs, fetch documentation, control browsers
- **Curated Registry:** [GitHub MCP Registry](https://github.com/mcp) offers verified servers
- **Tool Integration:** MCP tools appear in Agent mode's tools menu

### Use Cases

- **Database Queries:** Query PostgreSQL, MySQL, MongoDB directly from chat
- **API Exploration:** Test APIs with Postman MCP
- **Documentation:** Access live Microsoft Learn, GitHub docs
- **Browser Automation:** Control browsers with Playwright MCP
- **Cloud Services:** Interact with AWS, Azure, Terraform
- **Development Tools:** Integrate with GitHub, Atlassian, JFrog

---

## Exercise 1: Microsoft Learn MCP Server

**Purpose:** Access Microsoft's official documentation directly from Copilot.

### Steps

#### 1. Create MCP Configuration File

**VS Code:** Create `.vscode/mcp.json`  
**Visual Studio:** Create `<SOLUTIONDIR>/.mcp.json`

[VS Code MCP Documentation](https://code.visualstudio.com/docs/copilot/customization/mcp-servers)  
[Visual Studio MCP Documentation](https://learn.microsoft.com/en-us/visualstudio/ide/mcp-servers?view=vs-2022#configuration-example-with-a-github-mcp-server)

#### 2. Add Microsoft Learn MCP Configuration

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

#### 3. Run the Server

- In VS Code: Click the **run icon** that appears above the server definition in `mcp.json`
- Check the **MCP Servers** view in the sidebar

#### 4. Test in Agent Mode

1. **Open Copilot Chat** in **Agent mode**
2. **Check tools menu** - you should see Microsoft Learn MCP tools
3. **Prompt:** *"What are the Azure CLI commands to create a container app with a managed identity? Search Microsoft docs and fetch full doc."*

**Observe:** Copilot uses the MCP tool to fetch live documentation

---

## Exercise 2: Playwright MCP Server

**Purpose:** Automate browser interactions directly from Copilot.

**Requirements:** Node.js 18 or newer

### Steps

#### 1. Add Playwright MCP Configuration

Browse to [GitHub MCP Registry](https://github.com/mcp) → Find Playwright MCP server

Add to `mcp.json`:

```json
{
  "servers": {
    "playwright": {
      "command": "npx",
      "args": ["-y", "@microsoft/mcp-server-playwright"]
    }
  }
}
```

#### 2. Run the Server

Click the run icon above the Playwright server config

#### 3. Test Browser Automation

**Agent mode → Check tools menu** (should see `navigate`, `click`, `fill`, `screenshot`, etc.)

**Prompt:**
```
Browse to google.com. Enter keywords "GitHub Copilot" and click the search button. 
Wait for search results to load. Extract and return the titles and URLs of the first five search results.
```

**Observe:** Copilot controls the browser through Playwright

### Optional: Create QA Expert Custom Agent (VS Code only)

**With Track 1 background:** Create a specialized testing agent

**Create `.github/agents/qa-explorer.agent.md`:**

```yaml
---
description: 'QA specialist for exploratory testing'
tools: ['navigate', 'click', 'fill', 'screenshot', 'snapshot']
---
You are a QA specialist focused on exploratory testing and user experience validation.

## Responsibilities:
- Perform exploratory testing of web applications
- Identify UI/UX issues and edge cases
- Validate user workflows end-to-end
- Document bugs and unexpected behaviors

## Testing Approach:
1. Understand the feature being tested
2. Create test scenarios based on user stories
3. Test happy paths and edge cases
4. Capture screenshots of issues
5. Document findings clearly

## Boundaries:
- DO NOT modify application code
- Focus on testing and validation only
- Use browser tools from Playwright MCP

Follow project testing standards and user stories.
```

**Create `.github/prompts/exploratory-test.prompt.md`:**

```markdown
---
mode: 'qa-explorer'
tools: ['navigate', 'click', 'fill', 'screenshot', 'snapshot', 'wait_for']
description: 'Perform exploratory testing session'
---
Conduct an exploratory testing session for the application.

Ask user for:
1. Application URL to test
2. Feature or workflow to focus on
3. Any specific user scenarios or edge cases to explore

Testing procedure:
1. Navigate to the application
2. Explore the user interface systematically
3. Test positive and negative scenarios
4. Verify accessibility features
5. Check responsive behavior
6. Document any issues found with screenshots
7. Provide a summary of findings

For each issue found, include:
- Steps to reproduce
- Expected vs actual behavior
- Screenshot evidence
- Severity assessment
```

**Test:** Switch to **qa-explorer** agent → Run `/exploratory-test` → Provide app URL

---

## Exercise 3: PostgreSQL MCP Server

**Purpose:** Query databases directly from Copilot for schema exploration and data analysis.

**Requirements:** Docker (preferred) or Node.js + local PostgreSQL

### Steps

#### 1. Setup Sample Database

```bash
cd mcp-exercise
docker compose up db
```

This starts a PostgreSQL database with sample library data (books, users, loans).

#### 2. Add PostgreSQL MCP Configuration

**Windows and Mac:**
```json
{
  "servers": {
    "postgres": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "mcp/postgres",
        "postgresql://postgres:postgres@host.docker.internal:5432/library_app"
      ]
    }
  }
}
```

**Linux:**
```json
{
  "servers": {
    "postgres": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "mcp/postgres",
        "postgresql://postgres:postgres@172.17.0.1:5432/library_app"
      ]
    }
  }
}
```

#### 3. Run the PostgreSQL MCP Server

Click run icon above the postgres config in `mcp.json`

#### 4. Query Database from Copilot

**Agent mode → Check tools menu** (should see `query` tool enabled)

**Prompts to try:**
1. *"#query what's the schema of my database?"*
2. *"Show all book loans"*
3. *"Show all users who have at least one loan"*
4. *"Which books are currently checked out? Show book title, borrower name, and due date."*
5. *"Generate an ER diagram of this database schema using Mermaid"*

**Observe:** Copilot executes SQL queries in real-time

---

## Exercise 4: Integrate MCP with Prompt Files

**Purpose:** Automate common MCP-powered workflows.

**With Track 1 background:** Combine domain prompts with MCP tools

### Create ER Diagram Generator Prompt

**Create `.github/prompts/er-diagram.prompt.md`:**

```markdown
---
mode: 'agent'
tools: ['query']
description: 'Generate or update the ER diagram of the database using Mermaid syntax.'
---
Use #query tool to get description of the PostgreSQL database schema.
Then generate an Entity Relationship diagram based on the schema. Use Mermaid
syntax to create the diagram. Create the diagram in file called ER.md.
Create the file if it doesn't exist yet or update the existing file.
```

**Test:**
- Agent mode → Type `/er`
- Copilot queries the database and generates ER.md with Mermaid diagram
- Push to GitHub to view rendered diagram

### Create Database Documentation Prompt

**Create `.github/prompts/db-docs.prompt.md`:**

```markdown
---
mode: 'agent'
tools: ['query']
description: 'Generate comprehensive database documentation'
---
Query the PostgreSQL database to:
1. List all tables with descriptions
2. For each table, document columns (name, type, constraints)
3. Document relationships (foreign keys, indexes)
4. Identify any missing indexes on foreign keys
5. Suggest potential performance improvements

Generate DATBASE_DOCS.md with findings.
```

**Test:** `/db-docs` → Reviews database and generates documentation

---

## MCP Servers in Dev Containers

**Purpose:** Include MCP servers in your team's Dev Container setup.

[MCP Servers in Dev Containers Documentation](https://code.visualstudio.com/docs/copilot/customization/mcp-servers#_dev-containers)

### Add MCP to devcontainer.json

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
          },
          "postgres": {
            "command": "docker",
            "args": [
              "run", "-i", "--rm", "mcp/postgres",
              "postgresql://postgres:postgres@host.docker.internal:5432/mydb"
            ]
          }
        }
      }
    }
  }
}
```

**Benefits:**
- ✅ Consistent MCP setup across team
- ✅ Version-controlled configuration
- ✅ Automatic setup on container build
- ✅ No manual configuration per machine

---

## Explore Other MCP Servers

Browse [GitHub MCP Registry](https://github.com/mcp) for more servers:

### Development Tools
- **GitHub MCP:** Manage repositories, issues, PRs from Copilot
- **Atlassian MCP:** Jira and Confluence integration
- **Postman MCP:** Test and document APIs
- **JFrog MCP:** Artifact management

### Cloud & Infrastructure
- **Terraform MCP:** Infrastructure as code management
- **AWS MCP:** AWS resource management
- **Azure MCP:** Azure resource management

### Databases
- **MySQL MCP:** Query MySQL databases
- **MongoDB MCP:** Query MongoDB collections
- **Redis MCP:** Redis cache operations

### Experimentation

**Prompt (Agent mode):**
```
Browse the GitHub MCP Registry. Suggest 3 MCP servers that would be most useful 
for our project based on:
#file:PROJECT_BLUEPRINT.md
```

---

## Troubleshooting

### PostgreSQL MCP Connection Issues

**Check configuration:**
- Windows/Mac: Use `host.docker.internal`
- Linux: Use `172.17.0.1` (Docker bridge IP)

**Kill previous containers:**
```bash
docker ps | grep mcp
docker stop <container_id>
```

**No Docker? Use Node.js:**
```json
{
  "servers": {
    "postgres": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-postgres",
        "postgresql://localhost/mydb"
      ]
    }
  }
}
```

**Alternative: Use Podman or install PostgreSQL locally**

### MCP Server Not Showing in Tools Menu

1. Verify server is running (check MCP Servers view)
2. Restart VS Code
3. Check Agent mode is selected
4. Review server logs for errors

---

## Platform Notes

### VS Code

Full MCP support with visual server management, tools menu, and integration with custom agents and prompt files.

### Visual Studio

MCP support available - use `.mcp.json` in solution directory. See [Visual Studio MCP Documentation](https://learn.microsoft.com/en-us/visualstudio/ide/mcp-servers?view=vs-2022).

### JetBrains IDEs

MCP support varies by IDE version. Check [JetBrains documentation](https://www.jetbrains.com/help/) for your specific IDE. As alternative, use [JETBRAINS_PROMPTS.md](JETBRAINS_PROMPTS.md) templates that reference MCP capabilities where available.

---

## Key Takeaways

✅ **Real-Time Context:** MCP brings live data into AI conversations  
✅ **Verified Servers:** Use GitHub MCP Registry for curated, safe servers  
✅ **Powerful Workflows:** Combine MCP tools with prompt files for automation  
✅ **Team Collaboration:** Share MCP configs via Dev Containers  
✅ **Safety First:** Review MCP server code before running - they execute with your permissions

---

## Navigation

[← Previous: Migration](TRACK4_MIGRATION.md) (Optional) | [🏠 Home](README.md) | [Next: CLI & APM →](TRACK6_CLI_AND_APM.md) (Optional)
