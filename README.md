# Copilot workshop - Advanced Track

Exercises for the GitHub Copilot Workshop - Advanced Track. 

**Prerequisites:**
* Visual Studio Code installed (primary IDE for these exercises)
* This repository cloned
* GitHub Copilot and Copilot Chat extensions installed
* A terminal window open within the IDE
* Docker or Podman installed (MCP exercises only)
* Python 3.11+ and [uv](https://docs.astral.sh/uv/) installed (Spec Kit exercise)
* Python 3.10+ or Node.js 18+ installed (Build Your Own MCP Server exercise)

## Part 1 exercises
Individually executed exercises in the first workshop.

### Create a new project
* **Purpose:** Setup a new project to work with for the following exercises
* **Steps:**
    1. Decide on a topic for your application. If you need inspiration, [see here](EXERCISE_APP_IDEAS.md).
    2. Use programming languages and a tech stack you're familiar with to work on your project. Initialize the project using npm, dotnet, create-react-app, mvn archetypes, etc. to initialize a new project. 
    3. Initialize a local git repository for the project.
    4. Create a .gitignore file for the project. This is important since Copilot automatically [ignores files listed in .gitignore from the workspace index](https://code.visualstudio.com/docs/copilot/reference/workspace-context#_what-content-is-included-in-the-workspace-index)

### Custom instructions
* **Purpose:** Create a custom instructions file for the project to help Copilot understand your coding conventions.
* **Steps:**
* *In VSCode:*
    1. Look for the **gear icon** in the VS Code interface (usually in the status bar or activity bar)
    2. Click on the gear icon and select **"Generate Instructions for Copilot"**
    3. VS Code will analyze your codebase and create a `.github/copilot-instructions.md` file
    4. Wait for the generation process to complete

* *In JetBrains:*
    1. Create a folder called `.github` at the root of your project
    2. Create a file called `copilot-instructions.md` in the new folder. This is your project-specific *custom instructions file* that should be added to version control and shared among the team members.
    3. Ask Copilot to generate contents for the file using Ask mode (select "Ask" in the chat window). To get better results, explain to Copilot what kind of project you are planning to build.
    4. See Copilot's suggestions and adjust them according to your preferences. Add, for example, the following:
        - High-level description of the purpose of the application
        - Key technologies and frameworks
        - Project structure
        - Variable, function, etc. naming conventions
        - (Patterns)
    5. Close the custom instructions file. Ask something about your project from Copilot and make sure that the custom-instructions.md is added automatically to every prompt you make.

### Additional Custom Instructions Files
* **Purpose:** Create an additional custom instructions file that targets specific parts of the codespace.
* **Steps:**
* *In VSCode:* 
    1. Open the command palette (cmd+shift+p)
    2. Start typing "Chat: New Instructions file" and select the command
    3. Select '.github/instructions' as the location for the file
    4. Give a descriptive name for the file, e.g. "backend", "javascript" etc.
    5. Use the applyTo selector to target the instructions to a specific part of the code base, e.g. "applyTo: app/backend/**/*.ts"
    6. Add some suitable custom instructions to the file
    7. Make a prompt targeting a file that matches the selector, and check that the instructions file was included in the context.
* *In JetBrains:*
    1. Create a folder called `instructions` inside of the `.github` folder at the root of your project
    2. Create a new file, For example `backend.instructions.md`.
    3. Add the following to the top of the file:
        ```md
        ---
        applyTo: src/backend/**/*.ts
        ---
        ```
    4. Add some suitable custom instructions to the file
    5. Make a prompt targeting a file that matches the selector, and check that the instructions file was included in the context.

### Custom Chat Modes
> Custom chat Modes are only available in VS Code at the moment.
* **Purpose:** Create a custom chat mode tailored for specific tasks
* **In VSCode:** 
* **Steps:**
    1. Read the [documentation](https://code.visualstudio.com/docs/copilot/chat/chat-modes#_custom-chat-modes) about the custom chat modes in VS Code
    2. In the Copilot chat mode selector, select "Configure modes"
    3. Select "Create new custom chat mode file"
    4. Create a chat mode that for making an implementation plan for a new feature.
    5. Add tools that could benefit the use case, such as fetch, codebase, usages.
    6. Add suitable instructions in the body of the file, e.g. "Don't make any code edits, just generate a plan."

### Prompt files
* **Purpose:** Use prompt files to avoid repeating yourself when writing prompts for specific kinds of tasks and workflows.
* **Steps:**
* *In VScode:*
    1. In VS Code, use the combination Shift+Command/Control+P to open the command palette.
    2. Type Chat: new prompt file
    3. Select prompts
    4. Give a name to the prompt file
    5. Think about what kind of prompt files would be useful at your work and create a prompt file according to your needs.
    6. Test your prompt file in the chat by typing / and the name of your prompt file.
    7. See the [documentation](https://code.visualstudio.com/docs/copilot/copilot-customization#_prompt-file-structure) for instructions on how to use, for example, user input in prompt files.
    
* *In JetBrains:*
    1. Create a folder called `prompts` inside of the `.github` folder at the root of your project
    2. Create a new file, For example `new-component.prompt.md`.
    3. Think about what kind of prompt files would be useful at your work and create a prompt file according to your needs.
    4. Test your prompt file in the chat by typing / and the name of your prompt file.
    
Example prompt file:
```md
---
mode: 'agent'
tools: ['githubRepo', 'codebase']
description: 'Generate a new React form component'
---
Your goal is to generate a new React form component based on the templates in #githubRepo contoso/react-templates.

Ask for the form name and fields if not provided.

Requirements for the form:
* Use form design system components: [design-system/Form.md](../docs/design-system/Form.md)
* Use `react-hook-form` for form state management:
* Always define TypeScript types for your form data
* Prefer *uncontrolled* components using register
* Use `defaultValues` to prevent unnecessary rerenders
* Use `yup` for validation:
* Create reusable validation schemas in separate files
* Use TypeScript types to ensure type safety
* Customize UX-friendly validation rules
```

### Implement features using Agent mode
* **Purpose:** Use agent mode to implement a couple of use cases in your application.
* **Steps:**
    1. Decide on the first UI elements, API endpoints, or other features you want to implement. Use Copilot's Agent mode to implement the features.
    2. Try out different models while working with agent mode:
    3. See [GitHub Documentation](https://docs.github.com/en/copilot/using-github-copilot/ai-models/choosing-the-right-ai-model-for-your-task) for recommendations on which model to use for different tasks. Check out also the [model multipliers](https://docs.github.com/en/copilot/managing-copilot/monitoring-usage-and-entitlements/about-premium-requests#model-multipliers) to understand premium request quotations and costs in the new subscription models.
        * For example, use Claude Sonnet 4 for Complex problem-solving challenges and sophisticated reasoning
        * GPT-4.1 for Fast, accurate code completions and explanations with simpler tasks.
    4. Pay attention to the proactive and interactive nature of Agent mode:
        * Agent mode uses the search index to find relevant content from the workspace
        * If it needs to use a tool or run something in the terminal, it asks for permission from the user
        * It notices if it produces compilation errors and proposes fixes for them automatically
        * Depending on the situation, it could also modify or make additions to unit tests or even try to run them

### Spec-Driven Development with Spec Kit
* **Purpose:** Learn a structured methodology for building applications using AI agents through specifications rather than direct coding
* **Prerequisites:**
    * Completed "Implement features using Agent mode" exercise
    * Python 3.11+ and [uv](https://docs.astral.sh/uv/) installed
    * Git installed

#### What is Spec-Driven Development?

Spec-Driven Development flips traditional software development: instead of writing code first and documentation later, you create executable specifications that directly generate working implementations. Specifications become the source of truth, not just scaffolding.

#### Steps:

1. **Learn about Spec Kit:** Read the [Spec Kit documentation](https://github.com/github/spec-kit) and [Spec-Driven Development methodology](https://github.com/github/spec-kit/blob/main/spec-driven.md)

2. **Install Spec Kit:**
   ```bash
   uv tool install specify-cli --from git+https://github.com/github/spec-kit.git
   specify check
   ```

3. **Initialize a project:**
   ```bash
   # New project
   specify init my-spec-project --ai copilot
   
   # Or in existing project
   cd your-project
   specify init --here --ai copilot
   ```

4. **Use Spec Kit slash commands in Copilot Chat (Agent mode):**
   * `/speckit.constitution` - Create project principles
   * `/speckit.specify` - Define what you want to build (requirements, not implementation)
   * `/speckit.plan` - Specify your tech stack and architecture
   * `/speckit.tasks` - Generate actionable task list
   * `/speckit.implement` - Execute implementation

5. **Optional quality commands:**
   * `/speckit.clarify` - Clarify underspecified areas (before planning)
   * `/speckit.analyze` - Check consistency (after tasks, before implementation)
   * `/speckit.checklist` - Generate validation checklists

6. **Experiment with different approaches:**
   * Try building a small feature end-to-end
   * Compare Spec-Driven Development vs. direct Agent mode
   * Use specifications to explore different tech stack options

**Discussion Questions:**
* When would you choose Spec-Driven Development over direct Agent mode?
* How could your team benefit from specification-first development?
* Could you combine Spec Kit with custom instructions and prompt files?
* What types of projects would be good candidates for Spec Kit?

**Learn More:**
* [Video Overview](https://www.youtube.com/watch?v=a9eR1xsfvHg)
* [Troubleshooting Guide](https://github.com/github/spec-kit#-troubleshooting)

### Debugging
* **Purpose:**  If/when you run into problems while developing your application, use Copilot's features to debug your code and understand error messages and stack traces.
* **In VSCode:** 
    1. #problems: shows the current errors and warnings in your workspace
    2. #terminalLastCommand: adds the last command and its output to the context. A great way to quickly understand failed terminal commands.
    3. #terminalSelection: select text from the terminal to add it into the prompt context. A great way to debug, for example, an error in development server output or to target the prompt to a specific line of the output of a failed terminal command.

* **Other IDEs:** 
    1. Use your IDE's error/warning panel to view current issues.
    2. Use Copilot Chat to analyze terminal output or error messages.
    3. Select relevant output and ask Copilot for help understanding or fixing issues

### Using Copilot in CLI and VSCode Terminal
* **Purpose:**  You can use Copilot with the GitHub CLI and in VSCode terminal to get suggestions and explanations for the command line.
* **Prerequisites:** Copilot CLI installed and working from basic exercises above

* **In IDE Terminal:** 
    1. Open Inline chat (Ctrl + I for Windows) in the terminal
    2. Ask questions about commands or suggestions to run in the terminal.
* **In command line** 
    1. See the [documentation](https://docs.github.com/en/copilot/how-tos/set-up/install-copilot-cli) for instructions to install the `copilot` CLI. Note: this is different from the `gh copilot` extension.
    2. Start an interactive session by running `copilot` in your terminal.
    3. Try asking Copilot to perform some simple tasks. For example:
        * `List my open pull requests`
        * `What are the git branches in this project?`

#### Advanced Copilot CLI Exercises

* **Steps:**
    1. Try programmatic mode by passing prompts directly on the command line:
        ```bash
        copilot -p "List my open PRs"
        copilot -p "Show me the last 5 changes made to the README.md file"
        ```
    2. Experiment with automatic tool approval for non-destructive commands:
        ```bash
        copilot -p "List all files in this directory" --allow-tool 'shell'
        ```

#### GitHub Repository Management
* **Steps:**
    1. Start an interactive session by running `copilot` in your terminal.
    2. Use Copilot CLI to manage GitHub repositories and issues:
        * `Create an issue for improving the documentation in this repository`
        * `List all open issues assigned to me in this repository`
        * `Check the changes made in the most recent pull request`
    3. Try file management and pull request creation:
        * `Create a new file called CONTRIBUTING.md with basic contribution guidelines`
        * `Create a pull request to add the new CONTRIBUTING.md file`
    4. Work with GitHub Actions:
        * `List any Actions workflows in this repo`
        * `Create a simple GitHub Actions workflow that runs tests on pull requests`

#### Project Development Workflows
* **Steps:**
    1. Use Copilot CLI for local development tasks:
        * `Analyze the code quality in this project and suggest improvements`
        * `Create a .gitignore file appropriate for this project type`
        * `Generate a package.json file for a Node.js project with common dependencies`
    2. Try code review and analysis:
        * `Review the last commit and explain what changes were made`
        * `Find any TODO comments in the codebase and list them`
        * `Suggest improvements to the project structure`

#### Model Selection and Feedback
* **Steps:**
    1. Explore different AI models:
        * Use `/model` command in interactive mode to switch between available models
        * Compare responses from different models for the same prompt
        * Note the premium request usage for different models
    2. Explore slash commands:
        * Use `/mcp` to see available MCP servers
        * Try other available slash commands in interactive mode

### Agent Package Manager (APM) - Packaging AI Workflows
* **Purpose:** Learn to package and share AI agents, context, and workflows using APM, the "npm for AI agents"
* **What is APM:**
    * APM (Agent Package Manager) allows you to package AI workflows, custom instructions, and context into reusable modules
    * Similar to npm for Node.js, but for AI agents and workflows
    * Enables sharing and composing AI context across teams and projects
    * Check documentation for more info: [APM Documentation](https://github.com/danielmeppiel/apm)

* **Steps:**
    1. **Create a new project directory:**
        ```bash
        mkdir apm-exercise && cd apm-exercise
        ```
    2. **Install APM CLI:**
        ```bash
        # Set your GitHub token (get from github.com/settings/personal-access-tokens/new)
        export GITHUB_COPILOT_PAT=your_fine_grained_token_here
        
        # Install APM CLI
        curl -sSL "https://raw.githubusercontent.com/danielmeppiel/apm/main/install.sh" | sh
        ```

    3. **Set up APM runtime:**
        ```bash
        # Set up GitHub Copilot CLI with native MCP support
        apm runtime setup copilot
        ```

    4. **Create your first AI package:**
        ```bash
        # Initialize a new APM project
        apm init my-ai-package && cd my-ai-package
        
        # Install dependencies
        apm install
        ```

    5. **Explore the package structure:**
        * Examine the generated `apm.yml` file (similar to `package.json`)
        * Look at the `.prompt.md` files (agent workflows)
        * Review `.instructions.md` files (context and rules)
        * Check out the `apm_modules/` directory (dependencies)

    6. **Create custom workflows:**
        * Create a new `.prompt.md` file for a specific development task that you would like to automate
        * Add custom `.instructions.md` files for your project's coding standards
        * Create a new `.chatmode.md` file for a specialized chat mode that fits your workflow

    7. **Install existing APM packages:**
        ```bash
        # Try installing community packages
        apm install danielmeppiel/compliance-rules
        apm install danielmeppiel/design-guidelines
        
        # List installed dependencies
        apm deps list
        ```

    8. **Compile for compatibility:**
        ```bash
        # Generate AGENTS.md for compatibility with other AI tools
        apm compile
        ```

    9. **Run packaged workflows:**
        ```bash
        # Run your packaged workflows
        apm run start --param name="<YourGitHubHandle>"
        ```

* **Discussion:**
    * How does APM compare to your current approach to sharing AI context within your team?
    * What development workflows or coding standards could benefit from being packaged as APM modules?
    * How could APM help with consistency across different projects in your organization?
    * What are the advantages of treating AI context and workflows as packageable dependencies?

* **Learn More:**
    * [APM Documentation](https://github.com/danielmeppiel/apm/blob/main/docs/README.md)
    * [Agent CLI Runtimes](https://danielmeppiel.github.io/awesome-ai-native/docs/tooling/#agent-cli-runtimes)
    * [Getting Started Guide](https://github.com/danielmeppiel/apm/blob/main/docs/getting-started.md)
    * [Core Concepts](https://github.com/danielmeppiel/apm/blob/main/docs/concepts.md)
    * [AI-Native Development Guide](https://danielmeppiel.github.io/awesome-ai-native)


## Model Context Protocol Exercises

### MCP Introduction and Path Selection

* **Purpose:** Understand how MCP servers work and choose your learning path
* **IDE Support:** Generally available (GA) in Copilot Chat for Visual Studio Code, in public preview for Copilot in Visual Studio, JetBrains, Eclipse, and Xcode.
* **MCP Overview:**
    * MCP (Model Context Protocol) servers provide a standardized way to interact with various tools, services, and systems.
    * An MCP server is run locally on the developer's workstation, e.g., as a Docker container (remote servers are also possible using HTTP)
    * Developers can initialize and manage MCP servers directly from their IDE or command-line tools.
    * MCP allows seamless integration of external tools and data sources with Copilot. They support multiple types of integrations, including databases, APIs, and cloud services.
    * MCP servers enable real-time exploration, execution, and interaction with connected resources.
    * A wide variety of MCP servers are already available. **Caution must be taken when running MCP servers** found on the web because of potentially insecure or malicious implementations.

**Choose Your Path:**

* **Path A: New to MCP?** → Start with "PostgreSQL MCP Server" below to learn by using an existing MCP server
* **Path B: Familiar with MCP?** → Skip to "Build Your Own MCP Server" to create a custom server from scratch

---

### Path A: Using Existing MCP Servers

#### PostgreSQL MCP Server Setup

* **Purpose:** Learn how to set up and use an existing MCP server
* **Steps:**
* *VSCode:*
    1. VS Code => Shift+Control+P (Win) or Shift+CMD+P (Mac)
    2. \> MCP: Add server...
    3. Docker image => mcp/postgres
    4. "Install mcp/postgres from mcp?" => select "Allow"
    5. Postgres URL:
        * Mac: postgresql://postgres:postgres@host.docker.internal:5432/library_app
        * Codespaces / Linux: postgresql://postgres:postgres@172.17.0.1:5432/library_app
    6. If you are next asked for port number, database name, username, and password: use values from the URL above
        * Port: 5432
        * Database name: library_app
        * Username: postgres
        * Password: postgres
    7. "Enter Server ID" => "Postgres"
    8. "Choose where to save the configuration" => select "Workspace settings"
    9. mcp.json should be opened by the IDE
    10. Start the server by clicking on the play button in mcp.json
    11. The tools provided by the MCP server should now be available in the tools menu in the Agent mode prompt box (make sure Agent mode is selected, then click on the wrench icon). You can enable or disable tools by ticking/unticking the boxes.

* *JetBrains:*
    1. Open Settings -> tools -> MCP Server and enable MCP Servers
    2. Open GitHub Copilot Chat and switch to Agent mode
    3. Make sure Docker is running
    4. Click the wrench icon, next to model selection, to open the tools menu
    5. Click "+ Add More Tools"
    6. A mcp.json file will be created.
    7. Add the following and save changes
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

        * Linux
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
                        "postgresql://postgres:postgres@172.17.0.1:5432/library_app"]
                    }
            }
        }
        ```
    8. Click the tools icon again — you should now see `query` listed under newly created postgres MCP Server
    9. Once the mcp.json file is created and saved, GitHub Copilot will attempt to launch the configured servers automatically. You should see logs appear in the GitHub Copilot MCP Log window.

#### Testing the PostgreSQL MCP server
* **Purpose:** Try out and test the PostgreSQL MCP server against a database
* **Prerequisites:**
    * Docker installed.
* **Steps:**
    * cd mcp-exercise
    * `docker compose up db`
    * Copilot Chat => Agent Mode Selected
    * Make sure from the tools menu that the Postgres MCP Server and its tool "query" are enabled
    * Prompt: `#query what's the schema of my database?`
    * Prompt: `#query List all tables in the database`
    * Prompt: `#query Show all book loans`
    * Prompt: `#query Show all users who have at least one loan`
    * Think about how the information provided by the MCP server could be utilized in prompts. How could it help build complete, AI-powered development flows?

#### Using PostgreSQL MCP Server together with prompt files
* **Purpose:** Use a prompt file to automate the generation of an ER diagram based on the database schema.
* **Steps:**
    1. Create a new prompt file (see the instructions above)
    2. Copy-paste this into the file:
    ```md
    ---
    mode: 'agent'
    tools: ['query']
    description: 'Generate or update the ER diagram of the database using Mermaid syntax.'
    ---
    Use the #query tool to get a description of the PostgreSQL database schema.
    Then generate an Entity Relationship diagram based on the schema. Use Mermaid
    syntax to create the diagram. Create the diagram in a file called ER.md.
    Create the file if it doesn't exist yet or update the existing file.
    ```
    3. Test the prompt file by typing `/er` in agent mode. Refine the prompt if Copilot is not able to fulfill the purpose of the prompt.
    4. If you want to see the resulting Mermaid diagram, push the file to a GitHub repository and open the file.

---

### Path B: Build Your Own MCP Server

* **Purpose:** Learn how MCP servers work by building one from scratch. This demystifies what MCP tools actually do and how they extend Copilot's capabilities.
* **Prerequisites:** 
    * Python 3.10+ OR Node.js 18+ installed
    * Completed the PostgreSQL MCP exercise

#### Steps:

1. **Learn the basics:** Read the official documentation on building MCP servers: [MCP Documentation - Build a Server](https://modelcontextprotocol.io/docs/develop/build-server). The documentation provides complete examples for both Python and TypeScript/Node.js.

2. **Choose your project idea:**
    * **Project File Analyzer**: Count lines of code, find TODOs, list recent changes
    * **Mock Data Generator**: Generate test data for users, products, transactions
    * **Development Helper**: Check dependencies, environment variables, system status
    * **Custom Calculator**: Unit conversions, time zones, specialized calculations
    * **Or create your own** based on your daily development needs

3. **Build your server:** Follow the MCP documentation to create your server using either Python (`mcp` library) or TypeScript/Node.js (`@modelcontextprotocol/sdk`).

4. **Add to IDE:**

    4.1. **In VSCode:**
    * Open Command Palette (Shift+Cmd+P on Mac / Shift+Ctrl+P on Windows)
    * Type: `MCP: Add server...`
    * Select `Custom command`
    * Enter your server command:
        * **Python (uv):** Command: `uv`, Arguments: `--directory /PATH/TO/your-server run server.py`
        * **Node.js:** Command: `node`, Arguments: `/PATH/TO/your-server/dist/index.js`
    * Enter a Server ID (e.g., "my-tools")
    * Choose "Workspace settings"
    * Start the server using the play button in the generated `mcp.json`

    4.2. **In JetBrains:**
    * Open Settings -> tools -> MCP Server and enable MCP Servers
    * Open GitHub Copilot Chat and switch to Agent mode
    * Click the wrench icon, next to model selection, to open the tools menu
    * Click "+ Add More Tools"
    * A `mcp.json` file will be created.
    * Add the configuration for your server. For example, for a Python server:
        ```json
        {
            "servers": {
                "my-python-server": {
                    "command": "uv",
                    "args": [
                        "--directory",
                        "/PATH/TO/YOUR-SERVER-DIRECTORY",
                        "run",
                        "server.py"
                    ]
                }
            }
        }
        ```

5. **Test your server:**
    * Reload VS Code (Cmd+Shift+P → "Developer: Reload Window")
    * JetBrains: Restart IDE if needed
    * Open Copilot Chat in Agent mode
    * Click the wrench icon (🔧) and verify your tools appear
    * Enable your custom tools
    * Test with relevant prompts based on your implementation

6. **Troubleshooting:**
    * Ensure paths in `mcp.json` are absolute paths
    * Check Output panel (View → Output → GitHub Copilot) for errors
    * JetBrains: Check "GitHub Copilot MCP Log" tool window
    * Verify the server runs without errors when started manually
    * Make sure the server is started (green play button in mcp.json)

**Discussion Points:**
* How does building an MCP server differ from regular function development?
* What internal tools at your company could benefit from MCP integration?
* When would you choose MCP servers vs. custom chat modes or prompt files?

---

### Exploring Other MCP Servers

After completing either Path A or Path B, explore these additional MCP servers:

#### Playwright MCP
* **Purpose:** Enable the agent mode to use browser
* **Steps:**
    1. Read the [documentation](https://github.com/microsoft/playwright-mcp) for the Playwright MCP server
    2. Add Playwright MCP in this project
    3. Crete queries that use the web browser. Ideas:
        * Login to your test environment
        * Browse to https://duckduckgo.com/, make a query, count the number of search results.

#### GitHub MCP
* **Purpose:** Connect AI tools directly to GitHub's platform for repository management, issue/PR automation, and code analysis
* **Steps:**
    1. Read the [documentation](https://github.com/github/github-mcp-server) for GitHub MCP server
    2. Add the GitHub MCP to your project.
    3. Configure toolsets based on your needs (repos, issues, pull_requests, actions, code_security, etc.)
    4. Test with prompts like "List my recent repositories", "Show open issues in this repo", or "Analyze recent commits"
    5. Think about how GitHub integration could enhance your development workflow through AI-powered repository insights

#### Other MCP Servers
* **Purpose:** Explore and try out other MCP servers
* **Steps:**
    1. Browse to http://mcp.so
    2. Take a look at some of the other MCP servers available. Try to find ones that you could use to integrate Copilot with your development tools. Some suggestions:
        * [GitHub](https://mcp.so/server/github/modelcontextprotocol)
        * [GitLab](https://mcp.so/server/gitlab/modelcontextprotocol)
        * [Perplexity](https://mcp.so/server/perplexity/ppl-ai)
        * [Slack](https://mcp.so/server/slack/modelcontextprotocol)

### PostgreSQL MCP Troubleshooting

Trouble using or connecting to the PostgreSQL MCP server?

1. Make sure the configuration in mcp.json looks like this:

* Windows and Mac
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

* Linux
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
                    "postgresql://postgres:postgres@172.17.0.1:5432/library_app"]
                }
        }
    }
    ```
2. Make sure the previous MCP Docker containers are stopped before running the server again:
    ```bash
    % docker ps | grep mcp                                          
    db599e110c3f   mcp/postgres                           "node dist/index.js …"   2 hours ago    Up 2 hours
    % docker stop db599e110c3f
    ```

#### No Docker?
If you don't have Docker installed and can't install it, you can use npm to run the server.

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
To run the database locally without Docker, you can either use Podman to run the docker-compose.yml file
or install the database on your workstation using PostgreSQL installers. You can also use any test database
you are currently using for work.
