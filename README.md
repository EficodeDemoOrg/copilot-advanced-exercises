# Copilot workshop - Advanced Track

Exercises for the GitHub Copilot Workshop - Advanced Track. The exercises consist of two parts:
* Part 1: Individually completed exercises Workshop 1
* Part 2: Hackathon carried out in Workshop 2 in small groups, each group trying to complete an application using Copilot features within given time limit

**Prerequisites:**
* Visual Studio Code installed (primary IDE for these exercises)
* This repository cloned
* GitHub Copilot and Copilot Chat extensions installed
* A terminal window open within the IDE
* Docker or Podman installed (MCP exercises only)

## Part 1 exercises
Individually completed exercises for part 1 of the one-day workshop.

### Create a new project
* **Purpose:** Set up a new project to work with for the following exercises
* **Steps:**
    1. Decide on a topic for your application. If you need inspiration, [see here](EXERCISE_APP_IDEAS.md).
    2. Use programming languages and a tech stack you're familiar with to work on your project. Initialize the project using npm, dotnet, create-react-app, mvn archetypes, etc. to initialize a new project. 
    3. Initialize a local git repository for the project.
    4. Create a .gitignore file for the project. This is important since Copilot automatically [ignores files listed in .gitignore from the workspace index](https://code.visualstudio.com/docs/copilot/reference/workspace-context#_what-content-is-included-in-the-workspace-index)

### Copilot Settings
* **Purpose:** Familiarize yourself with the configuration options for Copilot, configure Copilot according to your needs, and enable custom instructions.
* **In VSCode:** 
* **Steps:**
    1. Open VS Code settings
    2. Type Copilot in the search field
    3. Go through the following settings and understand their purpose.
        - GitHub › Copilot: Enable
        - GitHub › Copilot › Chat › Agent: Auto Fix
        - GitHub › Copilot › Next Edit Suggestions: Enabled
        - Chat › Agent: Enabled
    4. Make sure the following setting is enabled
        - GitHub › Copilot › Chat › Code Generation: Use Instruction Files
    5. See the following settings and click on "edit in settings.json". Think about what kind of additions would be useful in your technological environment.
        - GitHub › Copilot › Chat › Review Selection: Instructions
        - GitHub › Copilot › Chat › Code Generation: Instructions

* **Other IDEs:** 
* **Steps:**
    1. Open your IDE’s settings/preferences.
    2. Search for "Copilot" in the settings.
    3. Review and understand the following settings (names may vary by IDE):
        - Enable/disable Copilot
        - Enable Copilot Chat
        - Enable Agent Mode (VS Code only)
        - Enable custom instructions
    4. For advanced customization, edit the Copilot settings JSON or equivalent configuration file if your IDE supports it.

### Custom instructions
* **Purpose:** Create a custom instructions file for the project to help Copilot understand your coding conventions.
* **Steps:**
    1. Create a folder called .github at the root of your project
    2. Create a file called copilot-instructions.md in the new folder. This is your project-specific *custom instructions file* that should be added to version control and shared among the team members.
    3. Ask Copilot to generate contents for the file using Ask mode (select "Ask" in the chat window). To get better results, explain to Copilot what kind of project you are planning to build.
    4. See Copilot's suggestions and adjust them according to your preferences. Add, for example, the following:
        - High-level description of the purpose of the application
        - Key technologies and frameworks
        - Project structure
        - Variable, function, etc. naming conventions
        - (Patterns)
    5. Close the custom instructions file. Ask something about your project from Copilot and make sure that the custom-instructions.md is added automatically to every prompt you make.

### Implement features using Agent mode
* **Purpose:** Use agent mode to implement a couple of use cases in your application.
* **Steps:**
    1. Decide on the first UI elements, API endpoints, or other features you want to implement. Use Copilot's Agent mode to implement the features.
    2. Try out different models while working with agent mode:
        * GPT-4.1 (now the Copilot default)
        * Claude 3.7 Sonnet
        * Claude 3.7 Sonnet Thinking
        * o3/04 mini
    3. See [GitHub Documentation](https://docs.github.com/en/copilot/using-github-copilot/ai-models/choosing-the-right-ai-model-for-your-task) for recommendations on which model to use for different tasks. Check out also the [model multipliers](https://docs.github.com/en/copilot/managing-copilot/monitoring-usage-and-entitlements/about-premium-requests#model-multipliers) to understand premium request quotations and costs in the new subscription models.
    4. Pay attention to the proactive and interactive nature of Agent mode:
        * Agent mode uses the search index to find relevant content from the workspace
        * If it needs to use a tool or run something in the terminal, it asks for permission from the user
        * It notices if it produces compilation errors and proposes fixes for them automatically
        * Depending on the situation, it could also modify or make additions to unit tests or even try to run them

### Debugging
* **Purpose:**  If/when you run into problems while developing your application, use Copilot's features to debug your code and understand error messages and stack traces.
* **In VSCode:** 
    1. #problems: shows the current errors and warnings in your workspace
    2. #terminalLastCommand: adds the last command and its output to the context. A great way to quickly understand failed terminal commands.
    3. #terminalSelection: select text from the terminal to add it into the prompt context. A great way to debug, for example, an error in development server output or to target the prompt to a specific line of the output of a failed terminal command.

* **Other IDEs:** 
    1. Use your IDE’s error/warning panel to view current issues.
    2. Use Copilot Chat to analyze terminal output or error messages.
    3. Select relevant output and ask Copilot for help understanding or fixing issues

### Using Copilot in CLI and VSCode Terminal
* **Purpose:**  You can use Copilot with the GitHub CLI and in VSCode terminal to get suggestions and explanations for the command line.
* **In VSCode Terminal:** 
    1. Open Inline chat (Ctrl + I for Windows) in the terminal
    2. Ask questions about commands or suggestions to run in the terminal.
* **In command line** 
    1. See the [documentation](https://docs.github.com/en/copilot/how-tos/set-up/install-copilot-in-the-cli) for instructions to install the extension
    2. To ask Copilot in the CLI to explain a command, run `gh copilot explain` followed by the command that you want explained. Example `gh copilot explain "sudo apt-get"`
 
    3. To ask Copilot in the CLI to suggest a command, run `gh copilot suggest` followed by the command that you want.

### Prompt files
* **Purpose:** Use prompt files to avoid repeating yourself when writing prompts for specific kinds of tasks and workflows.
* **IDE Support:** Visual Studio Code
* **Steps:**
    1. In VS Code, use the combination Shift+Command/Control+P to open the command palette.
    2. Type Chat: new prompt file
    3. Select prompts
    4. Give a name to the prompt file
    5. Think about what kind of prompt files would be useful at your work and create a prompt file according to your needs.
    6. Test your prompt file in the chat by typing / and the name of your prompt file.
    7. See the [documentation](https://code.visualstudio.com/docs/copilot/copilot-customization#_prompt-file-structure) for instructions on how to use, for example, user input in prompt files.
    8. Example prompt file:
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

### Model Context Protocol recap and MySQL MCP server installation

* **Purpose:** Understand how MCP servers work and how they can be run locally
* **IDE Support:** Generally available (GA) in Copilot Chat for Visual Studio Code, in public preview for Copilot in Visual Studio, JetBrains, Eclipse, and Xcode.
* **MCP Recap:**
    * MCP (Model Context Protocol) servers provide a standardized way to interact with various tools, services, and systems.
    * An MCP server is run locally on the developer's workstation, e.g., as a Docker container (remote servers are also possible using HTTP)
    * Developers can initialize and manage MCP servers directly from their IDE or command-line tools.
    * MCP allows seamless integration of external tools and data sources with Copilot. They support multiple types of integrations, including databases, APIs, and cloud services.
    * MCP servers enable real-time exploration, execution, and interaction with connected resources.
    * A wide variety of MCP servers are already available. **Caution must be taken when running MCP servers** found on the web because of potentially insecure or malicious implementations.
* **Steps:**
    1. VS Code => Shift+Control+P (Win) or Shift+CMD+P (Mac)
    2. \> MCP: Add server...
    3. Docker image => mcp/mysql
    4. "Install mcp/mysql from mcp?" => select "Allow"
    5. MySQL URL:
        * Mac: mysql://mysql:mysql@host.docker.internal:3306/library_app
        * Codespaces / Linux: mysql://mysql:mysql@172.17.0.1:3306/library_app
    6. If you are next asked for port number, database name, username, and password: use values from the URL above
        * Port: 5432
        * Database name: library_app
        * Username: postgres
        * Password: postgres
    7. "Enter Server ID" => "MySQL"
    8. "Choose where to save the configuration" => select "Workspace settings"
    9. mcp.json should be opened by the IDE
    10. Start the server by clicking on the play button in mcp.json
    11. The tools provided by the MCP server should now be available in the tools menu in the Agent mode prompt box (make sure Agent mode is selected, then click on the wrench icon). You can enable or disable tools by ticking/unticking the boxes.


### Testing the MySQL MCP server
* **Purpose:** Try out and test the MySQL MCP server against a database
* **Prerequisites:**
    * Docker installed.
* **Steps:**
    * cd mcp-exercise
    * docker compose up db
    * Copilot Chat => Agent Mode Selected
    * Make sure from the tools menu that the MySQL MCP Server and its tool "query" are enabled
    * Prompt: "#query what's the schema of my database?"
    * Prompt: "Show all book loans"
    * Prompt: "Show all users who have at least one loan"
    * Think about how the information provided by the MCP server could be utilized in prompts. How could it help build complete, AI-powered development flows?

### Using MySQL MCP Server together with prompt files
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
    Use the #query tool to get a description of the MySQL database schema.
    Then generate an Entity Relationship diagram based on the schema. Use Mermaid
    syntax to create the diagram. Create the diagram in a file called ER.md.
    Create the file if it doesn't exist yet or update the existing file.
    ```
    3. Test the prompt file by typing /er in agent mode. Refine the prompt if Copilot is not able to fulfill the purpose of the prompt.
    4. If you want to see the resulting Mermaid diagram, push the file to a GitHub repository and open the file.

### Other MCP Servers
* **Purpose:** Explore and try out other MCP servers
* **Steps:**
    1. Browse to http://mcp.so
    2. Take a look at some of the other MCP servers available. Try to find ones that you could use to integrate Copilot with your development tools. Some suggestions:
        * [GitHub](https://mcp.so/server/github/modelcontextprotocol)
        * [GitLab](https://mcp.so/server/gitlab/modelcontextprotocol)
        * [Playwright](https://mcp.so/server/playwright-mcp/microsoft)
        * [Perplexity](https://mcp.so/server/perplexity/ppl-ai)
        * [Slack](https://mcp.so/server/slack/modelcontextprotocol)

### MySQL MCP Troubleshooting

Trouble using or connecting to the MySQL MCP server?

1. Make sure the configuration in mcp.json looks like this:

* Windows and Mac
    ```json
    {
        "servers": {
            "mysql": {
                "command": "docker",
                "args": [
                    "run",
                    "-i",
                    "--rm",
                    "mcp/mysql",
                    "mysql://mysql:mysql@host.docker.internal:3306/library_app"
                ]
            }
        }
    }
    ```

* Linux
    ```json
    {
        "servers": {
            "mysql": {
                "command": "docker",
                "args": [
                    "run", 
                    "-i", 
                    "--rm", 
                    "mcp/mysql", 
                    "mysql://mysql:mysql@172.17.0.1:3306/library_app"]
                }
        }
    }
    ```
2. Make sure the previous MCP Docker containers are stopped before running the server again:
    ```bash
    % docker ps | grep mcp                                          
    db599e110c3f   mcp/mysql                           "node dist/index.js …"   2 hours ago    Up 2 hours
    % docker stop db599e110c3f
    ```

#### No Docker?
If you don't have Docker installed and can't install it, you can use npm to run the server.

```json
{
    "servers": {
        "mysql": {
            "command": "npx",
            "args": [
                "-y",
                "@modelcontextprotocol/server-mysql",
                "mysql://localhost/mydb"
            ]
        }
    }
}
```
To run the database locally without Docker, you can either use Podman to run the docker-compose.yml file
or install the database on your workstation using MySQL installers. You can also use any test database
you are currently using for work.

## Part 2: The Hackathon
Part 2 is a 2.5 hour hackathon carried out in groups.
* The objective is to complete a simple application
* Use the advanced features discussed during first part of the workshop as much as possible
* Divide the work between the members or use mob programming
* 3-4 members per group
* Ideally mixed group of different skills, e.g. frontend and backend developers

Each group chooses one of the following options:
* [The Finnish Happiness Factor Finder (Full stack)](https://github.com/EficodeDemoOrg/copilot-data-analysis-exercise)
* [The Silly Walk Grant Application Orchestrator (Backend)](https://github.com/EficodeDemoOrg/copilot-backend-requirement-exercise)
* [Gene Weaver - Dazzling DNA Destiny! (Data analysis)](https://github.com/EficodeDemoOrg/copilot-fullstack-requirements-exercise)
* DB Admins, test automation engineers, IaC engineers and other non-develoeprs: come up with your own project idea. If needed, use Copilot to ideate.

The results of each group are reviewed and discussed at the end of the hackathon.
