# Track 2: AI-Assisted Code Review

Learn to perform comprehensive code reviews using AI, from security audits to architecture analysis.

---

## Cross-Track Optional Enhancements

💡 **Enhanced with Track 1:** Use domain specialists for context-aware reviews  
🔗 **Leverage Track 5:** Use MCP tools for database/API analysis during reviews

---

## Prerequisites

**Required:**
- IDE with GitHub Copilot and Copilot Chat extensions
- Existing codebase to review

---

## Workshop Flow

| Step | Section | Description |
|------|---------|-------------|
| 🚀 | [Quick Start](#-quick-start-built-in-copilot-code-review-features) | Built-in Copilot review features |
| 📋 | [Core Exercise](#-core-exercise-ai-assisted-code-review-workflow) |  |
| | → [Part A: Identify Code](#part-a-identify-code-to-review-with-ai) | Determine what needs review |
| | → [Part B: Review Checklists](#part-b-create-review-checklists) | Create consistent review criteria |
| | → [Part C: Execute Reviews](#part-c-execute-reviews-with-ai) | Perform systematic reviews |
| | → [Part D: Validate Findings](#part-d-validate-findings) | Verify and prioritize actions |
| 🤖 | [Automating Reviews](#-automating-reviews-with-custom-agents--prompt-files) | **Advanced: Automation** |
| | → [Part A: Custom Agent](#part-a-create-a-code-review-custom-agent) | Create code review agent |
| | → [Part B: Prompt Files](#part-b-create-reusable-prompt-files) | Reusable review workflows |
| | → [Part C: Integrate](#part-c-integrate-prompts-into-your-workflow) | Use prompts in workflow |
| | → [Part D: Quick Review](#part-d-quick-review-agent-for-changed-files) | Fast review for changes |
| 💡 | [Pro Tips](#-pro-tips-optimizing-reviews-with-copilot) | GitHub best practices |

---

## 🚀 Quick Start: Built-in Copilot Code Review Features

Before diving into custom workflows, explore the code review features that come **out of the box** with GitHub Copilot.

### In VS Code: Review Selection or File

**Option 1: Context Menu**
1. Select code in the editor (or select nothing to review the entire file)
2. Right-click → **Copilot** → **Review and Comment**
3. Copilot adds inline comments with suggestions

**Option 2: In the source control**
1. Open the Git Source Control panel
2. Click on the the Code Review icon next to the Changes list
3. This will trigger a review of the changed files

### In JetBrains IDEs: Review Selection or File
1. Select code in the editor (or select nothing to review the entire file)
2. Right-click → **GitHub Copilot** → **Review and Comment**
3. Copilot adds inline comments with suggestions

### Quick Review Commands in Chat

| Command | What It Does |
|---------|--------------|
| `/explain` | Understand what selected code does |
| `/fix` | Get suggestions to fix issues in selection |
| `/tests` | Generate tests for the selected code |

> 💡 **When to use built-in vs. custom reviews:**
> - **Built-in:** Quick checks, individual files, PR reviews
> - **Custom (this track):** Team standards, consistent checklists, automated workflows

---

## 📋 Core Exercise: AI-Assisted Code Review Workflow

Complete Parts A through D to learn the fundamentals of AI-powered code reviews.

---

## Part A: Identify Code to Review with AI

**Purpose:** Collaborate with AI to determine what needs review and why.

### Steps

1. **Analyze your codebase (Ask mode):**
   - Use **Ask mode** with **Claude Sonnet 4/4.5**
   - Prompt: *"Analyze my project structure. What areas would benefit most from code review? Consider: critical paths, security-sensitive code, complex logic, frequently changed files."*

2. **Prioritize review targets:**
   - Ask: *"For [FEATURE/MODULE], what specific aspects should I focus on during code review? Security? Performance? Maintainability?"*
   - Create a prioritized list

3. **Define review scope:**
   - Recent commits: *"Review the changes in the last commit for potential issues"*
   - Specific files: *"Review [file.ts] for code quality and best practices"*
   - Feature branches: *"Compare feature branch with main and highlight concerns"*

---

## Part B: Create Review Checklists

**Purpose:** Establish consistent review criteria using AI.

### Security Review Checklist

Use AI to create a security checklist:

**Prompt (Ask mode):**
```
Create a security review checklist for [YOUR TECH STACK] applications. Include:
- Input validation and sanitization
- Authentication and authorization checks
- Data exposure risks
- Injection vulnerabilities
- Secure data handling
```

**Example Checklist:**
- [ ] All user inputs validated and sanitized
- [ ] SQL/NoSQL injection prevention (parameterized queries)
- [ ] XSS prevention (output encoding)
- [ ] CSRF protection on state-changing operations
- [ ] Authentication on protected endpoints
- [ ] Proper authorization checks (not just authentication)
- [ ] Sensitive data not logged or exposed in errors
- [ ] Secrets not hardcoded
- [ ] Secure dependencies (no known vulnerabilities)

### Performance Review Checklist

**Prompt (Ask mode):**
```
Create a performance review checklist for [YOUR TECH STACK]. Include:
- Database query optimization
- Caching strategies
- Memory leaks
- Algorithmic complexity
- Resource management
```

### Architecture Review Checklist

**Prompt (Ask mode):**
```
Create an architecture review checklist focusing on:
- Separation of concerns
- Code organization
- Design patterns
- Dependency management
- Testability
```

### Save Your Checklists for Reuse

Create a reusable prompt file with the checklist to maintain consistency across reviews:

**Create `.github/prompts/review-checklists.prompt.md`:**

**Example Prompt file:**

```markdown
---
mode: ask
description: Reusable code review checklists
---

# Code Review Checklists

## Security Checklist
- [ ] All user inputs validated and sanitized
- [ ] SQL/NoSQL injection prevention (parameterized queries)
- [ ] XSS prevention (output encoding)
- [ ] CSRF protection on state-changing operations
- [ ] Authentication on protected endpoints
- [ ] Proper authorization checks
- [ ] Sensitive data not logged or exposed
- [ ] No hardcoded secrets
- [ ] Secure dependencies

## Performance Checklist
- [ ] No N+1 query patterns
- [ ] Appropriate caching in place
- [ ] No memory leaks
- [ ] Efficient algorithms (avoid O(n²) in hot paths)
- [ ] Resources properly closed/disposed

## Architecture Checklist
- [ ] Single Responsibility Principle followed
- [ ] Clear separation of concerns
- [ ] No circular dependencies
- [ ] Dependencies are injectable
- [ ] Consistent design patterns
```

**Usage:** Reference this file in reviews with `#file:.github/prompts/review-checklists.prompt.md` or run it directly from the Command Palette as  `/review-checklists`.

---

## Part C: Execute Reviews with AI

**Purpose:** Perform systematic code reviews using different AI approaches.

### Method 1: General Code Review (No Track 1)

**Use Agent mode for comprehensive analysis:**

```
Review the code in [file/folder] for:
1. Security vulnerabilities
2. Performance issues
3. Code quality and maintainability
4. Potential bugs
5. Best practice violations

Provide specific line numbers and actionable recommendations.
```

### Method 2: Domain-Aware Review (With Track 1)

**If you completed Track 1, use domain specialists:**

#### VS Code with Custom Agents

1. **Switch to domain specialist** (e.g., backend-specialist)
2. **Prompt:** *"Review this file against our domain standards. Check for violations and suggest improvements."*
3. The specialist will reference your domain instructions automatically

#### JetBrains or Without Custom Agents

1. **Use Ask/Agent mode** with manual context
2. **Prompt:** *"Review this file following the standards in #file:.github/instructions/backend.instructions.md. Identify violations and suggest fixes."*

### Review Types

> 💡 **Tip:** Reference your checklists from Part B using `#file:.github/prompts/review-checklists.prompt.md` or run `/review-checklists` to load them into context.

#### 1. Security Review

**Prompt (Agent mode):**
```
Perform a security audit of [file/module].

Use the security checklist from #file:.github/prompts/review-checklists.prompt.md

For each checklist item, report: pass/fail with file location and fix if needed.
```

#### 2. Performance Review

**Prompt (Agent mode):**
```
Analyze [file/module] for performance issues.

Use the performance checklist from #file:.github/prompts/review-checklists.prompt.md

Provide specific optimizations with code examples for each issue found.
```

#### 3. Accessibility Review (Frontend)

**Prompt (Agent mode):**
```
Review [component] for accessibility against WCAG 2.1 Level AA standards.

Check for:
- Semantic HTML and ARIA usage
- Keyboard navigation support
- Color contrast compliance
- Screen reader compatibility

Flag violations with severity and remediation steps.
```

#### 4. Architecture Review

**Prompt (Agent mode - use Claude for complex analysis):**
```
Review the architecture of [module/feature].

Use the architecture checklist from #file:.github/prompts/review-checklists.prompt.md

Consider: maintainability, scalability, and team collaboration.
Suggest refactoring opportunities with priority ranking.
```

---

## Part D: Validate Findings

**Purpose:** Verify AI's review findings and prioritize actions.

### Steps

1. **Cross-check critical findings:**
   - For security issues: *"Explain why [FINDING] is a security risk. Show me an attack scenario."*
   - For performance: *"Quantify the performance impact of [ISSUE]. Would this affect users?"*

2. **Prioritize findings:**
   - Prompt: *"Here are the review findings: [LIST]. Prioritize them by: 1) severity/impact, 2) effort to fix. Create action items."*

3. **Generate fix plan:**
   - For each high-priority item: *"How should I fix [ISSUE]? Provide step-by-step approach and code example."*
   - Summarize into a fix plan to a file PLAN.md

---

#### Step 4: Generate Fixes (Agent mode)

**Prompt:**
```
Using the fix plan in #file:PLAN.md, implement the fixes for the identified issues.

Start with Critical and High priority items first.
Maintain existing functionality while applying each fix.
```

Handle one issue at a time, committing changes after each fix.

#### Step 5: Verify Fixes (Agent mode)

**Prompt:**
```
Review the updated login endpoint. Confirm all security issues are resolved.
Check if any new issues were introduced.
```

---


## 🤖 Automating Reviews with Custom Agents & Prompt Files

**Purpose:** Create reusable, automated review workflows that enforce your team's standards consistently.

The checklists and review techniques you created earlier in this track can be leveraged for automated workflows:

| From Earlier in Track 2 | Use in Automation |
|-------------------------|-------------------|
| Security/Performance/Architecture checklists (Part B) | Embed in prompt files for consistent reviews |
| Review execution patterns (Part C) | Codify into reusable agents |
| Validation techniques (Part D) | Add verification steps to automated workflows |

---

If you completed **Track 1: Agent-Driven Development**, you already have custom agents and domain instructions that enhance your review capabilities:

| From Track 1 | Use in Code Reviews |
|--------------|---------------------|
| Domain instruction files | Reference in review prompts for context-aware feedback |
| Custom specialist agents | Invoke for domain-specific code reviews |
| Coding standards | Validate code against established patterns |

**Quick Start:** If you created a `backend-specialist` agent in Track 1, try: Choose the backend-specialist agent and *"Review this service file for violations of our backend standards."*

---

For JetBrains or Without Custom Agents

Use **prompt templates** from [JETBRAINS_PROMPTS.md - Code Review Section](JETBRAINS_PROMPTS.md#track-2-code-review-prompts):
- Copy review prompts for your domains
- Manually add context: `#file:.github/instructions/[domain].instructions.md`
- Use Ask/Agent modes as shown in examples

---

### Part A: Create a Code Review Custom Agent

Custom agents allow you to define specialized reviewers that automatically apply your standards.

#### Step 1: Create the Agent File

Create `.github/agents/code-reviewer.md`:

```markdown
---
name: code-reviewer
description: Performs comprehensive code reviews following team standards
tools:
  - semantic_search
  - read_file
  - grep_search
---

# Code Review Specialist

You are a senior code reviewer. Your role is to perform thorough, actionable code reviews.

## Review Process

1. **Understand Context:** Read the file(s) to understand purpose and dependencies
2. **Check Against Standards:** Reference instruction files for domain-specific rules
3. **Identify Issues:** Find security, performance, and quality problems
4. **Prioritize Findings:** Rate by severity (Critical/High/Medium/Low)
5. **Suggest Fixes:** Provide specific, actionable code improvements

## Review Categories

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

## Output Format

For each finding:
\`\`\`
### [SEVERITY] Issue Title
**File:** path/to/file.ts#L10-L20
**Category:** Security|Performance|Quality|Best Practices
**Issue:** Clear description of the problem
**Impact:** Why this matters
**Fix:** Specific code or approach to resolve
\`\`\`

## Domain Instructions

Always check and follow these instruction files when available:
- `.github/instructions/backend.instructions.md`
- `.github/instructions/frontend.instructions.md`
- `.github/instructions/security.instructions.md`
```

#### Step 2: Use the Agent

In VS Code Copilot Chat:
1. Choose `code-reviewer` from the Agent list
2. Prompt: *"Review the authentication module for security issues"*
3. The agent follows its defined process automatically

#### Step 3: Create Additional Agents Using Agent Mode

Once you have your first agent, use **Agent mode** to generate additional specialized agents:

**Prompt (Agent mode):**
```
Using #file:.github/agents/code-reviewer.md as a template, create a new agent file called "quick-review.md" in the .github/agents folder.

This agent should:
- Focus only on critical security and performance red flags
- Be optimized for fast reviews of recently changed files
- Use emoji indicators: 🔴 Critical, 🟡 Warning, 💡 Suggestion
- Check for: eval(), hardcoded secrets, SQL concatenation, DB calls in loops, console.log in production
```

**More agents to create with Agent mode:**

| Agent Name | Prompt to Create It |
|------------|---------------------|
| `security-auditor` | *"Create a security-focused agent based on #file:.github/agents/code-reviewer.md that only checks for OWASP Top 10 vulnerabilities"* |
| `performance-analyzer` | *"Create a performance-focused agent that checks for N+1 queries, missing caching, memory leaks, and algorithmic complexity"* |
| `accessibility-reviewer` | *"Create an accessibility review agent that checks against WCAG 2.1 Level AA standards for frontend components"* |

> 💡 **Tip:** Let AI do the heavy lifting! Once you have one well-crafted agent, use it as a template to generate others. This ensures consistency across your agent library.

### Part B: Create Reusable Prompt Files

Prompt files (`.prompt.md`) create reusable, shareable review workflows.

#### Security Review Prompt

Create `.github/prompts/security-review.prompt.md`:

```markdown
---
mode: agent
description: Perform a comprehensive security review
tools:
  - read_file
  - grep_search
  - semantic_search
---

# Security Review

Perform a security audit of the specified code.

## Checklist

- [ ] Input validation on all user inputs
- [ ] Parameterized queries (no SQL injection)
- [ ] Output encoding (no XSS)
- [ ] CSRF protection on state-changing operations
- [ ] Authentication on protected endpoints
- [ ] Authorization checks (role-based access)
- [ ] No sensitive data in logs or errors
- [ ] No hardcoded secrets or credentials
- [ ] Secure dependencies (no CVEs)
- [ ] Proper error handling (no stack traces exposed)

## Instructions

1. Scan the target files for each checklist item
2. For each violation found, provide:
   - Exact file and line number
   - Vulnerability type and severity
   - Attack scenario (how it could be exploited)
   - Recommended fix with code example
3. Summarize findings by severity

## Target

Review: ${input:files:Which files or folders to review?}
```

#### Step 2: Generate Additional Prompt Files with Agent Mode

Use **Agent mode** to create more prompt files based on your template:

**Prompt (Agent mode):**
```
Using #file:.github/prompts/security-review.prompt.md as a template, create a new prompt file called "performance-review.prompt.md" in the .github/prompts folder.

This prompt should:
- Focus on performance bottlenecks
- Check for: N+1 queries, missing indexes, unbounded queries, memory leaks, O(n²) algorithms, missing timeouts
- Include estimated performance impact for each issue
- Suggest optimized code alternatives
```

**More prompt files to generate:**

| Prompt File | Command to Create |
|-------------|-------------------|
| `architecture-review.prompt.md` | *"Create an architecture review prompt that evaluates separation of concerns, dependency management, design patterns, and testability. Output a mermaid diagram of the current structure."* |
| `accessibility-review.prompt.md` | *"Create an accessibility review prompt for WCAG 2.1 Level AA compliance. Check semantic HTML, ARIA, keyboard nav, and color contrast."* |
| `full-review.prompt.md` | *"Create a comprehensive review prompt that runs security, performance, and architecture checks in sequence, then outputs a summary table with issue counts by severity."* |

> 💡 **Tip:** Start with one well-crafted prompt file, then let Agent mode generate variations. This ensures your prompts follow a consistent structure.

### Part C: Integrate Prompts into Your Workflow

#### Using Prompt Files

1. **From Command Palette:** `Ctrl+Shift+P` → "Chat: Run Prompt File"
2. **From Chat:** Type `/` and select your prompt
3. **With variables:** Prompts with `${input:...}` will ask for values

#### Combining Agents with Prompts

Create a master review prompt that uses your agent:

`.github/prompts/full-review.prompt.md`:

```markdown
---
mode: agent
description: Complete code review workflow
---

# Complete Code Review

Perform a full code review using all review types.

## Workflow

1. **Security Review** - Check for vulnerabilities
2. **Performance Review** - Identify bottlenecks
3. **Architecture Review** - Evaluate design
4. **Code Quality Review** - Check maintainability

## Process

For ${input:target:Enter files or folder to review}:

### Step 1: Security Scan
Run security checklist. Flag any Critical or High issues.

### Step 2: Performance Analysis
Check for database, memory, and algorithmic issues.

### Step 3: Architecture Evaluation
Assess design patterns and code organization.

### Step 4: Summary Report

Generate a review report:

| Category | Critical | High | Medium | Low |
|----------|----------|------|--------|-----|
| Security |          |      |        |     |
| Performance |       |      |        |     |
| Architecture |      |      |        |     |
| Quality |           |      |        |     |

### Step 5: Action Items

Create prioritized fix list with effort estimates.
```

### Part D: Quick Review Agent for Changed Files

In Step 3 of Part A, you created a `quick-review` agent using Agent mode. Use it for rapid reviews:

**Usage:**
```
Choose the quick-review agent and run "Check the files I changed in my last commit"
```

**Expected output:**
```
🔴 Critical: Hardcoded API key in config.ts#L45
🟡 Warning: console.log statement in userService.ts#L23
💡 Suggestion: Consider extracting repeated logic in auth.ts#L30-45
```

> 💡 **Tip:** Choose the quick-review agent and run "Check the files I changed in my last commit" before committing to catch obvious issues early.

### Folder Structure Summary

```
.github/
├── agents/
│   ├── code-reviewer.md      # Full review specialist
│   └── quick-review.md       # Fast review agent
├── prompts/
│   ├── security-review.prompt.md
│   ├── performance-review.prompt.md
│   ├── architecture-review.prompt.md
│   └── full-review.prompt.md
└── instructions/
    ├── backend.instructions.md
    ├── frontend.instructions.md
    └── security.instructions.md
```

### Benefits of Automation

| Benefit | Description |
|---------|-------------|
| **Consistency** | Every review follows the same standards |
| **Speed** | Prompt files eliminate repetitive typing |
| **Team Alignment** | Shared prompts ensure consistent feedback |
| **Onboarding** | New reviewers use established patterns |
| **Audit Trail** | Prompt files are version-controlled |

---

## Key Takeaways

✅ **Systematic Reviews:** Use checklists for consistent, comprehensive reviews  
✅ **Multiple Perspectives:** Security, performance, architecture, accessibility  
✅ **AI as Reviewer:** Claude Sonnet 4.5 for complex analysis, GPT-4 for quick checks  
✅ **Validate Findings:** Always verify AI's critical findings  
✅ **Domain Context:** Track 1 domain specialists make reviews more accurate  
✅ **Automate with Agents:** Custom agents enforce standards automatically  
✅ **Reusable Prompts:** Prompt files create shareable, version-controlled workflows

---

## 💡 Pro Tips: Optimizing Reviews with Copilot

> **Source:** [GitHub Docs - Optimize Code Reviews](https://docs.github.com/en/copilot/tutorials/optimize-code-reviews)

### The Review Optimization Philosophy

Code reviews are more efficient when you spend less time on minor implementation details (naming, style conventions) and focus your effort on:
- **Higher-level design decisions**
- **Problem-solving approaches**
- **Functionality that meets user needs**

### Custom Instructions for Better Reviews

Create custom review instructions to tailor Copilot's responses to your team's standards. Best practices:

| Practice | Description |
|----------|-------------|
| **Distinct headings** | Organize by category (style, security, error handling) |
| **Bullet points** | Use concise, scannable format |
| **Short, direct instructions** | Be specific about what you want checked |

**Example Custom Instructions Structure:**

```markdown
## Repository context
- Brief description of what this codebase does
- Critical concerns (security, correctness, auditability)

## Style and conventions
- Language-specific style guides (PEP 8, ESLint rules, etc.)
- Domain-relevant naming conventions
- Function/method size preferences

## Secure coding
- Input validation requirements
- Authentication/authorization review points

## Error handling guidelines
- How to handle network/timeout errors
- Logging detail requirements

## Review style
- Be concise, specific, and actionable
- Explain the "why" behind recommendations
```

**Common Security Catches:**
- Insecure password hashing (SHA-256 → recommends bcrypt/argon2)
- Missing input sanitization
- Hardcoded secrets
- Improper authorization checks

### ⚠️ Always Remember

> **Always carefully review Copilot's suggestions before accepting and committing.**

AI suggestions are non-deterministic—verify critical security and performance recommendations manually.

---

## Navigation

[← Previous: Agent-Driven Dev](TRACK1_AGENT_DRIVEN_DEVELOPMENT.md) (Optional) | [🏠 Home](README.md) | [Next: Refactoring →](TRACK3_REFACTORING.md) (Optional)
