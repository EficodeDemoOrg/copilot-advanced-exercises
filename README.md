# Copilot Training - Advanced Track

## Part 1 exercises
Individually executed exercises in the first workshop.

### Create a new project
* **Purpose:** Setup a new project to work with for the following exercises
* **Steps:**
    1. Decide a topic for your application. If you need inspiratio, [see here](EXERCISE_APP_IDEAS.md).
    2. Use programming languages and tech stack you're familiar with to work on your project. Initialize the project using npm, dotnet, create-react-app, mvn archtypes etc. to initialize a new project. 
    2. Initialize a local git repository for the project.
    3. Create a .gitignore file for the project. This is important since Copilot automatically [ignores files listed in .gitignore from the workspace index](https://code.visualstudio.com/docs/copilot/reference/workspace-context#_what-content-is-included-in-the-workspace-index)

### Custom instructions
* **Purpose:** Create a custom instructions file for the project to help Copilot understand your coding conventions.
* **Steps:**
    1. Create a folder .github at the root of your project
    2. Create a file called copilot-instructions.md in the new folder. This is your project specific *custom instructions file* that should be added to the version control and shared among the team members.
    3. Ask Copilot to generate contents for the file using the Ask mode (select "Ask" in the chat window). To get better results, explain Copilot what kind of project you are planning to build. Tip for VS Code users: at the top of the chat window, click on the gear wheel and select "Generate instructions".
    4. See Copilot's suggestions and adjust them according to your preferences. Add e.g. the following:
        - High-level description of the purpose of the application
        - Key technologies and frameworks
        - Project strucure
        - Variable, function etc. naming convention
        - (Patterns)
    5. Close custom instructions file. Ask something about your project from Copilot and make sure that the custom-instructions.md is added automatically to every promopt you make.

### Implement features using Agent mode
* **Purpose:** Use agent mode to implement a couple of use cases in your application.
* **Steps:**
    1. Decide the first UI elements, API endpoints or other features you want to implement. Use Copilot's Agent mode to implement the features.
    2. Try out different models while working with agent mode:
        * Claude 3.7 Sonnet
        * Claude 3.7 Sonnet Thinking
        * GPT-4.1
        * o3/04 mini
    3. Pay attention to the proactive and interactive nature of the Agent mode:
        * Agent mode uses the search index to search relevant content from the workspace
        * If it needs to use a tool or run something in the terminal, it asks for the permission from the user
        * It notices if it produces compilation errrors and proposes fixes to them automatically
        * Dependeing on the situation, it could also modify or make additions to unit tests or even try to run them


### Debugging
* **Purpose:**  If/when you run into problems while developng your application, use Copilot's features to debug your code and undertand error messages and stack traces.
    1. /exlain: explain a selected code snippet
    2. /fix: find the problem in the selected snippet and fix it.
    3. #problems: shows the current errors and warnings in your workspace
    4. #terminalLastCommand: adds last command and its output to the context. Great way to quickly understand failed terminal commands.
    5. #terminalSelection: select text from terminal to add it into the prompt context. Great way to debug e.g. an error in development server output or to target the prompt to a specific line of the output of a failed terminal command.

### Prompt files
* **Purpose:** Use prompt files to not repeat yourself when writing prompts for specific kinds tasks and workflows.
* **Steps:**
    1. In VS Code, you can use the combination of Shift+Command/Control+P to open the command palette. Type "Chat: new prompt file", select "prompts" and give a name to the prompt file. In Visual Studio, you can simply create a new file called .github/prompts/[name].prompt.md, e.g. ".github/prompts/unittests.prompt.md"
    2. Think about what kind of prompt files would be useful at your work and create a prompt file according to yur needs. Best use cases for prompt files are prompts that you and your team members keep writing over and over again. For inspiration, see [Awesome Copilot repository](https://github.com/github/awesome-copilot/tree/main/prompts).
    3. Test your prompt file in the chat by typing / and the name of your prompt file.
    4. See the [documentation](https://code.visualstudio.com/docs/copilot/copilot-customization#_prompt-file-structure) for instructions on how to use e.g. user input in prompt files.
    5. Example prompt file:
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

### Model Context Protocol recap and MCP server installation
* **Purpose:** Understand how MCP servers work, how they can be run locally, familiarize with the selection of MCP servers.
* **MCP Recap:**
    * MCP (Model Context Protocol) servers provide a standardized way to interact with various tools, services, and systems.
    * MCP server is run locally on the developer's workstation e.g. as a docker container (remote servers also possible suign HTTP)
    * Developers can initialize and manage MCP servers directly from their IDE or command-line tools.
    * MCP allows seamless integration of external tools and data sourvces with Copilot. They support multiple types of integrations, including databases, APIs, and cloud services.
    * MCP servers enable real-time exploration, execution, and interaction with connected resources.
    * A wide variety of MCP servers are aldready available. **Caution must be taken when running MCP servers** found on the web because of potentially insecure or malicious implementations

#### Microsoft Learn MCP Server
* **Steps:**
    1. Create the MCP configuration file:
        * VS Code: .vscode/mcp.json ([documentation](https://code.visualstudio.com/docs/copilot/customization/mcp-servers))
        * Visual Studio: \<SOLUTIONDIR\>\.mcp.json ([documentation](https://learn.microsoft.com/en-us/visualstudio/ide/mcp-servers?view=vs-2022#configuration-example-with-a-github-mcp-server))
    2. Browse to [GitHub MCP Registry](https://github.com/mcp), GitHub's list of curated MCP servers
    3. Search for Microsoft Learn MCP server, a remote MCP Server that enables Copilot to fetch trusted and up-to-date information directly from Microsoft's official documentation. Read the Example JSON configuration from the MCP server documentation.
    4. Add the following configuration to the mcp.json file
        ```json
        {
            "servers": {
                {
                    "microsoft.docs.mcp": {
                        "type": "http",
                        "url": "https://learn.microsoft.com/api/mcp"
                    }
                }
            }
        }
        ```
    5. Run the server using the control that appear on top of the MPC server definition in the file.
    6. Open Copilot Chat and **make sure you are in the Agent mode.**
    7. Check the tools menu in the chat window. Can you see the Microsoft MCP server tools?
    8. Issue the following prompt: “What are the Azure CLI commands to create a container app with a managed identity? Search Microsoft docs and fetch full doc.”

#### Playwright MCP

1. Repeat the MCP server installation steps listed above, but this time try the Playwright MCP server, also available in the GitHub MCP Registry. Note: Node.js 18 or newer required.
2. After running the server, check that the tools are available in the agent mode tools menu.
3. Issue a prompt that uses the browser, e.g. "Browse to google.com. Enter keywords "GitHub Copilot" and click on the search button. Wait for search results to load. Extract and return the titles and URLs of the first five search results."

#### PostgreSQL MCP Server
* **Note:** Docker required. See instructions at the end of the documentation for using NPM and Podman. If you can't use neither on your computer, you can skip this exercise.
* **Steps:**
    1. Add the following MCP server configuration in your mcp.json file:
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
    2. Run the server using the controls that appear on the top of the server configuration.
    3. cd mcp-exercise
    4. docker compose up db
    5. Copilot Chat => Agent Mode Selected
    6. Make sure from the tools menu that the Postgres MCP Server and its tool "query" are enabled
    7. Prompt: "#query what's the schema of my database?"
    8. Prompt "Show all book loans"
    9. Prompt: "Show all users who have at least one loan"
    10. Think about how the information provided by the MCP server could be utilised in prompts? How could it help build complete, AI poweered development flows?

### Using PostgreSQL MCP Server together with prompt files
* **Note:** Docker required. See instructions at the end of the documentation for using NPM and Podman. If you can't use neither on your computer, you can skip this exercise.
* **Purpose:** Use a prompt file to automate the generation of ER-diagram based on the database schema.
* **Steps:**
    1. Create a new prompt file (see the instructions above)
    2. Copy-paste this into the file:
    ```md
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
    3. Test the prompt file by typing /er in the agent mode. Refine the prompt if Copilot is not able to fulfil the purpose of the prompt.
    4. If you want to see the resulted Mermaid diagram, push the file to a GitHub repository and open the file.

### Other MCP Servers
* **Purpose:** Familiarize yourself with other MCP servers.
* **Steps:**
    1. Browse to https://github.com/mcp
    2. Take a look at some of the other MCP servers available. Try to find ones that you could use to integrate Copilot with your development tools. Some suggestions:
        * GitHub
        * Atlassian
        * Postman
        * JFrog
        * Terraform


### PostgreSQL MCP Troubleshooting

Trouble using or connecting to the PostgreSQL MCP server?

1. Make sure the configuration in mcp.json look like this:

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
2. Make sure the previous MCP Docker containers are killed before running the server again:
    ```bash
    % docker ps | grep mcp                                          
    db599e110c3f   mcp/postgres                           "node dist/index.js …"   2 hours ago    Up 2 hours
    % docker stop db599e110c3f
    ```

#### No docker?
If you don't have Docker installed and can't install it, you can use Node to run the server.

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
yiu are currently using for work. 
