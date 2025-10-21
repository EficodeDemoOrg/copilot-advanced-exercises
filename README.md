# Copilot workshop - Advanced Track

Exercises for the GitHub Copilot Workshop - Advanced Track. 

**Prerequisites:**
* Visual Studio Code installed (primary IDE for these exercises). JetBrains IDEs such as IntelliJ IDEA, PyCharm, WebStorm, etc. can also be used for most exercises.
* GitHub Copilot and Copilot Chat extensions installed
* A terminal window open within the IDE

## Overview

This workshop covers advanced GitHub Copilot techniques organized into three main tracks:

### [Track 1: Mastering Agent-Driven Development](#mastering-agent-driven-development)
Build a complete development workflow using AI agents, custom instructions, and domain-specific patterns:
- [Exercise 1: Create a new project with AI Collaboration](#exercise-1-create-a-new-project-with-ai-collaboration)
- [Exercise 2: Custom instructions](#exercise-2-custom-instructions)
- [Exercise 3: Domain-Specific Custom Instructions](#exercise-3-domain-specific-custom-instructions)
  - [Part A: Identify Domains](#part-a-identify-domains-ai-as-sparring-partner--researcher)
  - [Part B: Create Domain Instruction Files](#part-b-create-domain-instruction-files)
  - [Part C: Generate Instructions with AI](#part-c-generate-instructions-with-ai-ai-as-researcher--implementer)
  - [Part D: Validate with AI](#part-d-validate-with-ai-ai-as-validator)
- [Exercise 4: Domain-Specific Chat Modes](#exercise-4-domain-specific-chat-modes) (VS Code only)
- [Exercise 5: Domain-Specific Prompt Files (Workflows)](#exercise-5-domain-specific-prompt-files-workflows)
  - [Part A: Plan Workflows with AI](#part-a-plan-workflows-with-ai-ai-as-sparring-partner)
  - [Part B: Create Prompt Files](#part-b-create-prompt-files)
  - [Part C: Implement Workflows with AI](#part-c-implement-workflows-with-ai-ai-as-implementer)
  - [Part D: Test and Refine Workflows](#part-d-test-and-refine-workflows-ai-as-validator)
- [Exercise 6: Implement Features Using Your Domain System](#exercise-6-implement-features-using-your-domain-system)
- [Debugging with Domain Context](#debugging-with-domain-context)

### [Track 2: Model Context Protocol (MCP) Integration](#model-context-protocol-recap-and-postgres-mcp-server-installation)
Learn to connect external tools and data sources to enhance Copilot's capabilities:
- [MCP Recap and PostgreSQL MCP Server Installation](#model-context-protocol-recap-and-postgres-mcp-server-installation)
  - [Microsoft Learn MCP Server](#microsoft-learn-mcp-server)
  - [Playwright MCP](#playwright-mcp)
  - [PostgreSQL MCP Server](#postgresql-mcp-server)
- [Using PostgreSQL MCP Server with Prompt Files](#using-postgresql-mcp-server-together-with-prompt-files)
- [Exploring Other MCP Servers](#other-mcp-servers)
- [PostgreSQL MCP Troubleshooting](#postgresql-mcp-troubleshooting)

### [Track 3: Copilot CLI and Agent Package Manager](#using-copilot-in-cli-and-vscode-terminal)
Master command-line AI workflows and package reusable AI context:
- [Using Copilot in CLI and VSCode Terminal](#using-copilot-in-cli-and-vscode-terminal)
  - [Exercise 1: Advanced Copilot CLI Exercises](#1-advanced-copilot-cli-exercises)
  - [Exercise 2: GitHub Repository Management](#2-github-repository-management)
  - [Exercise 3: Project Development Workflows](#3-project-development-workflows)
  - [Exercise 4: Model Selection and Feedback](#4-model-selection-and-feedback)
- [Agent Package Manager (APM) - Packaging AI Workflows](#agent-package-manager-apm---packaging-ai-workflows)

---

## Mastering Agent-Driven Development
**Target Audience:** Developers who have used Copilot and Agents, but want to shore up on the good practices and tools of agent usage.

### Exercise 1: Create a new project with AI Collaboration
* **Purpose:** Setup a new project collaboratively with AI, learning effective planning and implementation patterns.
* **Steps:**
    1. **Plan with AI (Ask mode):**
        * Use **Ask mode** with **Claude Sonnet 4/4.5**
        * Add `#file:EXERCISE_APP_IDEAS.md` if you need inspiration
        * Prompt: *"Help me design a [type of application]. Quiz me about requirements, tech stack, and architecture."*
        * Let AI ask clarifying questions about your preferences
    
    2. **Document the blueprint:**
        * Have AI generate a project specification
        * Save as `PROJECT_BLUEPRINT.md` with: purpose, tech stack, structure, key features
    
    3. **Initialize with Agent mode:**
        * Switch to **Agent mode**
        * Provide `#file:PROJECT_BLUEPRINT.md`
        * Prompt: *"Initialize this project based on the blueprint. Create structure and configuration files."*
    
    4. **Set up version control:**
        * Initialize git repository
        * Create `.gitignore` (important for [workspace indexing](https://code.visualstudio.com/docs/copilot/reference/workspace-context#_what-content-is-included-in-the-workspace-index))

### Exercise 2: Custom instructions
* **Purpose:** Create base-level custom instructions for project-wide conventions.
* **Documentation:** [Custom Instructions](https://code.visualstudio.com/docs/copilot/customization/custom-instructions)
* **Steps:**

* *In VSCode:*
    1. Click the **gear icon** in VS Code
    2. Select **"Generate Instructions for Copilot"**
    3. VS Code creates `.github/copilot-instructions.md`
    4. Review and enhance with project-specific details

* *In JetBrains:*
    1. Create `.github/copilot-instructions.md`
    2. Use Ask mode with your blueprint as context
    3. Prompt: *"Generate custom instructions for this project including coding standards and patterns."*
    4. Adjust to match your preferences

**Note:** This file contains universal guidelines. Domain-specific rules come in Exercise 3.

### Exercise 3: Domain-Specific Custom Instructions
* **Purpose:** Create targeted instruction files for different parts of your codebase using AI collaboration. Learn to use AI as a sparring partner for planning, researcher for best practices, and validator for consistency.
* **Documentation:** [Custom Instructions](https://code.visualstudio.com/docs/copilot/customization/custom-instructions)

#### Part A: Identify Domains (AI as Sparring Partner & Researcher)

1. **Collaborative discovery with AI (Ask mode):**
   * Switch to **Ask mode** and use **Claude Sonnet 4/4.5**
   * Add your project files as context (workspace or specific folders)
   * **Initial research prompt:** *"Analyze my project structure and files. Based on what you see, what domains (backend, frontend, tests, database, documentation, infrastructure) exist or should exist? Ask me clarifying questions about the architecture."*
   * Let AI ask questions about:
     * Your current folder structure
     * Planned features and their locations
     * Team organization and responsibilities
     * Testing strategies

2. **Research glob patterns with AI:**
   * For each identified domain, ask AI: *"What glob pattern would best match files in the [DOMAIN] domain? Consider my project structure and suggest specific patterns."*
   * Discuss and refine patterns to ensure they're neither too broad nor too narrow
   * Example patterns to discuss:
     * Backend: `src/api/**/*.ts`, `app/backend/**/*.py`
     * Frontend: `src/components/**/*.tsx`, `app/frontend/**/*.js`
     * Tests: `**/*.test.ts`, `**/*.spec.py`, `tests/**/*`
     * Database: `src/models/**/*.ts`, `migrations/**/*.sql`
     * Documentation: `docs/**/*.md`

3. **Identify domain-specific concerns with AI:**
   * For each domain, prompt: *"What are the key coding standards, security concerns, and best practices specific to [DOMAIN] development in [YOUR TECH STACK]?"*
   * AI will help identify concerns like:
     * Backend: Input validation, authentication, error handling, database transactions
     * Frontend: Accessibility, responsive design, state management, performance
     * Tests: Coverage requirements, test patterns, mocking strategies

4. **Document domain structure:**
   * Have AI help create `DOMAIN_STRUCTURE.md`
   * Prompt: *"Create a DOMAIN_STRUCTURE.md file documenting all domains we identified with their glob patterns and key concerns."*
   * Review and adjust the generated document

#### Part B: Create Domain Instruction Files

* *In VSCode:*
   1. Command palette (`cmd+shift+p`) → "Chat: New Instructions file"
   2. Select location: `.github/instructions`
   3. Name files by domain: `backend.instructions.md`, `frontend.instructions.md`, etc.

* *In JetBrains:*
   1. Create `.github/instructions/` folder
   2. Create files following pattern: `<domain>.instructions.md`

#### Part C: Generate Instructions with AI (AI as Researcher & Implementer)

**Work on one domain at a time.** For each domain:

1. **Research best practices (Ask mode):**
   * Before generating instructions, ask AI: *"What are the industry best practices and coding standards for [DOMAIN] development in [YOUR TECH STACK]? Consider security, performance, maintainability, and testing."*
   * Review AI's suggestions and discuss which ones fit your project

2. **Generate domain instructions (Agent mode):**
   * Switch to **Agent mode**
   * Provide comprehensive context:
     * `#file:.github/copilot-instructions.md` (base instructions)
     * `#file:DOMAIN_STRUCTURE.md` (domain plan)
     * `#file:PROJECT_BLUEPRINT.md` (project context)
   * Detailed prompt: *"Create domain-specific instructions for the [DOMAIN] domain. Use glob pattern `[PATTERN]`. Include coding standards for: [LIST SPECIFIC CONCERNS]. These instructions should complement our base instructions without duplication. Reference relevant files in our project where patterns should be followed."*

3. **Review and refine:**
   * Ask AI to explain any unfamiliar standards: *"Explain why you included [SPECIFIC STANDARD] and show me an example."*
   * Request adjustments: *"Make this more specific to our [FRAMEWORK/LIBRARY] setup."*

**Example - Testing Domain Instructions:**
```markdown
---
applyTo: "**/*.test.ts"
---
# Testing Standards for [Your Project]

## Test Structure
- Use AAA pattern (Arrange-Act-Assert) for clarity
- Descriptive test names that explain: what is tested, scenario, expected outcome
- Group related tests using `describe` blocks by feature or component

## Test Coverage
- Minimum 80% coverage for business logic
- 100% coverage for critical paths (authentication, payments, data validation)
- Focus on behavior, not implementation details

## Mocking Strategy
- Mock external dependencies (APIs, databases, file systems)
- Use test doubles for third-party services
- Keep mocks simple and focused

## Assertions
- Use specific matchers (`toEqual`, `toBe`, `toContain`) over generic ones
- Include descriptive error messages
- Test both success and failure scenarios
- Verify error messages and status codes

## Test Data
- Use factories or fixtures for complex objects
- Avoid hardcoded IDs or dates
- Clean up test data after each test

Follow examples in: tests/examples/user.test.ts
```

**Example - Backend API Instructions:**
```markdown
---
applyTo: "src/api/**/*.ts"
---
# Backend API Development Standards

## Request Handling
- Validate ALL input at API boundaries using [YOUR VALIDATION LIBRARY]
- Use typed request/response objects
- Implement rate limiting on public endpoints
- Log all requests with correlation IDs

## Error Handling
- Use consistent error response format: { error: string, code: string, details?: object }
- Never expose internal implementation details or stack traces
- Map errors to appropriate HTTP status codes
- Log errors with full context for debugging

## Security
- Validate and sanitize all inputs to prevent injection attacks
- Use parameterized queries for database access
- Implement proper authentication checks on protected routes
- Apply principle of least privilege for database connections

## Database
- Use transactions for multi-step operations
- Implement connection pooling
- Use migrations for schema changes
- Never use SELECT * in production code

## Performance
- Implement caching for frequently accessed data
- Use pagination for list endpoints (limit: 50 items default, 100 max)
- Set request timeouts (30 seconds default)
- Use async/await consistently

Reference: src/api/examples/user.controller.ts for patterns
```

#### Part D: Validate with AI (AI as Validator)

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

### Exercise 4: Domain-Specific Chat Modes
> VS Code only
* **Purpose:** Create specialized AI assistants with specific tools and boundaries that reinforce domain separation. These modes act as domain experts with focused responsibilities.
* **Documentation:** [Custom Chat Modes](https://code.visualstudio.com/docs/copilot/chat/chat-modes#_custom-chat-modes)

#### Planning Domain Specialists (AI as Sparring Partner)

1. **Design specialists with AI (Ask mode):**
   * Use Ask mode with `#file:DOMAIN_STRUCTURE.md` as context
   * Prompt: *"For each domain we identified (backend, frontend, tests, etc.), help me design a specialized chat mode. What specific tools, boundaries, and protocols should each specialist have? Consider what they should and shouldn't be allowed to do."*
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

#### Creating Chat Modes (AI as Implementer)

1. **Create chat mode files:**
   * Chat mode selector → "Configure modes" → "Create new custom chat mode file"
   * Create one per domain: `backend-specialist`, `frontend-specialist`, `test-engineer`, `database-specialist`, etc.

2. **Generate mode configuration with AI:**
   * Use Agent mode for each specialist
   * Provide context: `#file:DOMAIN_STRUCTURE.md` and corresponding domain instruction file
   * Prompt: *"Create a chat mode for a [DOMAIN] specialist. This specialist should only work on [DOMAIN] files matching pattern `[PATTERN]`. Include appropriate tools and clear boundaries. Reference the domain instruction file."*

**Example - Backend Specialist:**
```yaml
---
description: 'Backend API development specialist'
tools: ['codebase', 'terminal', 'problems', 'usages']
---
You are a backend API development specialist for this project.

## Your Responsibilities:
- Design and implement RESTful APIs
- Optimize database queries and schema design  
- Implement authentication and authorization
- Handle data validation and error handling
- Ensure API security and performance
- Write API documentation

## Your Boundaries:
- DO NOT modify frontend components or UI files
- DO NOT change styling, CSS, or visual elements
- DO NOT alter client-side state management
- ONLY work on server-side code and API contracts
- Focus exclusively on files matching: src/api/**/*.ts

## Your Protocols:
1. Always validate input data at API boundaries
2. Use proper HTTP status codes (200, 201, 400, 401, 403, 404, 500, etc.)
3. Implement comprehensive error handling with clear messages
4. Consider security implications of all changes (injection, XSS, CSRF)
5. Write or update API documentation for any endpoint changes
6. Suggest appropriate tests for new endpoints or logic
7. Follow database transaction patterns for multi-step operations

## Tools You Use:
- 'codebase': Understand existing API patterns and conventions
- 'terminal': Run backend tests, migrations, and development server
- 'problems': Identify and fix backend compilation/runtime errors
- 'usages': Find how APIs are called to ensure backward compatibility

Always follow the standards in: #file:.github/instructions/backend.instructions.md
```

**Example - Frontend Specialist:**
```yaml
---
description: 'Frontend UI/UX development specialist'
tools: ['codebase', 'terminal', 'problems']
---
You are a frontend development specialist focused on user interfaces.

## Your Responsibilities:
- Build responsive and accessible UI components
- Implement state management solutions
- Optimize frontend performance
- Ensure cross-browser compatibility
- Create intuitive user interactions
- Maintain design system consistency

## Your Boundaries:
- DO NOT modify backend API logic or endpoints
- DO NOT change database schemas or queries
- DO NOT alter authentication/authorization mechanisms
- ONLY work on client-side code and components
- Focus exclusively on files matching: src/components/**/*.tsx

## Your Protocols:
1. Ensure all components are accessible (ARIA labels, keyboard navigation, semantic HTML)
2. Implement proper loading states, error states, and empty states
3. Follow responsive design principles (mobile-first approach)
4. Optimize for performance (lazy loading, code splitting, memoization)
5. Use TypeScript for type safety
6. Write component tests for new features
7. Follow design system guidelines

## Tools You Use:
- 'codebase': Understand component patterns and design system
- 'terminal': Run dev server, build process, and frontend tests
- 'problems': Fix TypeScript errors and linting issues

Always follow the standards in: #file:.github/instructions/frontend.instructions.md
```

**Example - Test Engineer:**
```yaml
---
description: 'Test automation and quality assurance specialist'
tools: ['codebase', 'terminal', 'problems', 'usages']
---
You are a test automation specialist ensuring code quality.

## Your Responsibilities:
- Write comprehensive unit tests for all new features
- Create integration tests for API endpoints
- Develop E2E tests for critical user flows
- Maintain test coverage above project thresholds
- Identify edge cases and error scenarios
- Refactor tests for maintainability

## Your Boundaries:
- DO NOT implement feature code without corresponding tests
- DO NOT modify production code without updating affected tests
- Focus on test quality, coverage, and reliability

## Your Protocols:
1. Follow AAA pattern (Arrange, Act, Assert) for all tests
2. Write descriptive test names that document behavior
3. Use appropriate mocking strategies (mock external dependencies only)
4. Ensure tests are isolated and can run in any order
5. Test both success paths and failure scenarios
6. Include edge cases and boundary conditions
7. Maintain test fixtures and factories for reusability

## Tools You Use:
- 'codebase': Understand code to be tested and existing test patterns
- 'terminal': Run test suites, check coverage, run tests in watch mode
- 'problems': Fix failing tests and coverage gaps
- 'usages': Find all code paths that need testing

Always follow the standards in: #file:.github/instructions/tests.instructions.md
```

#### Validate Chat Modes (AI as Validator)

1. **Test each specialist mode:**
   * Select the custom mode in chat selector
   * Ask domain-specific questions: *"What should I consider when creating a new [FEATURE] in this domain?"*
   * Verify the mode:
     * References the correct domain instruction file
     * Stays within its boundaries when making suggestions
     * Uses appropriate tools for the domain

2. **Test boundary enforcement:**
   * In **backend-specialist** mode, ask: *"How should I style this button?"*
   * AI should refuse and suggest using frontend-specialist instead
   * Prompt for validation: *"You just asked me to work outside my domain. Am I correctly respecting my boundaries?"*

3. **Cross-domain coordination test:**
   * Think of a feature that spans multiple domains
   * Switch between specialist modes as needed
   * Verify each specialist maintains focus on their domain
   * Ask AI: *"Review my use of domain specialists. Did each stay within their responsibilities?"*

### Exercise 5: Domain-Specific Prompt Files (Workflows)
* **Purpose:** Create reusable prompt files that serve as automated workflows for your domain specialists. These prompts encapsulate best practices and common tasks.

#### Part A: Plan Workflows with AI (AI as Sparring Partner)

1. **Identify common workflows (Ask mode):**
   * For each domain, use Ask mode with the corresponding specialist chat mode context
   * Prompt: *"For the [DOMAIN] domain in my project, what are the most common repetitive tasks that developers perform? Which of these would benefit from a standardized, automated workflow?"*
   * AI will suggest workflows like:
     * **Backend:** Create new endpoint, add middleware, create database migration, add validation schema
     * **Frontend:** Create component, add form with validation, create page with routing, add API integration
     * **Tests:** Generate unit tests, create integration test suite, add E2E test scenario, update test fixtures

2. **Design workflow steps with AI:**
   * For each workflow, ask: *"Walk me through the steps a developer should follow to [TASK]. What information do they need to provide? What files need to be created or modified? What validations should happen?"*
   * Discuss and refine the workflow until it's comprehensive

#### Part B: Create Prompt Files

* *In VSCode:* 
   * Command palette (`Shift+Cmd/Ctrl+P`) → "Chat: new prompt file"
   * Select `prompts` folder
   * Name with domain prefix: `backend-new-endpoint.prompt.md`, `frontend-new-component.prompt.md`

* *In JetBrains:* 
   * Create `.github/prompts/` folder if it doesn't exist
   * Create files: `<domain>-<workflow>.prompt.md`

#### Part C: Implement Workflows with AI (AI as Implementer)

For each workflow:

1. **Generate prompt file (Agent mode):**
   * Switch to **Agent mode**
   * Provide context: workflow plan, domain instruction file, specialist chat mode
   * Prompt: *"Create a prompt file for [WORKFLOW]. It should use the [DOMAIN-SPECIALIST] mode and guide the user through [STEPS]. Ask for necessary inputs, then implement according to our domain standards."*

**Example - Backend: New API Endpoint**
```markdown
---
mode: 'backend-specialist'
tools: ['codebase', 'terminal', 'usages']
description: 'Create a new RESTful API endpoint with full implementation'
---
You will create a new RESTful API endpoint following our backend standards.

## Step 1: Gather Requirements
Ask the user for:
1. **Resource name** (singular and plural forms, e.g., "user"/"users")
2. **HTTP methods** needed (GET, POST, PUT, PATCH, DELETE)
3. **Data model/schema** (what fields, types, required/optional, validations)
4. **Query parameters** (for GET: filtering, sorting, pagination)
5. **Business rules** (any special validation or processing logic)
6. **Authentication** requirements (public, authenticated, role-based)

## Step 2: Implementation Checklist

### 2.1 Define Data Model
- Create or update the database schema/model
- Add field validations (required, min/max length, format, etc.)
- Set up relationships with other models if needed
- Create migration file if using migrations

### 2.2 Create API Route Handler
- Define route in routing file (following project structure)
- Implement handler function for each HTTP method:
  - **GET (list):** Support filtering, sorting, pagination
  - **GET (single):** Fetch by ID with error handling for not found
  - **POST:** Validate input, create resource, return 201 with location header
  - **PUT/PATCH:** Validate input, update resource, handle not found
  - **DELETE:** Remove resource, handle not found, return 204

### 2.3 Add Validation
- Create validation schema using [YOUR VALIDATION LIBRARY]
- Validate request body, query params, and path params
- Return 400 Bad Request with detailed error messages for validation failures

### 2.4 Implement Error Handling
- Wrap async operations in try-catch
- Map different error types to appropriate HTTP status codes
- Use consistent error response format
- Log errors with context for debugging

### 2.5 Add Authentication/Authorization
- Apply authentication middleware if required
- Check user permissions for the operation
- Return 401 Unauthorized or 403 Forbidden as appropriate

### 2.6 Generate Tests
- Create unit tests for validation logic
- Create integration tests for each endpoint:
  - Test successful operations
  - Test validation errors (400)
  - Test authentication/authorization (401/403)
  - Test not found scenarios (404)
  - Test server errors (500)

### 2.7 Update Documentation
- Add/update API documentation (OpenAPI/Swagger annotations)
- Include example requests and responses
- Document error scenarios

## Step 3: Verification
After implementation:
1. Run the test suite to ensure all tests pass
2. Verify the endpoint using the test cases
3. Check that no existing tests were broken

Follow all standards from: #file:.github/instructions/backend.instructions.md

Check existing endpoints in the codebase for patterns to follow.
```

**Example - Frontend: New Component**
```markdown
---
mode: 'frontend-specialist'
tools: ['codebase', 'terminal']
description: 'Create a new React component with tests and styling'
---
You will create a new React component following our frontend standards.

## Step 1: Gather Requirements
Ask the user for:
1. **Component name** (e.g., "UserProfile", "ProductCard")
2. **Component purpose** (what it displays/does)
3. **Props interface** (what data it receives)
4. **State requirements** (what local state it manages)
5. **User interactions** (clicks, inputs, hovers, etc.)
6. **Styling approach** (CSS modules, styled-components, Tailwind, etc.)
7. **Accessibility requirements** (ARIA labels, keyboard navigation needs)

## Step 2: Implementation Checklist

### 2.1 Create Component Structure
- Create component file: `src/components/[ComponentName]/[ComponentName].tsx`
- Define TypeScript Props interface
- Implement functional component with proper typing
- Add display name for debugging: `ComponentName.displayName = 'ComponentName'`

### 2.2 Implement Component Logic
- Set up state using useState or useReducer as appropriate
- Implement event handlers for user interactions
- Add useEffect hooks for side effects if needed
- Use useCallback for event handlers passed to children
- Use useMemo for expensive computations

### 2.3 Add Accessibility Features
- Use semantic HTML elements (button, nav, article, etc.)
- Add ARIA labels for interactive elements
- Implement keyboard navigation (tab order, Enter/Space for actions)
- Add focus management for modals/overlays
- Include skip links where appropriate
- Test with screen reader in mind

### 2.4 Create Styling
- Create style file: `[ComponentName].module.css` or styled component
- Implement responsive design (mobile-first approach)
- Follow design system tokens for colors, spacing, typography
- Add hover, focus, and active states for interactive elements
- Ensure sufficient color contrast (WCAG AA minimum)

### 2.5 Implement Loading and Error States
- Add loading state UI (spinner, skeleton, etc.)
- Add error state UI (error message, retry button)
- Add empty state UI if applicable
- Ensure states are accessible (announce to screen readers)

### 2.6 Create Component Tests
- Create test file: `[ComponentName].test.tsx`
- Test component renders without crashing
- Test it renders with different props
- Test user interactions (clicks, inputs)
- Test keyboard navigation
- Test accessibility (check for ARIA attributes)
- Test error and loading states

### 2.7 Create Storybook Story (if using Storybook)
- Create story file: `[ComponentName].stories.tsx`
- Add default story
- Add stories for different states (loading, error, empty)
- Add stories for different prop combinations

### 2.8 Update Documentation
- Add JSDoc comments to component and props
- Create usage examples in comments
- Update component documentation if you maintain one

## Step 3: Verification
After implementation:
1. Run component tests to ensure they pass
2. Run the dev server and visually verify the component
3. Test keyboard navigation manually
4. Verify responsive behavior on different screen sizes
5. Check that linting and type-checking pass

Follow all standards from: #file:.github/instructions/frontend.instructions.md

Check existing components for patterns to follow: #codebase
```

**Example - Tests: Comprehensive Test Generation**
```markdown
---
mode: 'test-engineer'
tools: ['codebase', 'terminal', 'usages']
description: 'Generate comprehensive test suite for existing code'
---
You will create a comprehensive test suite for existing code.

## Step 1: Analyze Code
Ask the user for:
1. **File or function** to test (path to file or function name)
2. **Type of tests** needed (unit, integration, E2E, or all)
3. **Coverage goals** (target percentage or specific scenarios)

Then analyze:
- All public functions/methods that need testing
- Dependencies that need mocking
- Edge cases and error scenarios
- Integration points with other modules

## Step 2: Implementation Checklist

### 2.1 Set Up Test File
- Create test file matching naming convention: `[filename].test.ts`
- Import necessary testing utilities and libraries
- Set up any test environment configuration needed

### 2.2 Create Test Structure
- Use `describe` blocks to group related tests
- Organize by: feature, method, or user scenario
- Use nested `describe` for sub-features or variations

### 2.3 Write Unit Tests
For each function/method:
- **Happy path test:** Test with valid inputs, expected outputs
- **Edge cases:** Empty inputs, null/undefined, min/max values, boundary conditions
- **Error cases:** Invalid inputs, error conditions, exceptions thrown
- **Side effects:** Verify function calls, state changes, event emissions

### 2.4 Implement Test Helpers
- Create test data factories for complex objects
- Set up mock functions for dependencies
- Create shared setup/teardown logic in `beforeEach`/`afterEach`
- Build reusable test utilities for common patterns

### 2.5 Write Integration Tests (if applicable)
- Test interactions between multiple modules
- Use test database or in-memory database
- Test API contracts between layers
- Verify data flow through the system

### 2.6 Add Test Documentation
- Use descriptive test names: `it('should return 404 when user not found')`
- Add comments for complex test setups
- Document any test data assumptions
- Explain why specific mocks or stubs are used

### 2.7 Verify Coverage
- Run tests with coverage report
- Identify untested lines and branches
- Add tests for uncovered code paths
- Aim for coverage goals (>80% for business logic)

## Step 3: Verification
After implementation:
1. Run test suite and verify all tests pass
2. Check coverage report meets goals
3. Ensure tests are deterministic (pass consistently)
4. Verify tests run quickly (under 5 seconds for unit tests)
5. Check that tests fail when they should (temporarily break code)

Follow all standards from: #file:.github/instructions/tests.instructions.md

Reference existing test patterns: #codebase
```

#### Part D: Test and Refine Workflows (AI as Validator)

1. **Test each prompt:**
   * Use the appropriate specialist mode
   * Run the prompt by typing `/[prompt-name]` in chat
   * Provide test inputs and let AI execute the workflow
   * Verify the workflow produces expected results

2. **Validate workflow quality:**
   * Ask AI: *"Review the /[workflow-name] prompt. Does it cover all necessary steps? Are there any edge cases or best practices missing?"*
   * Request improvements: *"Make the workflow more robust by adding [SPECIFIC ENHANCEMENT]."*

3. **Test workflow boundaries:**
   * Ensure workflows use the correct specialist mode
   * Verify they follow domain-specific instructions
   * Check that they don't cross domain boundaries inappropriately

### Exercise 6: Implement Features Using Your Domain System
* **Purpose:** Apply your domain specialists, workflows, and instructions to build real features. This is where everything comes together.

#### Planning Implementation with AI (AI as Sparring Partner)

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

#### Implementation Workflow (AI as Implementer)

**For each feature, follow this structured approach:**

1. **Backend Implementation (Backend Specialist):**
   * Switch to **backend-specialist** mode
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
   * If you have a database specialist mode, use it
   * Otherwise, stay in backend-specialist mode
   * Create migrations or schema updates
   * Add seed data for development/testing
   * Verify database integrity constraints

3. **Frontend Implementation (Frontend Specialist):**
   * Switch to **frontend-specialist** mode  
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
   * Switch to **test-engineer** mode
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

#### Model Selection Strategy (Choose the Right AI for the Task)

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

#### Leverage Agent Mode Capabilities

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

#### Example Implementation Session

Here's how to use your domain system for a complete feature:

```
Feature: User Profile Management

1. Planning Phase (Ask mode - Claude Sonnet 4):
   "I want to implement user profile management. Create a step-by-step plan 
   using our domain specialists and workflows."
   
   → AI provides plan with: backend API, frontend components, tests

2. Backend Phase (backend-specialist mode):
   "/backend-new-endpoint"
   → Creates: Profile model, GET/PUT endpoints, validation, error handling
   
   Validation: "Review this API for security issues"
   → AI checks: auth, input validation, SQL injection protection

3. Frontend Phase (frontend-specialist mode):
   "/frontend-new-component"
   → Creates: ProfileForm component with validation, API integration
   
   Validation: "Check this form for accessibility"
   → AI verifies: ARIA labels, keyboard navigation, focus management

4. Testing Phase (test-engineer mode):
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

#### Collaboration Tips

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

### Model Context Protocol recap and Postgres MCP server installation
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

##### Creating a QA Expert Chat Mode with Playwright

Now that you have Playwright MCP running, create a specialized QA expert mode that can perform exploratory testing:

1. **Create the QA Expert Chat Mode:**
   * Chat mode selector → "Create new custom chat mode file"
   * Name it `qa-explorer.chatmode.md`
   * Example configuration:

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

2. **Create Exploratory Testing Prompt:**
   * Create `.github/prompts/exploratory-test.prompt.md`:

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

3. **Test the QA workflow:**
   * Switch to **qa-explorer** mode
   * Run `/exploratory-test`
   * Provide your application URL
   * Let the AI conduct exploratory testing of your features

#### PostgreSQL MCP Server
* Note: Docker required. See instructions at the end of the documentation for using NPM and Podman.
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
you are currently using for work.

---

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

---

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



