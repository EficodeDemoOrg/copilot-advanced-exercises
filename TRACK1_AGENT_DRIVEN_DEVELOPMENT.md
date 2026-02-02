# Track 1: Mastering Agent-Driven Development

Build a complete development workflow using AI agents, custom instructions, and domain-specific patterns.

---

## Cross-Track Optional Enhancements

💡 **Combine with Track 5:** Use MCP servers to add database/API context to your domain workflows  
📦 **Package with Track 6:** Share your domain system across projects using APM

---

## Prerequisites

**Required:**
- VS Code or JetBrains IDE installed
- GitHub Copilot and Copilot Chat extensions
- Basic familiarity with Copilot Chat (Ask mode and Agent mode)

**Optional:**
- Existing project to apply domain structure
- Git repository for version control

---

## Workshop Flow

1. [Exercise 1: Create a New Project with AI Collaboration](#exercise-1-create-a-new-project-with-ai-collaboration)
2. [Exercise 2: Custom Instructions](#exercise-2-custom-instructions)
3. [Exercise 3: Domain-Specific Custom Instructions](#exercise-3-domain-specific-custom-instructions)
4. [Exercise 4: Domain-Specific Custom Agents](#exercise-4-domain-specific-custom-agents) *(VS Code only)*
5. [Exercise 5: Domain-Specific Prompt Files (Workflows)](#exercise-5-domain-specific-prompt-files-workflows)
6. [Exercise 6: Implement Features Using Your Domain System](#exercise-6-implement-features-using-your-domain-system)

### JetBrains Users

**Custom agents are VS Code only.** For JetBrains IDEs:

1. **See [JETBRAINS_PROMPTS.md](JETBRAINS_PROMPTS.md)** for ready-to-use prompt templates
2. **Use Ask/Agent modes** with manual file context references
3. **Copy templates** and customize for your domains
4. **Reference instruction files** manually using `#file:.github/instructions/[domain].instructions.md`

The workflows are the same, just without the custom agent selector.

---

## Key Takeaways

✅ **Custom Instructions:** Project-wide and domain-specific standards auto-activate based on file patterns  
✅ **Specialist Agents:** Focused AI assistants with clear boundaries (VS Code) or prompt templates (JetBrains)  
✅ **Workflow Prompts:** Reusable, automated development workflows  
✅ **Model Selection:** Choose the right AI model for each task complexity  
✅ **Domain Separation:** Maintain clean architecture through AI boundaries

---


## Exercise 1: Create a New Project with AI Collaboration

**Purpose:** Setup a new project collaboratively with AI, learning effective planning and implementation patterns.

### Steps

1. **Plan with AI (Ask mode):**
   - Use **Ask mode** with **Claude Sonnet 4/4.5**
   - Add `#file:EXERCISE_APP_IDEAS.md` if you need inspiration
   - Prompt: *"Help me design a [type of application]. Quiz me about requirements, tech stack, and architecture."*
   - Let AI ask clarifying questions about your preferences

2. **Document the blueprint:**
   - Have AI generate a project specification
   - Save as `PROJECT_BLUEPRINT.md` with: purpose, tech stack, structure, key features

3. **Initialize with Agent mode:**
   - Switch to **Agent mode**
   - Provide `#file:PROJECT_BLUEPRINT.md`
   - Prompt: *"Initialize this project based on the blueprint. Create structure and configuration files."*

4. **Set up version control:**
   - Initialize git repository
   - Create `.gitignore` (important for [workspace indexing](https://code.visualstudio.com/docs/copilot/reference/workspace-context#_what-content-is-included-in-the-workspace-index))

---

## Exercise 2: Custom Instructions

**Purpose:** Create base-level custom instructions for project-wide conventions.

**Documentation:** [Custom Instructions](https://code.visualstudio.com/docs/copilot/customization/custom-instructions)

### In VS Code

1. Click the **gear icon** in VS Code
2. Select **"Generate Instructions for Copilot"**
3. VS Code creates `.github/copilot-instructions.md`
4. Review and enhance with project-specific details

### In JetBrains

1. Create `.github/copilot-instructions.md`
2. Use Ask mode with your blueprint as context
3. Prompt: *"Generate custom instructions for this project including coding standards and patterns."*
4. Adjust to match your preferences

**Note:** This file contains universal guidelines. Domain-specific rules come in Exercise 3.

---

## Exercise 3: Domain-Specific Custom Instructions

**Purpose:** Create targeted instruction files for different parts of your codebase using AI collaboration.

**Documentation:** [Custom Instructions](https://code.visualstudio.com/docs/copilot/customization/custom-instructions)

### Part A: Identify Domains (AI as Sparring Partner & Researcher)

1. **Collaborative discovery with AI (Ask mode):**
   - Switch to **Ask mode** and use **Claude Sonnet 4/4.5**
   - Add your project files as context (workspace or specific folders)
   - **Initial research prompt:** *"Analyze my project structure and files. Based on what you see, what domains (backend, frontend, tests, database, documentation, infrastructure) exist or should exist? Ask me clarifying questions about the architecture."*

2. **Research glob patterns with AI:**
   - For each identified domain, ask AI: *"What glob pattern would best match files in the [DOMAIN] domain? Consider my project structure and suggest specific patterns."*
   - Example patterns:
     - Backend: `src/api/**/*.ts`, `app/backend/**/*.py`
     - Frontend: `src/components/**/*.tsx`, `app/frontend/**/*.js`
     - Tests: `**/*.test.ts`, `**/*.spec.py`, `tests/**/*`

3. **Identify domain-specific concerns with AI:**
   * For each domain, prompt: *"What are the key coding standards, security concerns, and best practices specific to [DOMAIN] development in [YOUR TECH STACK]?"*
   * AI will help identify concerns like:
     * Backend: Input validation, authentication, error handling, database transactions
     * Frontend: Accessibility, responsive design, state management, performance
     * Tests: Coverage requirements, test patterns, mocking strategies

4. **Document domain structure:**
   - Have AI help create `DOMAIN_STRUCTURE.md`
   - Prompt: *"Create a DOMAIN_STRUCTURE.md file documenting all domains we identified with their glob patterns and key concerns."*

### Part B: Create Domain Instruction Files

**In VS Code:**
1. Command palette (`cmd+shift+p`) → "Chat: New Instructions file"
2. Select location: `.github/instructions`
3. Name files by domain: `backend.instructions.md`, `frontend.instructions.md`, etc.

**In JetBrains:**
1. Create `.github/instructions/` folder
2. Create files following pattern: `<domain>.instructions.md`

### Part C: Generate Instructions with AI (AI as Researcher & Implementer)

**Work on one domain at a time.** For each domain:

1. **Research best practices (Ask mode):**
   - Prompt: *"What are the industry best practices and coding standards for [DOMAIN] development in [YOUR TECH STACK]? Consider security, performance, maintainability, and testing."*

2. **Generate domain instructions (Agent mode):**
   - Switch to **Agent mode**
   - Provide context:
     - `#file:.github/copilot-instructions.md`
     - `#file:DOMAIN_STRUCTURE.md`
     - `#file:PROJECT_BLUEPRINT.md`
   - Prompt: *"Create domain-specific instructions for the [DOMAIN] domain. Use glob pattern `[PATTERN]`. Include coding standards for: [LIST SPECIFIC CONCERNS]. These instructions should complement our base instructions without duplication."*

3. **Review and refine:**
   * Ask AI to explain any unfamiliar standards: *"Explain why you included [SPECIFIC STANDARD] and show me an example."*
   * Request adjustments: *"Make this more specific to our [FRAMEWORK/LIBRARY] setup."*

**Example - Backend API Instructions:**
```markdown
---
applyTo: "src/api/**/*.ts"
---
# Backend API Development Standards

## Request Handling
- Validate ALL input at API boundaries
- Use typed request/response objects
- Log all requests with correlation IDs

## Error Handling
- Use consistent error format: { error, code, details? }
- Never expose stack traces
- Map errors to proper HTTP status codes

## Security
- Sanitize inputs against injection
- Use parameterized queries
- Check authentication on protected routes

## Database
- Use transactions for multi-step operations
- Use migrations for schema changes
```

### Part D: Validate with AI (AI as Validator)

1. **Test instruction file activation:**
   * Create or open a file matching the glob pattern
   * Make a prompt in Copilot Chat
   * Verify the instruction file appears in the chat context panel
   * Ask: *"What coding standards should I follow for this file?"* - AI should reference your domain instructions

2. **Check for contradictions (new Agent session):**
   * Open a fresh **Agent mode** session (to avoid context carry-over)
   * Add ALL instruction files as context:
     * `#file:.github/copilot-instructions.md`
     * All files in `#file:.github/instructions/`
   * Comprehensive validation prompt: *"Review all these instruction files for contradictions, ambiguities, or overlapping guidance. Check if domain-specific instructions conflict with base instructions. Identify any gaps where important standards might be missing. Suggest improvements for clarity and consistency."*
   * Discuss findings with AI and ask for specific fixes
   
3. **Refine based on feedback:**
   * For each issue AI identifies, ask: *"How should I revise the [DOMAIN] instructions to fix [SPECIFIC ISSUE]?"*
   * Have AI implement the changes in **Agent mode**
   * Verify changes make sense before accepting

---

## Exercise 4: Domain-Specific Custom Agents

> **VS Code only** - JetBrains users: See [JETBRAINS_PROMPTS.md](JETBRAINS_PROMPTS.md) for alternative approach

**Purpose:** Create specialized AI assistants with specific tools and boundaries.

**Documentation:** [Custom Agents](https://code.visualstudio.com/docs/copilot/customization/custom-agents)

### Planning Domain Specialists (AI as Sparring Partner)

1. **Design specialists with AI (Ask mode):**
   * Use Ask mode with `#file:DOMAIN_STRUCTURE.md` as context
   * Prompt: *"For each domain we identified (backend, frontend, tests, etc.), help me design a specialized custom agent. What specific tools, boundaries, and protocols should each specialist have? Consider what they should and shouldn't be allowed to do."*
   * Discuss with AI:
     * Which Copilot tools each specialist needs (codebase, terminal, problems, usages, etc.)
     * What boundaries prevent specialists from working outside their domain
     * What protocols ensure quality and consistency

2. **Research domain-specific workflows:**
   * For each domain, ask: *"What are common tasks a [DOMAIN] specialist handles repeatedly? What would benefit from automation?"*
   * Examples AI might suggest:
     * Backend: Creating endpoints, adding middleware, database migrations
     * Frontend: Creating components, forms, state management
     * Tests: Writing test suites, generating test data, coverage analysis


### Creating Custom Agents

1. **Create custom agent files:**
   - Custom agent selector → "Configure Custom agents" → "Create new custom agent file"
   - Create one per domain: `backend-specialist`, `frontend-specialist`, `test-engineer`

2. **Generate agent configuration with AI:**
   - Use Agent mode for each specialist
   - Provide context: `#file:DOMAIN_STRUCTURE.md` and domain instruction file
   - Prompt: *"Create a custom agent for a [DOMAIN] specialist. Include appropriate tools and clear boundaries. Reference the domain instruction file."*

**Example - Backend Specialist:**
```yaml
---
description: 'Backend API development specialist'
tools: ['codebase', 'terminal', 'problems', 'usages']
---
You are a backend API development specialist for this project.

## Your Responsibilities:
- Design and implement RESTful APIs
- Optimize database queries
- Implement authentication and authorization
- Handle data validation and error handling

## Your Boundaries:
- DO NOT modify frontend components or UI files
- DO NOT change styling or CSS
- ONLY work on server-side code
- Focus exclusively on files matching: src/api/**/*.ts

## Your Protocols:
1. Always validate input data at API boundaries
2. Use proper HTTP status codes
3. Implement comprehensive error handling
4. Consider security implications (injection, XSS, CSRF)

Always follow: #file:.github/instructions/backend.instructions.md
```

### Validate Custom Agents

1. **Test each specialist agent:**
   * Select the custom agent in agent selector
   * Ask domain-specific questions: *"What should I consider when creating a new [FEATURE] in this domain?"*
   * Verify the mode:
     * References the correct domain instruction file
     * Stays within its boundaries when making suggestions
     * Uses appropriate tools for the domain

2. **Test boundary enforcement:**
   * In **backend-specialist** agent, ask: *"How should I style this button?"*
   * AI should refuse and suggest using frontend-specialist instead
   * Prompt for validation: *"You just asked me to work outside my domain. Am I correctly respecting my boundaries?"*

3. **Cross-domain coordination test:**
   * Think of a feature that spans multiple domains
   * Switch between specialist agents as needed
   * Verify each specialist maintains focus on their domain
   * Ask AI: *"Review my use of domain specialists. Did each stay within their responsibilities?"*

---

## Exercise 5: Domain-Specific Prompt Files (Workflows)

**Purpose:** Create reusable prompt files that automate common tasks.

### Part A: Plan Workflows with AI

1. **Identify common workflows (Ask mode):**
   * For each domain, use Ask mode with the corresponding specialist custom agent context
   * Prompt: *"For the [DOMAIN] domain in my project, what are the most common repetitive tasks that developers perform? Which of these would benefit from a standardized, automated workflow?"*
   * AI will suggest workflows like:
     * **Backend:** Create new endpoint, add middleware, create database migration, add validation schema
     * **Frontend:** Create component, add form with validation, create page with routing, add API integration
     * **Tests:** Generate unit tests, create integration test suite, add E2E test scenario, update test fixtures

2. **Design workflow steps with AI:**
   * For each workflow, ask: *"Walk me through the steps a developer should follow to [TASK]. What information do they need to provide? What files need to be created or modified? What validations should happen?"*
   * Discuss and refine the workflow until it's comprehensive

### Part B: Create Prompt Files

**In VS Code:**
- Command palette → "Chat: new prompt file"
- Name with domain prefix: `backend-new-endpoint.prompt.md`

**In JetBrains:**
- Create `.github/prompts/` folder
- Create files: `<domain>-<workflow>.prompt.md`

### Part C: Implement Workflows with AI

**Generate prompt file (Agent mode):**
* Switch to **Agent mode**
* Provide context: workflow plan, domain instruction file, specialist custom agent
* Prompt: *"Create a prompt file for [WORKFLOW]. It should use the [DOMAIN-SPECIALIST] custom agent and guide the user through [STEPS]. Ask for necessary inputs, then implement according to our domain standards."*

**Example - Backend: New API Endpoint:**
```markdown
---
mode: 'backend-specialist'
tools: ['codebase', 'terminal', 'usages']
description: 'Create a new RESTful API endpoint'
---
Create a new RESTful API endpoint following backend standards.

## Step 1: Gather Requirements
Ask the user for:
1. Resource name (singular/plural)
2. HTTP methods needed
3. Data model/schema
4. Authentication requirements

## Step 2: Implementation
- Create route handler
- Add validation
- Implement error handling
- Generate tests
- Update documentation

## Step 3: Verification
- Run test suite
- Check standards compliance

Follow: #file:.github/instructions/backend.instructions.md
```

### Part D: Test and Refine Workflows

1. **Test each prompt:**
   * Use the appropriate specialist custom agent
   * Run the prompt by typing `/[prompt-name]` in chat
   * Provide test inputs and let AI execute the workflow
   * Verify the workflow produces expected results

2. **Validate workflow quality:**
   * Ask AI: *"Review the /[workflow-name] prompt. Does it cover all necessary steps? Are there any edge cases or best practices missing?"*
   * Request improvements: *"Make the workflow more robust by adding [SPECIFIC ENHANCEMENT]."*

3. **Test workflow boundaries:**
   * Ensure workflows use the correct specialist custom agent
   * Verify they follow domain-specific instructions
   * Check that they don't cross domain boundaries inappropriately

---

## Exercise 6: Implement Features Using Your Domain System

**Purpose:** Apply your domain specialists, workflows, and instructions to build real features.

### Planning Implementation with AI

1. **Choose features from your blueprint:**
   * Review `#file:PROJECT_BLUEPRINT.md`
   * Select 2-3 features that span multiple domains
   * Examples:
     * User authentication (backend API + frontend forms + tests + database)
     * Data dashboard (API endpoints + UI components + charts + tests)
     * Search functionality (backend search + frontend interface + filters + tests)

2. **Create implementation plan with AI (Ask mode):**
   * Provide context: `#file:PROJECT_BLUEPRINT.md`, `#file:DOMAIN_STRUCTURE.md`
   * Prompt: *"I want to implement [FEATURE]. Analyze this feature and create a step-by-step implementation plan. For each step, specify which domain specialist mode I should use, which workflow prompts would help, and what the expected outcomes are."*
   * Review the plan and discuss any questions
   * Have AI create an implementation checklist

### Implementation Workflow (AI as Implementer)

**For each feature, follow this structured approach:**

1. **Backend Implementation (Backend Specialist):**
   * Switch to **backend-specialist** custom agent
   * Use your workflow: `/backend-new-endpoint`
   * Example: *"Using the backend workflow, create a user authentication API with login, logout, and token refresh endpoints."*
   * Let the specialist guide you through:
     * Database schema and models
     * API endpoints with validation
     * Authentication logic
     * Security measures (password hashing, token management)
     * Error handling
   * Review the implementation with AI: *"Review the code you just created. Does it follow all our backend standards? Are there any security concerns?"*

2. **Database Setup (if applicable):**
   * If you have a database specialist custom agent, use it
   * Otherwise, stay in backend-specialist custom agent
   * Create migrations or schema updates
   * Add seed data for development/testing
   * Verify database integrity constraints

3. **Frontend Implementation (Frontend Specialist):**
   * Switch to **frontend-specialist** custom agent  
   * Use your workflow: `/frontend-new-component`
   * Example: *"Using the frontend workflow, create a login form that connects to our authentication API. Include form validation, error handling, and loading states."*
   * The specialist will handle:
     * Component structure with TypeScript
     * Form validation (client-side)
     * API integration
     * Loading and error states
     * Accessibility (ARIA labels, keyboard nav)
     * Responsive styling
   * Ask for review: *"Evaluate this component for accessibility and user experience. What improvements would you suggest?"*

4. **Testing Implementation (Test Engineer):**
   * Switch to **test-engineer** custom agent
   * Use your workflow: `/test-comprehensive`
   * Example: *"Generate comprehensive tests for the authentication feature, covering both API endpoints and UI components."*
   * The specialist will create:
     * Unit tests for validation logic
     * Integration tests for API endpoints
     * Component tests for UI
     * E2E tests for complete workflows
   * Verify coverage: *"Check the test coverage for this feature. Are there any critical paths missing?"*

5. **Integration and Validation:**
   * Return to general **Agent mode** for cross-domain work
   * Prompt: *"Verify that the frontend and backend integrate correctly. Test the complete user flow."*
   * Let Agent run the application and tests
   * Ask for validation: *"Are there any integration issues between frontend and backend? Any improvements needed?"*

### Model Selection Strategy (Choose the Right AI for the Task)

1. **Use Claude Sonnet 4/4.5 when:**
   * Making architectural decisions
   * Debugging complex, multi-file issues
   * Reviewing code for security or performance
   * Planning features that span multiple domains
   * Analyzing trade-offs between different approaches

2. **Use GPT-4.1 when:**
   * Generating boilerplate code
   * Quick refactoring tasks
   * Writing documentation
   * Simple bug fixes
   * Syntax corrections

3. **Monitor your usage:**
   * Check model indicator in chat for current model
   * Review [model selection guide](https://docs.github.com/en/copilot/using-github-copilot/ai-models/choosing-the-right-ai-model-for-your-task)
   * Be aware of [model multipliers](https://docs.github.com/en/copilot/managing-copilot/monitoring-usage-and-entitlements/about-premium-requests#model-multipliers) for cost management

### Leverage Agent Mode Capabilities

**Understand what Agent mode does automatically:**

1. **Automatic context discovery:**
   * Agent searches your workspace index for relevant files
   * Finds related code without you specifying files
   * Includes necessary context automatically
   * Ask: *"What files did you search to answer my question?"* to understand context gathering

2. **Proactive error handling:**
   * Agent detects compilation and linting errors
   * Proposes fixes automatically
   * Re-runs checks after applying fixes
   * Ask: *"Are there any errors in the code you just created?"* for verification

3. **Interactive terminal commands:**
   * Agent asks permission before running commands
   * Shows you what command will run
   * Allows you to modify commands before execution
   * Runs tests and shows results

4. **Iterative improvements:**
   * Agent notices test failures
   * Updates implementation to pass tests
   * Can create missing tests when none exist
   * Ask: *"Run the tests and fix any failures"* for automated iteration

### Example Implementation Session

Here's how to use your domain system for a complete feature:

```
Feature: User Profile Management

1. Planning Phase (Ask mode - Claude Sonnet 4):
   "I want to implement user profile management. Create a step-by-step plan 
   using our domain specialists and workflows."
   
   → AI provides plan with: backend API, frontend components, tests

2. Backend Phase (backend-specialist custom agent):
   "/backend-new-endpoint"
   → Creates: Profile model, GET/PUT endpoints, validation, error handling
   
   Validation: "Review this API for security issues"
   → AI checks: auth, input validation, SQL injection protection

3. Frontend Phase (frontend-specialist custom agent):
   "/frontend-new-component"
   → Creates: ProfileForm component with validation, API integration
   
   Validation: "Check this form for accessibility"
   → AI verifies: ARIA labels, keyboard navigation, focus management

4. Testing Phase (test-engineer custom agent):
   "/test-comprehensive"
   → Creates: Unit tests, integration tests, E2E tests
   
   Validation: "Run tests and check coverage"
   → AI runs tests, reports coverage, suggests missing tests

5. Integration Phase (Agent mode - Claude Sonnet 4):
   "Verify the complete user profile feature works end-to-end"
   → AI tests integration, identifies issues, suggests improvements

6. Review Phase (Ask mode - Claude Sonnet 4):
   "Review the entire profile feature for: security, performance, 
   accessibility, and code quality. Provide a summary."
   → AI performs comprehensive review with recommendations
```

### Collaboration Tips

1. **Ask for explanations:**
   * *"Why did you implement it this way instead of [ALTERNATIVE]?"*
   * *"Explain the security implications of this approach"*
   * *"What are the performance trade-offs here?"*

2. **Request alternatives:**
   * *"Show me two different approaches to solve this problem"*
   * *"What's a simpler way to achieve this?"*
   * *"How would you optimize this for better performance?"*

3. **Validate continuously:**
   * After each major change: *"Are there any issues with what you just created?"*
   * Before moving to next domain: *"Is this ready for integration with [OTHER DOMAIN]?"*
   * At the end: *"Perform a final review of all code in this feature"*

4. **Use domain boundaries:**
   * If a specialist suggests changes outside their domain: *"That's outside your domain. Should I switch to [OTHER SPECIALIST]?"*
   * When integrating: *"Coordinate with the [OTHER DOMAIN] specialist to ensure compatibility"*

---

### Debugging with Domain Context
* **Purpose:** Debug effectively using domain specialists and Copilot's context features.

* **In VSCode:**
   1. Use **`#problems`** to see current errors
   2. Use **`#terminalLastCommand`** for failed commands
   3. Use **`#terminalSelection`** to add specific terminal output
   4. **Switch to appropriate domain specialist** for the error type
   5. Prompt: *"Analyze this error and fix following our domain standards"*

* **Other IDEs:**
   1. Copy error messages to Copilot Chat
   2. Use domain-specific instruction files as context
   3. Ask for analysis and fixes


## Navigation

[🏠 Home](README.md) | [Next: Code Review →](TRACK2_CODE_REVIEW.md) (Optional)
