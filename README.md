# Copilot workshop - Advanced Track

Exercises for the GitHub Copilot Workshop - Advanced Track. 

**Prerequisites:**
* Visual Studio Code installed (primary IDE for these exercises). JetBrains IDEs such as IntelliJ IDEA, PyCharm, WebStorm, etc. can also be used for most exercises.
* GitHub Copilot and Copilot Chat extensions installed
* A terminal window open within the IDE

## Mastering Agent-Driven Development
**Target Audience:** Developers who have used Copilot and Agents, but want to shore up on the good practices and tools of agent usage.

### 1. Create a new project
* **Purpose:** Setup a new project to work with for the following exercises
* **Steps:**
    1. Decide on a topic for your application. If you need inspiration, [see here](EXERCISE_APP_IDEAS.md).
    2. Use programming languages and a tech stack you're familiar with to work on your project. Initialize the project using npm, dotnet, create-react-app, mvn archetypes, etc. to initialize a new project. 
    3. Initialize a local git repository for the project.
    4. Create a .gitignore file for the project. This is important since Copilot automatically [ignores files listed in .gitignore from the workspace index](https://code.visualstudio.com/docs/copilot/reference/workspace-context#_what-content-is-included-in-the-workspace-index)

### 2. Custom instructions
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

### 3. Additional Custom Instructions Files
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

### 4. Custom Chat Modes
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

### 5. Prompt files
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

### 6. Implement features using Agent mode
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

## Using Copilot in CLI and VSCode Terminal
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

### 1. Advanced Copilot CLI Exercises

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

### 2. GitHub Repository Management
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

### 3. Project Development Workflows
* **Steps:**
    1. Use Copilot CLI for local development tasks:
        * `Analyze the code quality in this project and suggest improvements`
        * `Create a .gitignore file appropriate for this project type`
        * `Generate a package.json file for a Node.js project with common dependencies`
    2. Try code review and analysis:
        * `Review the last commit and explain what changes were made`
        * `Find any TODO comments in the codebase and list them`
        * `Suggest improvements to the project structure`

### 4. Model Selection and Feedback
* **Steps:**
    1. Explore different AI models:
        * Use `/model` command in interactive mode to switch between available models
        * Compare responses from different models for the same prompt
        * Note the premium request usage for different models
    2. Explore slash commands:
        * Use `/mcp` to see available MCP servers
        * Try other available slash commands in interactive mode

## Agent Package Manager (APM) - Packaging AI Workflows
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



