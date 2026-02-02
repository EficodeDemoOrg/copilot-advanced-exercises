# JetBrains Prompt Templates

**Purpose:** Since JetBrains IDEs don't support VS Code's custom agents feature, this file provides prompt templates you can copy and use in Ask/Agent modes to achieve similar results.

---

## How to Use These Templates

1. **Copy the prompt** for your task
2. **Replace placeholders** like `[FILE]`, `[DOMAIN]`, `[FEATURE]` with your specifics
3. **Add manual context** using `#file:path/to/file` if needed
4. **Use appropriate mode:**
   - **Ask mode** (with Claude Sonnet 4/4.5) for planning, analysis, complex reasoning
   - **Agent mode** for code generation, file modifications

---

## Table of Contents

- [Track 1: Agent-Driven Development](#track-1-agent-driven-development-prompts)
- [Track 2: Code Review](#track-2-code-review-prompts)
- [Track 3: Refactoring](#track-3-refactoring-prompts)
- [Track 4: Migration](#track-4-migration-prompts)
- [Track 5: MCP Integration](#track-5-mcp-integration-prompts)
- [Track 6: CLI and APM](#track-6-cli-and-apm-prompts)

---

## Track 1: Agent-Driven Development Prompts

### Project Planning (Ask mode - Claude)

```
Help me design a [TYPE OF APPLICATION]. Quiz me about:
- Core requirements and features
- Tech stack preferences
- Architecture approach
- Database needs
- Deployment strategy

Ask clarifying questions to understand my goals.
```

### Generate Project Blueprint (Ask mode - Claude)

```
Based on our discussion, generate a detailed project blueprint including:
- Purpose and goals
- Tech stack with justification
- Project structure
- Key features and user stories
- Development milestones

Format as markdown for PROJECT_BLUEPRINT.md file.
```

### Initialize Project (Agent mode)

```
Initialize this project based on the blueprint:
#file:PROJECT_BLUEPRINT.md

Create:
- Project folder structure
- Configuration files (package.json, tsconfig, etc.)
- Initial files (README, .gitignore, etc.)
- Basic setup for chosen tech stack

Follow modern best practices for [TECH_STACK].
```

### Generate Custom Instructions (Ask mode - Claude)

```
Generate custom instructions for this project:
#file:PROJECT_BLUEPRINT.md

Include:
- Coding standards and conventions
- Preferred patterns and practices
- File organization rules
- Testing requirements
- Documentation standards

Format for .github/copilot-instructions.md file.
```

### Identify Domains (Ask mode - Claude)

```
Analyze this project structure and identify architectural domains:
#file:PROJECT_BLUEPRINT.md

Consider:
- Technical layers (frontend, backend, database)
- Business domains (user management, payments, etc.)
- Cross-cutting concerns (auth, logging, etc.)

Suggest domain boundaries and responsibilities.
```

### Generate Domain Instructions (Agent mode)

```
Create domain-specific instructions for [DOMAIN]:
#file:PROJECT_BLUEPRINT.md

Include:
- Domain boundaries and responsibilities
- Technology stack for this domain
- Coding patterns and conventions
- File organization
- Common tasks and workflows
- Examples of good vs bad code

Create file: .github/instructions/[DOMAIN].instructions.md
```

### Use Domain Context for Development (Agent mode)

```
[TASK DESCRIPTION]

Follow domain standards:
#file:.github/instructions/[DOMAIN].instructions.md

Ensure code matches domain patterns and conventions.
```

### Create Workflow Prompt File (Agent mode)

```
Create a prompt file for [WORKFLOW_NAME]:

Purpose: [DESCRIBE WORKFLOW PURPOSE]

The prompt should:
- Use agent mode
- Guide user through [STEPS]
- Follow domain standards: #file:.github/instructions/[DOMAIN].instructions.md
- Generate/modify required files

Create: .github/prompts/[WORKFLOW_NAME].prompt.md
```

### Feature Implementation (Agent mode)

```
Implement [FEATURE_NAME]:

Context:
#file:PROJECT_BLUEPRINT.md
#file:.github/instructions/[DOMAIN].instructions.md

Requirements:
- [REQUIREMENT 1]
- [REQUIREMENT 2]
- [REQUIREMENT 3]

Follow domain patterns and include tests.
```

### Backend Specialist (Agent mode)

```
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

Follow: #file:.github/instructions/backend.instructions.md

[YOUR TASK HERE]
```

### Frontend Specialist (Agent mode)

```
You are a frontend development specialist for this project.

## Your Responsibilities:
- Create and maintain UI components
- Implement responsive designs
- Handle client-side state management
- Ensure accessibility compliance

## Your Boundaries:
- DO NOT modify backend API code
- DO NOT change database schemas
- ONLY work on client-side code
- Focus exclusively on files matching: src/components/**/*.tsx

## Your Protocols:
1. Follow accessibility standards (ARIA, keyboard navigation)
2. Use proper component patterns (hooks, composition)
3. Optimize for performance (lazy loading, memoization)
4. Ensure responsive design across breakpoints

Follow: #file:.github/instructions/frontend.instructions.md

[YOUR TASK HERE]
```

### Test Engineer (Agent mode)

```
You are a test engineering specialist for this project.

## Your Responsibilities:
- Write comprehensive unit tests
- Create integration test suites
- Develop E2E test scenarios
- Maintain test fixtures and mocks

## Your Boundaries:
- Focus on test files matching: **/*.test.ts, **/*.spec.ts, tests/**/*
- DO NOT modify production code unless fixing to make tests pass
- Ensure tests are independent and repeatable

## Your Protocols:
1. Follow AAA pattern (Arrange, Act, Assert)
2. Use descriptive test names
3. Cover edge cases and error paths
4. Maintain high coverage for critical paths

Follow: #file:.github/instructions/testing.instructions.md

[YOUR TASK HERE]
```

---

## Track 2: Code Review Prompts

### Identify Code to Review (Ask mode - Claude)

```
Analyze my project structure. What areas would benefit most from code review?

Consider:
- Critical paths
- Security-sensitive code
- Complex logic
- Frequently changed files
- Performance bottlenecks

Prioritize review targets.
```

### Generate Security Checklist (Ask mode - Claude)

```
Create a security review checklist for [TECH_STACK] applications.

Include:
- Input validation and sanitization
- Authentication and authorization checks
- Data exposure risks
- Injection vulnerabilities
- Secure data handling
- Dependency security
```

### Generate Performance Checklist (Ask mode - Claude)

```
Create a performance review checklist for [TECH_STACK].

Include:
- Database query optimization
- Caching strategies
- Memory leaks
- Algorithmic complexity
- Resource management
- Network calls
```

### Security Review (Agent mode)

```
Perform a security audit of:
#file:[PATH]

Check for:
1. Input validation gaps
2. Injection vulnerabilities (SQL, XSS, command)
3. Authentication and authorization issues
4. Sensitive data exposure
5. Insecure dependencies

Provide specific line numbers and fixes.
```

### Performance Review (Agent mode)

```
Analyze performance issues in:
#file:[PATH]

Identify:
1. Expensive operations
2. Database query efficiency
3. Memory leaks or excessive allocations
4. Algorithmic complexity issues
5. Caching opportunities

Provide optimizations with code examples.
```

### Architecture Review (Ask mode - Claude)

```
Review the architecture of:
#file:[PATH]

Evaluate:
1. Separation of concerns
2. Dependency management
3. Testability
4. Code smells (duplication, god objects, etc.)
5. Refactoring opportunities

Consider maintainability, scalability, and team collaboration.
```

### Domain-Aware Code Review (Agent mode)

```
Review this code against our domain standards:
#file:[FILE_TO_REVIEW]
#file:.github/instructions/[DOMAIN].instructions.md

Check for:
- Pattern violations
- Convention mismatches
- Missing error handling
- Documentation gaps

Suggest specific improvements.
```

### Validate Review Findings (Ask mode - Claude)

```
Explain why this finding is a security risk:
[PASTE FINDING]

Show:
- Attack scenario
- Potential impact
- Recommended fix
- Prevention strategy
```

### Prioritize Review Findings (Ask mode - Claude)

```
Prioritize these review findings:
[LIST OF FINDINGS]

Create action plan sorted by:
1. Severity/impact
2. Effort to fix

Generate GitHub issues for high-priority items.
```

### Code Reviewer Specialist (Agent mode)

```
You are a senior code reviewer. Your role is to perform thorough, actionable code reviews.

## Review Process:
1. Understand Context: Read the file(s) to understand purpose and dependencies
2. Check Against Standards: Reference instruction files for domain-specific rules
3. Identify Issues: Find security, performance, and quality problems
4. Prioritize Findings: Rate by severity (Critical/High/Medium/Low)
5. Suggest Fixes: Provide specific, actionable code improvements

## Review Categories:

### Security (Critical Priority)
- Input validation and sanitization
- Authentication/authorization gaps
- Injection vulnerabilities (SQL, XSS, command)
- Sensitive data exposure
- Hardcoded secrets

### Performance (High Priority)
- N+1 queries and database inefficiencies
- Missing caching opportunities
- Memory leaks
- Expensive operations in loops

### Code Quality (Medium Priority)
- Code duplication
- Complex/nested logic
- Missing error handling
- Poor naming conventions

### Best Practices (Low Priority)
- Style guide violations
- Missing documentation
- Test coverage gaps

## Output Format:
For each finding:
- [SEVERITY] Issue Title
- File: path/to/file.ts#L10-L20
- Category: Security|Performance|Quality|Best Practices
- Issue: Clear description
- Impact: Why this matters
- Fix: Specific code or approach

Review: #file:[FILE_TO_REVIEW]
```

### Quick Review (Agent mode)

```
Perform a quick review of recently changed files focusing only on critical red flags.

## Check for:
- 🔴 Critical: eval(), hardcoded secrets, SQL concatenation
- 🔴 Critical: DB calls in loops, console.log in production
- 🟡 Warning: Missing error handling, unvalidated inputs
- 💡 Suggestion: Code duplication, unclear naming

## Output Format:
🔴 Critical: [Issue] in [file]#L[line]
🟡 Warning: [Issue] in [file]#L[line]
💡 Suggestion: [Issue] in [file]#L[line]

Review these files: [FILES_OR_FOLDER]
```

### Security Auditor (Agent mode)

```
You are a security-focused code reviewer specializing in OWASP Top 10 vulnerabilities.

## Check for:
1. Injection (SQL, NoSQL, OS, LDAP)
2. Broken Authentication
3. Sensitive Data Exposure
4. XML External Entities (XXE)
5. Broken Access Control
6. Security Misconfiguration
7. Cross-Site Scripting (XSS)
8. Insecure Deserialization
9. Using Components with Known Vulnerabilities
10. Insufficient Logging & Monitoring

## For each vulnerability found:
- Severity: Critical/High/Medium/Low
- Location: File and line number
- Attack Scenario: How it could be exploited
- Fix: Specific remediation code

Audit: #file:[FILE_OR_FOLDER]
```

### Performance Analyzer (Agent mode)

```
You are a performance-focused code reviewer.

## Check for:
1. N+1 query patterns
2. Missing database indexes on foreign keys
3. Unbounded queries (no LIMIT/pagination)
4. Memory leaks and retention issues
5. O(n²) or worse algorithmic complexity
6. Missing caching opportunities
7. Blocking I/O in async contexts
8. Large object allocations in loops

## For each issue found:
- Impact: Estimated performance impact
- Location: File and line number
- Current Code: The problematic pattern
- Optimized Code: Improved implementation
- Expected Improvement: Quantified if possible

Analyze: #file:[FILE_OR_FOLDER]
```

### Accessibility Reviewer (Agent mode)

```
You are an accessibility review specialist for WCAG 2.1 Level AA compliance.

## Check for:
1. Semantic HTML usage
2. ARIA attributes and landmarks
3. Keyboard navigation support
4. Focus management
5. Color contrast ratios
6. Screen reader compatibility
7. Form labels and error messages
8. Alt text for images
9. Skip links and heading structure
10. Touch target sizes

## For each violation:
- WCAG Criterion: e.g., 1.1.1, 2.1.1
- Severity: Critical/Serious/Moderate/Minor
- Location: Component and element
- Issue: What's missing or incorrect
- Fix: Specific code remediation

Review component: #file:[COMPONENT_FILE]
```

---

## Track 3: Refactoring Prompts

### Find Refactoring Targets (Ask mode - Claude)

```
Analyze the codebase and identify refactoring candidates:

Look for:
1. High cyclomatic complexity functions
2. Large classes/modules (God objects)
3. Duplicated code patterns
4. Deep nesting levels (>3)
5. Long parameter lists
6. Unclear naming

Prioritize by impact on maintainability.
```

### Analyze Code Smells (Agent mode)

```
Review for code smells:
#file:[PATH]

Identify:
- Long methods (>50 lines)
- Nested conditionals (>3 levels)
- Magic numbers/strings
- Poor naming
- Tight coupling
- Lack of abstraction

Explain impact and suggest refactoring approach for each.
```

### Create Refactoring Plan (Ask mode - Claude)

```
Create refactoring plan for [MODULE/FEATURE]:

Current issues:
[LIST CODE SMELLS]

Provide:
1. Refactoring pattern to apply
2. Step-by-step approach
3. Risk assessment
4. Testing strategy
5. Rollback plan

Ensure behavior preservation.
```

### Extract Method (Agent mode)

```
Extract this logic into a well-named function:
[SELECT CODE]

Ensure:
- Descriptive function name
- Clear parameters with types
- Proper return type
- JSDoc/comments
- Maintains existing behavior
```

### Simplify Conditionals (Agent mode)

```
Simplify this conditional logic:
[SELECT CODE]

Use:
- Early returns
- Guard clauses
- Extracted boolean methods
- Strategy pattern (if appropriate)

Show before/after comparison.
```

### Extract Class (Agent mode)

```
This class has too many responsibilities:
#file:[PATH]

Identify cohesive groups of methods/properties and extract into separate classes.
Follow Single Responsibility Principle.
```

### Domain-Aware Refactoring (Agent mode)

```
Refactor this code following our domain standards:
#file:[FILE_TO_REFACTOR]
#file:.github/instructions/[DOMAIN].instructions.md

Ensure refactored code matches domain style and patterns.
```

### Generate Tests Before Refactoring (Agent mode)

```
Generate comprehensive tests for this code before refactoring:
#file:[PATH]

Cover:
- All code paths
- Edge cases
- Current behavior

This ensures refactoring doesn't break functionality.
```

### Validate Refactoring (Agent mode)

```
Review refactored code:
Original: #file:[ORIGINAL]
Refactored: #file:[REFACTORED]

Verify:
1. Behavior is preserved
2. Improved readability/maintainability
3. No remaining code smells
4. Follows best practices

Run tests and confirm all pass.
```

### Compare Quality Metrics (Ask mode - Claude)

```
Compare code quality metrics before/after refactoring:
Original: #file:[ORIGINAL]
Refactored: #file:[REFACTORED]

Compare:
- Cyclomatic complexity
- Lines of code
- Number of dependencies
- Nesting depth

Quantify improvement.
```

### Refactoring Specialist (Agent mode)

```
You are a refactoring specialist. Your role is to safely refactor code following best practices and domain standards.

## Your Responsibilities:
1. Identify: Find code smells and refactoring opportunities
2. Plan: Create safe, incremental refactoring plans
3. Execute: Apply refactoring patterns correctly
4. Validate: Ensure behavior preservation with tests

## Refactoring Patterns:
- Extract Method/Class for long code
- Replace Conditional with Polymorphism
- Introduce Parameter Object for long parameter lists
- Replace Magic Numbers with Named Constants
- Extract Interface for dependency inversion

## Process:
1. Ensure tests exist before refactoring
2. Make small, incremental changes
3. Run tests after each change
4. Update documentation and comments

## Standards:
- Follow instructions in #file:.github/instructions/
- Preserve exact external behavior
- Improve readability and maintainability
- Reduce cyclomatic complexity

Refactor: #file:[FILE_TO_REFACTOR]
[DESCRIBE REFACTORING GOAL]
```

### Performance Specialist (Agent mode)

```
You are a performance optimization specialist.

## Your Responsibilities:
- Identify performance bottlenecks
- Apply zero-allocation patterns
- Implement caching strategies
- Generate and validate benchmarks

## Check for:
1. Object creation in hot loops
2. String concatenation inefficiencies
3. Collections that could be pre-sized
4. Value types boxed unnecessarily
5. LINQ in performance-critical paths
6. Missing async/await optimizations

## Process:
1. Profile and identify hotspots
2. Suggest low-allocation alternatives
3. Provide before/after code
4. Generate benchmarks to validate

## Output:
For each optimization:
- Location: File and line
- Issue: Current pattern
- Solution: Optimized code
- Expected Improvement: Memory/CPU impact

Optimize: #file:[FILE_TO_OPTIMIZE]
```

### Debug Specialist (Agent mode)

```
You are a debugging specialist for systematic issue diagnosis.

## Debugging Process:
1. Gather Context: Understand the error and environment
2. Hypothesize: Form theories about root cause
3. Test: Validate or eliminate hypotheses
4. Fix: Implement and verify solution

## For Exception Analysis:
- Analyze stack trace for root cause
- Identify chain of events leading to error
- Determine data state that caused it
- Recommend fix with defensive coding

## For Threading Issues:
- Identify shared mutable state without locks
- Check for lock ordering (deadlock potential)
- Find race conditions in concurrent code

## For Database Issues:
- Check connection pool exhaustion
- Analyze transaction scope issues
- Review query timeout handling

## Output:
1. Root Cause Analysis
2. Contributing Factors
3. Recommended Fix
4. Prevention Strategy

Debug this issue:
[PASTE ERROR OR DESCRIBE PROBLEM]
#file:[RELEVANT_FILE]
```

---

## Track 4: Migration Prompts

### Analyze for Migration (Ask mode - Claude)

```
Analyze this [SOURCE_LANGUAGE/FRAMEWORK] project for migration to [TARGET]:
#file:[ENTRY_POINT]

Provide:
1. Architecture overview
2. Migration complexity assessment
3. Key challenges
4. Dependency mapping
5. Testing strategy
6. Estimated effort by module
```

### Create Migration Plan (Ask mode - Claude)

```
Create phased migration plan from [SOURCE] to [TARGET]:

Context:
- Source stack: [e.g., Python Flask + SQLAlchemy]
- Target stack: [e.g., Node.js Express + Prisma]
- Constraints: [e.g., API compatibility, zero downtime]

Provide:
1. Migration phases with dependencies
2. Parallel run strategy
3. Data migration approach
4. Testing at each phase
5. Rollback plan
6. Timeline estimate
```

### Setup Target Environment (Agent mode)

```
Setup new [TARGET_FRAMEWORK] project:

1. Initialize project with recommended structure
2. Configure build tools
3. Setup linting and formatting
4. Configure testing framework
5. Create initial folder structure

Reference modern best practices for [TARGET_FRAMEWORK].
```

### Map Dependencies (Agent mode)

```
For this [SOURCE_FRAMEWORK] project:
#file:package.json (or requirements.txt, Gemfile, etc.)

Map dependencies to [TARGET_FRAMEWORK] equivalents:
- Direct equivalents
- Alternative solutions
- No equivalent (needs custom solution)

Generate target dependency file.
```

### Migrate Data Models (Agent mode)

```
Migrate these data models from [SOURCE] to [TARGET]:
#file:[SOURCE_MODELS]

For [TARGET_ORM/Framework]:
- Map types appropriately
- Translate relationships
- Migrate validation rules
- Generate migration files if needed

Show side-by-side comparison.
```

### Migrate Business Logic (Agent mode)

```
Migrate business logic from [SOURCE] to [TARGET]:
#file:[SOURCE_FILE]

Translate:
- Class methods → target equivalent
- Error handling → target idioms
- Async patterns → target async model
- Language-specific features → target equivalents

Preserve all edge cases and validations.
```

### Migrate API Layer (Agent mode)

```
Migrate API endpoints from [SOURCE_FRAMEWORK] to [TARGET_FRAMEWORK]:
#file:[SOURCE_ROUTES]

Maintain:
- Same HTTP methods and paths
- Request/response formats
- Error codes and messages
- Authentication/authorization

Use [TARGET_FRAMEWORK] routing and middleware patterns.
```

### Domain-Guided Migration (Agent mode)

```
Migrate to [TARGET] following target domain standards:
Source: #file:[SOURCE_FILE]
Target standards: #file:.github/instructions/[TARGET_DOMAIN].instructions.md

Ensure migrated code matches target domain patterns.
```

### Generate Equivalence Tests (Agent mode)

```
Generate tests to verify migrated [MODULE] is functionally equivalent:

Test:
- All input/output combinations
- Edge cases
- Error conditions
- Integration points

Compare behavior with source: #file:[SOURCE]
Use [TARGET_TEST_FRAMEWORK].
```

### Performance Comparison (Ask mode - Claude)

```
Compare performance characteristics:
- Source: [SOURCE_LANGUAGE/FRAMEWORK]
- Target: [TARGET_LANGUAGE/FRAMEWORK]

For [SPECIFIC OPERATIONS]:
- Expected performance differences?
- Optimization opportunities in target?
- Benchmarking approach?
```

### Optimize Migrated Code (Agent mode)

```
Optimize this migrated code for [TARGET]:
#file:[MIGRATED_FILE]

Leverage target-specific features:
- [e.g., "TypeScript generics"]
- [e.g., "Node.js streams"]
- [e.g., "React hooks"]

Maintain functional equivalence while improving quality.
```

### Migration Specialist (Agent mode)

```
You are a senior developer specializing in code migrations. Your role is to migrate code between languages/frameworks while preserving functionality.

## Migration Process:
1. Understand Source: Read the file(s) to understand purpose, dependencies, and business logic
2. Check Standards: Reference instruction files for target stack patterns
3. Translate Code: Convert to target language using idiomatic patterns
4. Preserve Behavior: Ensure all edge cases and error handling are maintained
5. Document Decisions: Add comments explaining non-obvious translations

## Translation Priorities:

### Functionality (Critical)
- All business logic preserved exactly
- Edge cases and error handling maintained
- Input/output behavior identical
- Integration points working

### Idioms (High Priority)
- Use target language best practices
- Leverage target framework patterns
- Apply appropriate design patterns
- Use target ecosystem libraries

### Quality (Medium Priority)
- Add type annotations where supported
- Include meaningful comments
- Follow naming conventions
- Maintain testability

## Output Format:
For each migration:
- Source: path/to/source.py
- Target: path/to/target.ts
- Complexity: Low|Medium|High
- Notes: Translation decisions or caveats
- [Generated target code]

Migrate: #file:[SOURCE_FILE]
Target: [TARGET_LANGUAGE/FRAMEWORK]
```

### Quick Migrate (Agent mode)

```
Perform rapid file-by-file migration with minimal analysis.

## Process:
1. Read source file
2. Translate to target language using idiomatic patterns
3. Flag anything requiring manual review

## Output Indicators:
✅ Migrated: Clean translation, ready to use
⚠️ Needs Review: Translated but verify behavior
❌ Manual Required: Cannot auto-translate, needs human input

## For each file:
- Status indicator
- Translated code
- Dependencies needed
- Manual steps (if any)

Source: #file:[SOURCE_FILE]
Target Language: [TARGET]
Target Framework: [FRAMEWORK]
```

### Model Migrator (Agent mode)

```
You specialize in data model and ORM migrations.

## Supported Translations:
- SQLAlchemy → Prisma/TypeORM/Sequelize
- ActiveRecord → TypeORM/Prisma
- Django ORM → Prisma/TypeORM
- Entity Framework → Prisma/TypeORM

## Migration Process:
1. Parse source model definitions
2. Map data types to target equivalents
3. Translate relationships (FK, M2M, O2O)
4. Convert validations and constraints
5. Generate migration files if needed

## Output:
1. Target schema/model definitions
2. TypeScript/target language interfaces
3. Migration file (if applicable)
4. Type mapping notes

Migrate models from: #file:[SOURCE_MODELS]
Target ORM: [TARGET_ORM]
```

### API Migrator (Agent mode)

```
You specialize in API route and handler migrations.

## Supported Translations:
- Flask → Express/Fastify/Hono
- Django → Express/NestJS
- Rails → Express/NestJS
- FastAPI → Express/NestJS

## Migration Process:
1. Map route definitions
2. Translate request/response handling
3. Convert middleware patterns
4. Preserve authentication/authorization
5. Maintain error response formats

## Requirements:
- Same HTTP methods and paths
- Same request/response JSON schemas
- Same error codes and messages
- Same auth patterns

Migrate API from: #file:[SOURCE_ROUTES]
Target Framework: [TARGET_FRAMEWORK]
```

### Test Migrator (Agent mode)

```
You specialize in test suite migrations.

## Supported Translations:
- pytest → Jest/Vitest/Mocha
- RSpec → Jest/Mocha
- unittest → Jest
- JUnit → Jest/Vitest

## Migration Process:
1. Map test structure (describe/it/test)
2. Translate assertions
3. Convert fixtures and setup/teardown
4. Migrate mocks and stubs
5. Preserve test descriptions

## Output:
1. Migrated test files
2. Required test dependencies
3. Configuration files (jest.config.js, etc.)
4. Notes on tests requiring manual adjustment

Migrate tests from: #file:[SOURCE_TESTS]
Target Framework: [TARGET_TEST_FRAMEWORK]
```

---

## Track 5: MCP Integration Prompts

### Explore MCP Servers (Ask mode - Claude)

```
Browse the GitHub MCP Registry. Suggest 3 MCP servers most useful for our project:
#file:PROJECT_BLUEPRINT.md

Consider:
- Development tools we use
- Databases/APIs we integrate
- Workflows we could automate
```

### Generate ER Diagram with PostgreSQL MCP (Agent mode)

```
Use #query tool to get PostgreSQL database schema description.
Then generate Entity Relationship diagram using Mermaid syntax.
Create or update file: ER.md
```

### Database Documentation with MCP (Agent mode)

```
Query PostgreSQL database to:
1. List all tables with descriptions
2. Document columns (name, type, constraints)
3. Document relationships (foreign keys, indexes)
4. Identify missing indexes on foreign keys
5. Suggest performance improvements

Generate: DATABASE_DOCS.md
```

### MCP-Powered Code Review (Agent mode)

```
Review [FILE/MODULE] using available MCP tools:

If database code:
- Use #query to check schema compatibility
- Verify queries match actual schema

If API code:
- Use Postman MCP to test endpoints

If frontend:
- Use Playwright MCP for UI testing

Document findings with evidence from MCP tools.
```

### Browser Testing Prompt with Playwright MCP (Agent mode)

```
Use Playwright MCP tools to test [FEATURE]:

1. Navigate to [URL]
2. Test user workflow: [DESCRIBE STEPS]
3. Capture screenshots of each step
4. Verify expected behavior
5. Document any issues found

Provide test report with screenshots.
```

### Create Database Query Workflow (Agent mode)

```
Create a prompt file that uses PostgreSQL MCP #query tool to:
[DESCRIBE WORKFLOW - e.g., "analyze query performance", "find unused tables"]

Include:
- What to query
- How to analyze results
- What to output

Save as: .github/prompts/[WORKFLOW_NAME].prompt.md
```

---

## Track 6: CLI and APM Prompts

### Create Code Review Package (Terminal)

Use in IDE terminal (Ctrl+I) or Copilot CLI:

```
Create an APM package for code review workflows including:
- Security review checklist
- Performance review checklist
- Review prompt files
- Documentation on usage

Initialize package structure and create files.
```

### Package Domain Standards (Terminal)

```
Package my domain instructions and workflows for team distribution:

Copy from:
- .github/instructions/
- .github/prompts/
- .github/agents/

Create APM package structure with:
- apm.yml manifest
- Proper dependencies
- Documentation

Make it installable by team.
```

### Generate Git Workflow (Terminal)

```
Create a bash script that:
1. Creates feature branch from main
2. Sets up commit message template
3. Runs pre-commit checks
4. Pushes branch and creates draft PR

Make it reusable for [PROJECT_TYPE] projects.
```

### Create GitHub Actions Workflow (Terminal)

```
Generate GitHub Actions workflow that:
- Runs on pull requests
- Executes tests
- Runs linting
- Checks code coverage
- Posts results as PR comment

For [TECH_STACK] project.
```

### APM Package with MCP Integration (Terminal)

```
Create APM package that includes:
- MCP server configurations
- Prompt files using MCP tools
- Documentation on setup

For [DATABASE/API/TOOL] integration.
Package as reusable module.
```

---

## Tips for Using These Templates

### Context Is Key

Always provide relevant context with `#file:` references:
```
Review this code following our standards:
#file:src/api/users.ts
#file:.github/instructions/backend.instructions.md
```

### Choose the Right Mode

- **Ask mode (Claude Sonnet 4/4.5):** Planning, analysis, architecture, complex reasoning
- **Agent mode:** Code generation, file modifications, refactoring

### Iterate and Refine

If the output isn't what you need:
1. Provide more specific requirements
2. Add more context files
3. Show examples of what you want
4. Break complex tasks into smaller prompts

### Save Common Prompts

Create a personal collection of prompts you use frequently. Consider organizing them in:
- A notes file
- A project wiki
- A shared team document

### Combine Templates

Mix and match sections from different templates for custom workflows:
```
[From Track 2: Code Review]
Review this code for security and performance.

[From Track 3: Refactoring]
Then refactor identified issues.

[From Track 1: Domain Context]
Follow domain standards:
#file:.github/instructions/backend.instructions.md
```

---

## Learn More

- [Track 1: Agent-Driven Development](TRACK1_AGENT_DRIVEN_DEVELOPMENT.md)
- [Track 2: Code Review](TRACK2_CODE_REVIEW.md)
- [Track 3: Refactoring](TRACK3_REFACTORING.md)
- [Track 4: Migration](TRACK4_MIGRATION.md)
- [Track 5: MCP Integration](TRACK5_MCP_INTEGRATION.md)
- [Track 6: CLI and APM](TRACK6_CLI_AND_APM.md)

---

[🏠 Home](README.md)
