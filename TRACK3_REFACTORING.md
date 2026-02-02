# Track 3: AI-Assisted Refactoring, Performance & Debugging

Transform legacy or complex code into maintainable, well-structured code using AI. Master performance profiling, memory optimization, and advanced debugging techniques.

---

## Cross-Track Optional Enhancements

💡 **Enhanced with Track 1:** Use domain specialists to ensure refactoring follows domain standards  
🔗 **Follows Track 2:** Code review findings often identify refactoring candidates

---

## Prerequisites

**Required:**
- IDE with GitHub Copilot and Copilot Chat extensions
- Existing codebase to refactor

---

## Workshop Flow

| Step | Section | Description |
|------|---------|-------------|
| 🚀 | [Quick Start](#-quick-start-built-in-refactoring-features) | Built-in Copilot refactoring features |
| 📋 | [Core Exercise](#-core-exercise-ai-assisted-refactoring-workflow) |  |
| | → [Part A: Identify Targets](#part-a-identify-refactoring-targets-with-ai) | Find code needing refactoring |
| | → [Part B: Plan Strategy](#part-b-plan-refactoring-strategy) | Create safe refactoring plans |
| | → [Part C: Execute Changes](#part-c-execute-refactoring-with-ai) | Apply refactoring patterns |
| | → [Part D: Validate Results](#part-d-validate-refactoring-results) | Verify behavior preservation |
| ⚡ | [Performance & Debugging](#-performance-profiling--debugging) | **Advanced: Optimization** |
| | → [Part E: Performance](#part-e-performance-profiling--optimization-with-ai) | Profile and optimize code |
| | → [Part F: Debugging](#part-f-ai-assisted-debugging) | Advanced debugging techniques |
| 🤖 | [Automating Refactoring](#-automating-refactoring-with-custom-agents--prompt-files) | **Advanced: Automation** |
| 💡 | [Pro Tips](#-pro-tips-effective-refactoring-patterns) | Common refactoring workflows |

---

## 🚀 Quick Start: Built-in Refactoring Features

Before diving into custom workflows, explore the refactoring features built into your IDE with Copilot.

### Quick Refactoring Commands in Chat

| Command | What It Does |
|---------|--------------|
| `/fix` | Fix issues in selected code |
| `/explain` | Understand complex code before refactoring |
| `/tests` | Generate tests before refactoring |

### Context Menu Refactoring

**In VS Code:**
1. Select code in the editor
2. Right-click → **Copilot** → **Review and Comment**
3. Use suggestions to identify refactoring opportunities

**In JetBrains:**
1. Select code in the editor
2. Right-click → **GitHub Copilot** → **Explain This** or **Fix This**
3. Apply suggested improvements

> 💡 **When to use built-in vs. custom refactoring:**
> - **Built-in:** Quick fixes, single method improvements
> - **Custom (this track):** Systematic refactoring, performance optimization, complex debugging

---

## 📋 Core Exercise: AI-Assisted Refactoring Workflow

Complete Parts A through D to learn the fundamentals of AI-powered refactoring.

---

## Part A: Identify Refactoring Targets with AI

**Purpose:** Find code that needs refactoring using AI analysis.

### Steps

1. **Analyze your codebase (Ask mode):**
   - Use **Ask mode** with **Claude Sonnet 4/4.5**
   - Prompt: *"Analyze my project structure. Identify refactoring candidates: functions with high complexity, large classes, duplicated code patterns, deep nesting, long parameter lists, unclear naming. Prioritize by impact on maintainability."*

2. **Analyze specific files:**
   - Prompt (Agent mode): *"Review #file:[path] for code smells: long methods (>50 lines), nested conditionals (>3 levels), magic numbers/strings, poor naming, tight coupling. For each issue, explain the impact and suggest refactoring approach."*

3. **Use Code Review findings (If Track 2 completed):**
   - Prompt: *"Based on code review findings in [file/module], identify which issues require refactoring. Group related code smells and suggest refactoring patterns."*

---

## Part B: Plan Refactoring Strategy

**Purpose:** Create safe refactoring plans with AI.

### Steps

1. **Create refactoring plan (Ask mode - Claude Sonnet 4.5):**
   ```
   I need to refactor [MODULE/FEATURE]. Current issues:
   [LIST CODE SMELLS FROM PART A]

   Create a refactoring plan:
   1. Refactoring pattern to apply (Extract Method, Replace Conditional, etc.)
   2. Step-by-step approach
   3. Risk assessment
   4. Testing strategy
   5. Rollback plan

   Ensure behavior preservation.
   ```

2. **Apply common refactoring patterns:**

### Refactoring Patterns Reference

| Pattern | When to Use | Prompt |
|---------|-------------|--------|
| Extract Method | Long functions, duplicated code | *"Extract the following logic into a well-named function with descriptive parameters"* |
| Replace Conditional with Polymorphism | Complex type-based conditionals | *"Refactor using polymorphism: create interface, implement type-specific classes"* |
| Extract Class | Too many responsibilities | *"Identify cohesive groups and extract into separate classes following SRP"* |
| Simplify Conditionals | Deep nesting | *"Simplify using early returns, guard clauses, extracted boolean methods"* |

### Example: Extract Method Pattern

**Prompt (Agent mode):**
```
Extract the following logic into a well-named function:
[SELECT CODE]

Ensure:
- Descriptive function name
- Clear parameters
- Proper return type
- Add JSDoc/comments
```

> 💡 **Your Turn:** Use Agent mode to generate additional refactoring prompts for the other patterns in the table above, tailored to your tech stack.

---

## Part C: Execute Refactoring with AI

**Purpose:** Safely refactor code with AI assistance.

### Method 1: General Refactoring (No Track 1)

**Use Agent mode for code transformations:**

```
Refactor [file/function]:
1. [REFACTORING GOAL - e.g., "Extract duplicated validation logic"]
2. Preserve existing behavior exactly
3. Add tests to verify equivalence
4. Improve naming and documentation

Show before/after comparison.
```

### Method 2: Domain-Aware Refactoring (With Track 1)

**If you completed Track 1, use domain specialists:**

| IDE | How to Use |
|-----|------------|
| VS Code with Custom Agents | Switch to domain specialist (e.g., backend-specialist), then prompt: *"Refactor this code following our domain standards and patterns."* |
| JetBrains or Without Custom Agents | Use Agent mode with: *"Refactor this code following standards in #file:.github/instructions/backend.instructions.md"* |

### Step-by-Step Refactoring Process

#### Step 1: Write Tests First (If Missing)

**Prompt (Agent mode):**
```
Generate comprehensive tests for [function/class] before refactoring:
- Cover all code paths
- Test edge cases
- Verify current behavior

This ensures refactoring doesn't break functionality.
```

#### Step 2: Execute Refactoring

**Prompt (Agent mode):**
```
Refactor [code] following this plan:
[PASTE PLAN FROM PART B]

Make changes incrementally. After each change, ensure tests still pass.
```

#### Step 3: Review Refactored Code

**Prompt (Agent mode):**
```
Review the refactored code:
1. Is behavior preserved?
2. Is it more readable/maintainable?
3. Are there remaining code smells?

Suggest any final improvements.
```

---

## Part D: Validate Refactoring Results

**Purpose:** Verify refactoring improved code without breaking functionality.

### Validation Checklist

| Check | Prompt |
|-------|--------|
| Test Coverage | *"Verify test coverage for refactored [module]. Add missing tests. Run tests and confirm all pass."* |
| Behavior Equivalence | *"Compare behavior of original vs refactored code. Confirm they are functionally equivalent."* |
| Quality Metrics | *"Compare code quality metrics before/after: cyclomatic complexity, lines of code, nesting depth. Quantify improvement."* |
| Code Review | *"Perform a code review of the refactored code. Does it follow best practices? Are there new issues?"* |

---

## ⚡ Performance Profiling & Debugging

Complete Parts E and F to master performance optimization and advanced debugging techniques.

---

## Part E: Performance Profiling & Optimization with AI

**Purpose:** Use Copilot to identify performance bottlenecks, optimize code, and reduce memory allocations.

### Steps

1. **Identify performance bottlenecks (Ask mode - Claude Sonnet 4.5):**
   ```
   Analyze #file:[path] for performance issues:
   1. Identify hot paths and expensive operations
   2. Find O(n²) or worse algorithmic complexity
   3. Detect unnecessary object allocations
   4. Identify blocking I/O operations
   5. Find memory leaks or retention issues

   Prioritize by impact and suggest optimizations.
   ```

2. **Profile memory allocations (Agent mode):**
   - Prompt: *"Analyze memory allocation patterns in #file:[path]. Identify: unnecessary object creation in loops, string concatenation inefficiencies, collections that could be pre-sized, value types boxed unnecessarily. Suggest low-allocation alternatives."*

3. **Optimize hot paths (Agent mode):**
   - Prompt: *"This function is a performance hotpath. Optimize for: reduced allocations, cache computed values, avoid LINQ in hot paths. Show before/after with expected improvement."*

### Performance Optimization Patterns

| Issue | Optimization | Example Prompt |
|-------|--------------|----------------|
| Collection inefficiency | Pre-size, appropriate types | *"Optimize collection operations: pre-size, use HashSet for lookups"* |
| String allocations | StringBuilder, spans | *"Refactor string manipulation to reduce allocations using StringBuilder"* |
| N+1 queries | Eager loading, batching | *"Analyze database access patterns. Identify N+1 queries and suggest fixes"* |
| Sync-over-async | ValueTask, ConfigureAwait | *"Identify sync-over-async anti-patterns. Use ValueTask where beneficial"* |

### Example: Benchmark and Validate

**Prompt (Agent mode):**
```
Generate BenchmarkDotNet benchmarks to compare:
- Original implementation
- Optimized implementation

Include:
- Memory allocation tracking
- Multiple input sizes
- Statistical analysis

Show expected results format.
```

> 💡 **Your Turn:** Use Agent mode to create benchmark templates for your specific tech stack (pytest-benchmark for Python, JMH for Java, etc.).

---

## Part F: AI-Assisted Debugging

**Purpose:** Use Copilot to enhance debugging workflows, analyze application state, and troubleshoot complex issues.

### Debugging Scenarios

| Scenario | Prompt Template |
|----------|-----------------|
| Exception Analysis | *"Analyze this exception and stack trace. Determine: root cause, chain of events, data state that caused it, recommended fix with defensive coding."* |
| Threading Issues | *"I suspect a threading issue in #file:[path]. Analyze for: shared mutable state without locks, lock ordering that could cause deadlocks, race conditions."* |
| Database Debugging | *"Debug database connectivity issues. Analyze: connection pool exhaustion, transaction scope issues, query timeout handling."* |
| File Handling | *"Debug file handling issues. Check for: resource leaks, file locking conflicts, encoding issues, missing error handling."* |

### Example: Debug Workflow

**Scenario: Debug Intermittent Database Timeout**

**Step 1: Gather Context (Ask mode)**
```
I'm experiencing intermittent database timeouts.
Environment: [PROD/DEV]
Frequency: [HOW OFTEN]
Error: [PASTE TIMEOUT EXCEPTION]

What information should I gather to diagnose this?
```

**Step 2: Add Diagnostic Logging (Agent mode)**
```
Add comprehensive diagnostic logging to #file:[repository-file]:
- Connection acquisition time
- Query execution time
- Connection pool size
- Retry attempts

Use structured logging with correlation IDs.
```

**Step 3: Analyze and Fix (Agent mode)**
```
Based on diagnosis (e.g., connection pool exhaustion):
Implement: connection pool optimization, retry with exponential backoff, circuit breaker pattern.
```

> 💡 **Your Turn:** Create debugging prompts for common issues in your codebase (memory leaks, async deadlocks, startup performance).

---

## 🤖 Automating Refactoring with Custom Agents & Prompt Files

**Purpose:** Create reusable, automated refactoring workflows that enforce your team's standards consistently.

The techniques you learned earlier in this track can be automated for team-wide consistency:

| From Earlier in Track 3 | Use in Automation |
|-------------------------|-------------------|
| Refactoring patterns (Part B) | Embed in prompt files for consistent refactoring |
| Performance analysis (Part E) | Codify into performance specialist agent |
| Debugging workflows (Part F) | Create debug specialist agent |

---

### Part A: Create a Refactoring Specialist Agent

Custom agents allow you to define specialized refactoring assistants.

#### Step 1: Create the Agent File

Create `.github/agents/refactoring-specialist.md`:

```markdown
---
name: refactoring-specialist
description: Safely refactors code following best practices and domain standards
tools:
  - semantic_search
  - read_file
  - replace_string_in_file
  - run_in_terminal
  - list_code_usages
---

# Refactoring Specialist

You are a refactoring specialist. Your role is to:

1. **Identify**: Find code smells and refactoring opportunities
2. **Plan**: Create safe, incremental refactoring plans
3. **Execute**: Apply refactoring patterns correctly
4. **Validate**: Ensure behavior preservation with tests

## Refactoring Patterns
- Extract Method/Class for long code
- Replace Conditional with Polymorphism
- Introduce Parameter Object for long parameter lists
- Replace Magic Numbers with Named Constants
- Extract Interface for dependency inversion

## Process
1. Ensure tests exist before refactoring
2. Make small, incremental changes
3. Run tests after each change
4. Update documentation and comments

## Standards
- Follow instructions in .github/instructions/
- Preserve exact external behavior
- Improve readability and maintainability
- Reduce cyclomatic complexity
```

#### Step 2: Use the Agent

In VS Code Copilot Chat:
1. Choose `refactoring-specialist` from the Agent list
2. Prompt: *"Refactor this class to follow single responsibility principle"*
3. The agent follows its defined process automatically

#### Step 3: Create Additional Agents Using Agent Mode

**Prompt (Agent mode):**
```
Using #file:.github/agents/refactoring-specialist.md as a template, create a new agent file called "performance-specialist.md" in the .github/agents folder.

This agent should:
- Focus on identifying performance bottlenecks
- Apply zero-allocation patterns and caching strategies
- Generate and run benchmarks to validate improvements
- Use BenchmarkDotNet for .NET, pytest-benchmark for Python
```

> 💡 **Your Turn:** Use Agent mode to create these additional agents:
> - `debug-specialist.md` - for systematic debugging assistance
> - `quick-refactor.md` - for fast, focused refactoring of single functions

---

### Part B: Create Reusable Prompt Files

Prompt files (`.prompt.md`) create reusable, shareable refactoring workflows.

#### Example: Extract Method Prompt

Create `.github/prompts/extract-method.prompt.md`:

```markdown
---
mode: agent
description: Extract method refactoring with proper naming and documentation
---

# Extract Method Refactoring

Extract the selected code into a well-named function.

## Requirements
1. Analyze the selected code to understand its purpose
2. Choose a descriptive function name (verb + noun)
3. Identify required parameters
4. Determine return type
5. Extract and replace with function call
6. Add documentation (JSDoc, docstring, etc.)
7. Verify existing tests still pass

## Output Format
Show before/after code and explain the improvement in:
- Readability
- Testability
- Reusability

## Target
Code to extract: ${input:code:Select the code to extract}
```

#### Step 2: Generate Additional Prompt Files with Agent Mode

**Prompt (Agent mode):**
```
Using #file:.github/prompts/extract-method.prompt.md as a template, create a new prompt file called "profile-allocations.prompt.md" in the .github/prompts folder.

This prompt should:
- Analyze memory allocation patterns in code
- Check for object creation in loops, string concatenation, LINQ in hot paths
- Suggest Span<T>, ArrayPool, StringBuilder optimizations
- Provide before/after code with allocation comparison
```

> 💡 **Your Turn:** Generate these additional prompt files:
> - `simplify-conditionals.prompt.md` - early returns and guard clauses
> - `analyze-exception.prompt.md` - exception root cause analysis
> - `benchmark-comparison.prompt.md` - generate comparison benchmarks

---

### Part C: Integrate Prompts into Your Workflow

#### Using Prompt Files

| Method | How to Use |
|--------|------------|
| Command Palette | `Ctrl+Shift+P` → "Chat: Run Prompt File" |
| From Chat | Type `/` and select your prompt |
| With variables | Prompts with `${input:...}` will ask for values |

#### Combining Agents with Prompts

Create a master workflow prompt that orchestrates multiple tools:

`.github/prompts/full-refactor-workflow.prompt.md`:

```markdown
---
mode: agent
description: Complete refactoring workflow with validation
---

# Complete Refactoring Workflow

Perform a full refactoring cycle for ${input:target:Enter files or folder to refactor}:

## Step 1: Identify Issues
Analyze for code smells: long methods, deep nesting, duplication, poor naming.

## Step 2: Write/Verify Tests
Ensure tests exist. Generate missing tests for code to be refactored.

## Step 3: Apply Refactoring
Apply appropriate patterns incrementally. Run tests after each change.

## Step 4: Validate
- Confirm all tests pass
- Compare quality metrics before/after
- Document improvements

## Output
| Metric | Before | After |
|--------|--------|-------|
| Lines of Code | | |
| Cyclomatic Complexity | | |
| Nesting Depth | | |
```

---

### Folder Structure Summary

```
.github/
├── agents/
│   ├── refactoring-specialist.md    # Full refactoring specialist
│   ├── performance-specialist.md    # Performance optimization
│   └── debug-specialist.md          # Debugging assistance
├── prompts/
│   ├── extract-method.prompt.md
│   ├── simplify-conditionals.prompt.md
│   ├── profile-allocations.prompt.md
│   ├── benchmark-comparison.prompt.md
│   └── full-refactor-workflow.prompt.md
└── instructions/
    ├── performance.instructions.md
    └── debugging.instructions.md
```

---

## 💡 Pro Tips: Effective Refactoring Patterns

### Common Refactoring Workflows

| Workflow | When to Use | Prompt |
|----------|-------------|--------|
| Simplify Conditionals | Deep nesting, complex if/else | *"Simplify using early returns, guard clauses, extracted boolean functions"* |
| Remove Duplication | Same logic in multiple places | *"Extract common code into a shared utility. Update both files to use it."* |
| Improve Naming | Unclear function/variable names | *"Suggest better names for: getData(), process(), temp, flag"* |
| Break Up Classes | 500+ line classes | *"Identify cohesive groups and split into multiple classes following SRP"* |

### Performance Optimization Tips

| Tip | Description |
|-----|-------------|
| **Measure First** | Never optimize without profiling baseline |
| **Focus on Hot Paths** | Optimize frequently-run code, not everything |
| **Reduce Allocations** | Memory pressure affects overall performance |
| **Benchmark Changes** | Validate with repeatable benchmarks |

### Debugging Best Practices

| Practice | Why It Matters |
|----------|----------------|
| **Structured Approach** | Gather context → hypothesize → test → verify |
| **Add Diagnostics** | Logging and tracing are investments |
| **Understand State** | Use Copilot to analyze complex states |
| **Thread Safety** | Concurrency bugs need systematic analysis |

---

## Key Takeaways

✅ **Test First:** Always have tests before refactoring  
✅ **Small Steps:** Refactor incrementally, test after each change  
✅ **Preserve Behavior:** Refactoring changes structure, not functionality  
✅ **Measure First:** Never optimize without profiling baseline  
✅ **Structured Debugging:** Gather context → hypothesize → test → verify  
✅ **Automate with Agents:** Custom agents enforce standards automatically  
✅ **Reusable Prompts:** Prompt files create shareable, version-controlled workflows

---

## Navigation

[← Previous: Code Review](TRACK2_CODE_REVIEW.md) (Optional) | [🏠 Home](README.md) | [Next: Migration →](TRACK4_MIGRATION.md) (Optional)