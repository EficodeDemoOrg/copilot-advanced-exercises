# Track 4: AI-Assisted Language/Framework Migration

Migrate code between languages, frameworks, or architectures using AI to accelerate transformation.

---

## Cross-Track Enhancements

💡 **Enhanced with Track 1:** Establish domain standards in the target stack before migration  
🔗 **Follows Track 3:** Refactor before migrating for cleaner results

---

## Prerequisites

**Required:**
- VS Code or JetBrains IDE installed
- GitHub Copilot and Copilot Chat extensions
- Code to migrate (source)
- Target language/framework knowledge

---

## Workshop Flow

| Step | Section | Description |
|------|---------|-------------|
| 📋 | **Core Exercise** | |
| | → [Part A: Plan Migration](#part-a-plan-migration-strategy-with-ai) | Analyze codebase and create phased plan |
| | → [Part B: Understand Source](#part-b-understand-source-code) | Explain code and chart data flows |
| | → [Part C: Setup & Test Plan](#part-c-setup-target-environment--test-plan) | Configure target and document expected behavior |
| | → [Part D: Migrate Code](#part-d-migrate-code-with-ai) | Transform code layer by layer |
| | → [Part E: Validate & Iterate](#part-e-validate--iterate) | Test, debug, and refine until passing |
| 🤖 | [Automating Migrations](#-automating-migrations-with-custom-agents--prompt-files) | **Advanced: Automation** |
| | → [Part A: Create Migration Agent](#part-a-create-a-migration-custom-agent) | Build specialized migration agent |
| | → [Part B: Create Prompt Files](#part-b-create-reusable-prompt-files) | Reusable migration prompts with workflow table |
| | → [Part C: Automate with Agents + Prompts](#part-c-automate-with-agents--prompts) | Combine agents and prompts for automation |
| 📚 | [Example Session](#example-migration-session) | Flask → Express walkthrough |
| 🔄 | [Common Scenarios](#common-migration-scenarios) | Python, Ruby, JS → TS patterns |
| 🎯 | [Hands-On Practice](#hands-on-practice) | GitHub Skills exercise |

---

> 💡 **Modernizing Legacy Code?**
> 
> When working with legacy systems, **run the original code first** before attempting migration. This helps you:
> - Understand actual runtime behavior (not just what the code appears to do)
> - Establish a baseline for testing migrated code
> - Discover undocumented features or edge cases
> - Validate your test plan against real outputs
> 
> If the source code can't run in your environment, work with stakeholders who know the system to document expected behavior.

---

## Part A: Plan Migration Strategy with AI

**Purpose:** Develop comprehensive migration plan using AI analysis.

> 💡 **Note:** The prompts in this section are examples. Adapt them to your specific source and target stacks, project constraints, and team needs.

### Step 1: Analyze Source Codebase

**What you're achieving:** Before migrating, you need a clear picture of what you're working with. This step helps you understand the architecture, identify potential challenges, and estimate the effort required. AI can rapidly analyze codebases and surface insights that might take hours to discover manually.

**Why this matters:**
- Prevents surprises mid-migration
- Identifies framework-specific code that needs special handling
- Maps dependencies to their target equivalents
- Provides realistic effort estimates for planning

**Example Prompt (Ask / Agent mode Claude Sonnet 4.5):**
```
Analyze this [SOURCE_LANGUAGE/FRAMEWORK] project for migration to [TARGET]:
#file:[entry-point or key files]

Provide:
1. Architecture overview (layers, patterns, dependencies)
2. Migration complexity assessment (low/medium/high)
3. Key challenges (e.g., language features, framework-specific code)
4. Dependency mapping (which libraries have equivalents in target?)
5. Testing strategy
6. Estimated effort by module
```

**Adapt this prompt by:**
- Replacing `[SOURCE_LANGUAGE/FRAMEWORK]` with your actual stack (e.g., "Python Flask")
- Replacing `[TARGET]` with your target (e.g., "Node.js Express + TypeScript")
- Adding specific files using `#file:` references
- Including any known constraints or requirements

### Step 2: Create Migration Plan

**What you're achieving:** A phased migration plan breaks the work into manageable chunks with clear dependencies. This reduces risk by allowing you to validate each phase before proceeding, and provides rollback points if issues arise.

**Why this matters:**
- Enables incremental delivery and testing
- Reduces blast radius of potential issues
- Allows parallel work across team members
- Provides stakeholders with realistic timelines

**Example Prompt (Ask / Agent mode Claude Sonnet 4.5):**
```
Create a phased migration plan from [SOURCE] to [TARGET]:

Context:
- Source stack: [e.g., Python Flask + SQLAlchemy + Jinja2]
- Target stack: [e.g., Node.js Express + Prisma + React]
- Constraints: [e.g., must maintain API compatibility, zero downtime]

Provide:
1. Migration phases (what to migrate first, dependencies)
2. Parallel run strategy (if applicable)
3. Data migration approach
4. Testing at each phase
5. Rollback plan
6. Timeline estimate
```

**Adapt this prompt by:**
- Specifying your actual source and target stacks
- Adding your real constraints (API compatibility, downtime windows, team size)
- Including business requirements (feature freeze during migration, phased rollout)
- Mentioning any external dependencies (third-party APIs, databases, services)

**Example Output:**
```
Phase 1: Setup Target Environment (1 week)
- Initialize Node.js project
- Setup Prisma + PostgreSQL
- Configure build pipeline
- Setup integration tests

Phase 2: Migrate Data Layer (2 weeks)
- Translate SQLAlchemy models to Prisma schema
- Migrate database migrations
- Test CRUD operations
- Parallel run with source DB

Phase 3: Migrate Business Logic (3 weeks)
- Port Flask routes to Express
- Translate Python business logic to TypeScript
- Migrate validation logic
- Unit test each module

Phase 4: Migrate Frontend (2 weeks)
- Convert Jinja2 templates to React components
- Implement client-side routing
- Migrate frontend logic

Phase 5: Integration & Optimization (1 week)
- End-to-end testing
- Performance optimization
- Security audit
- Go-live
```

> 💡 **Automate with Prompt Files:** Save your migration plan prompt as `.github/prompts/migration-plan.prompt.md` to reuse across projects. See [Automating with Custom Agents & Prompt Files](#automating-with-custom-agents--prompt-files).

---

## Part B: Understand Source Code

**Purpose:** Deeply understand how source code works before transforming it.

### Explain the Code

Before migrating, ensure you understand what the code does—not just what it appears to do.

**Prompt (Agent mode Claude Sonnet 4.5):**
```
/explain #file:[main-entry-point] #file:[key-module-1] #file:[key-module-2]

Create a high-level overview of this application:
1. What is the application's purpose?
2. Explain each file in detail
3. How are the files linked together?
4. What are the key data flows?
5. What external dependencies does it rely on?
```

### Chart the Data Flow

Visualize how data moves through the application to ensure your migration preserves these flows.

**Prompt (Agent mode Claude Sonnet 4.5):**
```
@workspace Create a sequence diagram showing the data flow of this application.

Create this in Mermaid format so I can render it in a markdown file.
Include:
- User interactions
- Function/method calls between modules
- Data transformations
- External service calls
```

> 💡 **Tip:** Save the generated diagram to a `DATAFLOW.md` file in your project. Reference it during migration to ensure you preserve all data flows.

### Document Your Findings

Before proceeding, document what you've learned:

**Prompt (Agent mode Claude Sonnet 4.5):**
```
Based on our analysis of this codebase, create a MIGRATION_NOTES.md file that documents:
1. Architecture summary
2. Key modules and their responsibilities  
3. Data flow diagram (include the Mermaid diagram)
4. Critical business logic locations
5. Areas of concern for migration
6. Questions for stakeholders
```

---

## Part C: Setup Target Environment & Test Plan

**Purpose:** Configure target stack and establish test plan before writing migrated code.

> 💡 **Note:** The prompts in this section are examples. Adapt them to your specific target framework, testing preferences, and team conventions.

### Step 1: Generate Test Plan Before Migration

**What you're achieving:** Creating a test plan that documents expected behavior **before** you start converting code. This becomes your validation checklist—a contract that defines what "correct" looks like for the migrated system.

**Why this matters:**
- Captures business logic before it gets lost in translation
- Provides stakeholder-validated acceptance criteria
- Gives you concrete pass/fail criteria for each module
- Surfaces edge cases you might otherwise miss

**Example Prompt (Ask mode):**
```
@workspace The current application has limited tests. Create a test plan documenting the current business logic that I can:
1. Validate with stakeholders about current behavior
2. Use to create unit and integration tests in the target stack

The test plan should cover all business logic and include:
- Test case descriptions
- Pre-conditions
- Test steps  
- Expected results

Format this in a way that works for our team (markdown table, bullet list, or structured document).
```

**Adapt this prompt by:**
- Specifying which modules or features to focus on
- Adding your team's preferred test plan format
- Including specific business rules that must be preserved
- Mentioning any compliance or audit requirements

> 💡 **Tip:** Save this as `TESTPLAN.md` and reference it throughout migration. Update it as you discover additional test cases.

### Step 2: Create Project Structure

**What you're achieving:** Setting up a properly configured target project with the right folder structure, build tools, and development environment. Starting with a well-organized foundation prevents technical debt from day one.

**Why this matters:**
- Establishes consistent patterns for all migrated code
- Configures tooling (linting, formatting, testing) early
- Ensures the team can start working in parallel
- Follows target framework best practices

**Example Prompt (Agent mode):**
```
Setup a new [TARGET_FRAMEWORK] project:
1. Initialize project with recommended structure
2. Configure build tools (webpack/vite/etc)
3. Setup linting and formatting
4. Configure testing framework
5. Create initial folder structure matching our architecture

Reference modern best practices for [TARGET_FRAMEWORK].
```

**Adapt this prompt by:**
- Replacing `[TARGET_FRAMEWORK]` with your actual target (e.g., "Express + TypeScript")
- Specifying your preferred build tools and package manager
- Adding your team's folder structure conventions
- Including CI/CD configuration if needed

### Step 3: Setup Dependencies

**What you're achieving:** Mapping your source project's dependencies to their target equivalents. Not every library has a direct counterpart, so this step identifies gaps and alternatives early.

**Why this matters:**
- Prevents surprises when a critical library doesn't exist in target
- Identifies migration challenges for framework-specific packages
- Ensures you have the right tools before starting code migration
- Documents decisions for future reference

**Example Prompt (Agent mode):**
```
For this [SOURCE_FRAMEWORK] project:
#file:package.json (or requirements.txt, Gemfile, etc.)

Suggest equivalent dependencies in [TARGET_FRAMEWORK]:
- Map each dependency to target equivalent
- Recommend alternatives where no direct equivalent exists
- Note any migration challenges

Generate target dependency file (package.json, requirements.txt, etc.).
```

**Adapt this prompt by:**
- Pointing to your actual dependency file with `#file:`
- Specifying version constraints or compatibility requirements
- Noting any dependencies that must be kept (e.g., shared with other systems)
- Including security or licensing requirements

### Step 4: Configure Development Environment (With Track 1)

**What you're achieving:** If you completed Track 1, you're extending your domain instruction system to cover the target stack. This ensures migrated code follows the same standards and patterns as your existing codebase.

**Why this matters:**
- Maintains consistency between source and target codebases
- Provides AI with context for idiomatic target code
- Documents migration-specific patterns for the team
- Enables domain-aware code reviews of migrated code

**If Track 1 completed:** Setup domain instructions for target stack

**Example Prompt (Agent mode):**
```
Create domain instructions for our new [TARGET_STACK]:

Based on:
- Source domain structure: #file:.github/instructions/
- Target stack: [TARGET_FRAMEWORK, LANGUAGE]

Generate:
- .github/instructions/[target]-common.instructions.md
- Domain-specific instructions for target
- Migration-specific guidelines

Ensure consistency with source domain patterns.
```

**Adapt this prompt by:**
- Specifying your actual target stack
- Referencing your existing instruction files
- Adding migration-specific rules (e.g., "all migrated files must have comments explaining translations")
- Including patterns specific to your target framework

---

## Part D: Migrate Code with AI

**Purpose:** Transform code from source to target using AI.

> 💡 **Scale with Automation:** For large migrations, create a custom agent or prompt files to ensure consistent translation patterns across all files. See [Automating with Custom Agents & Prompt Files](#automating-with-custom-agents--prompt-files).

### Migration Approaches

#### Approach 1: File-by-File Migration (No Track 1)

**Use Agent mode for direct translation:**

**Prompt:**
```
Migrate this [SOURCE] file to [TARGET]:
#file:[source-file]

Requirements:
1. Preserve all functionality exactly
2. Follow [TARGET] best practices and idioms
3. Use appropriate [TARGET] libraries/patterns
4. Add type annotations (if target supports)
5. Include comments explaining non-obvious translations
6. Maintain existing error handling

Show original alongside migrated code.
```

#### Approach 2: Domain-Guided Migration (With Track 1)

**If you completed Track 1, use domain context:**

**VS Code with Custom Agents:**

1. **Create target domain specialist** (if migrating to new domain)
2. **Prompt:** *"Migrate #file:[source] to [TARGET] following our target domain standards."*

**JetBrains or Without Custom Agents:**

**Prompt:**
```
Migrate this file to [TARGET] following:
- Source: #file:[source-file]
- Target standards: #file:.github/instructions/[target]-common.instructions.md

Ensure migrated code matches target domain patterns.
```

### Migrate by Layer

#### 1. Data Models

**Prompt (Agent mode):**
```
Migrate these data models from [SOURCE] to [TARGET]:
#file:[source-models]

For [TARGET_ORM/Framework]:
- Map types appropriately (e.g., Python int → TypeScript number)
- Translate relationships (ForeignKey, ManyToMany, etc.)
- Migrate validation rules
- Generate migration files if needed

Show side-by-side comparison.
```

**Example: SQLAlchemy to Prisma**

```
# Source (Python/SQLAlchemy)
class User(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True)
    email = Column(String, unique=True, nullable=False)
    posts = relationship('Post', back_populates='author')

# Target (Prisma Schema)
model User {
  id    Int    @id @default(autoincrement())
  email String @unique
  posts Post[]
}
```

#### 2. Business Logic

**Prompt (Agent mode):**
```
Migrate this business logic from [SOURCE] to [TARGET]:
#file:[source-file]

Translate:
- Class methods → target equivalent (classes, functions, modules)
- Error handling → target idioms (try/catch vs Result types)
- Async patterns → target async model
- Language-specific features → target equivalents

Preserve all edge cases and validations.
```

#### 3. API Layer

**Prompt (Agent mode):**
```
Migrate these API endpoints from [SOURCE_FRAMEWORK] to [TARGET_FRAMEWORK]:
#file:[source-routes]

Maintain:
- Same HTTP methods and paths
- Request/response formats (JSON schemas)
- Error codes and messages
- Authentication/authorization logic

Use [TARGET_FRAMEWORK] routing and middleware patterns.
```

#### 4. Frontend/UI

**Prompt (Agent mode):**
```
Migrate this [SOURCE_UI] to [TARGET_UI]:
#file:[source-component]

Convert:
- Template syntax → target component syntax
- State management → target state approach
- Event handlers → target event system
- Styling → target CSS approach

Maintain exact UI behavior and appearance.
```

### Handle Special Cases

#### Migrate Complex Algorithms

**Prompt (Agent mode):**
```
Migrate this algorithm from [SOURCE] to [TARGET]:
[PASTE ALGORITHM]

Challenges:
- [e.g., "Uses Python list comprehensions heavily"]
- [e.g., "Relies on dynamic typing"]

Provide:
1. Direct translation
2. Idiomatic target version
3. Performance comparison notes
```

#### Migrate Framework-Specific Code

**Prompt (Ask mode - Claude):**
```
This code uses [SOURCE_FRAMEWORK] specific features:
#file:[source]

How should I migrate to [TARGET_FRAMEWORK]?
- Identify framework-specific code
- Suggest target framework equivalents
- Explain conceptual differences
- Provide migration code
```

### Link Files and Setup Working Project

After converting individual files, link them together into a working project.

**Prompt (Agent mode):**
```
@workspace I've migrated these files to [TARGET]:
- [list migrated files]

Help me:
1. Ensure all imports/requires are correct between modules
2. Setup the project entry point
3. Configure any build scripts needed
4. Verify the project compiles/runs without errors

Identify any missing pieces or broken connections.
```

**Run the migrated application:**
```
# Initialize dependencies (example for Node.js)
npm init -y
npm install

# Run the application
npm start
```

> ⚠️ **Expect issues:** The migrated application may not work correctly on first run. This is normal—proceed to Part E to iteratively fix and validate.

---

## Part E: Validate & Iterate

**Purpose:** Ensure migrated code works correctly through iterative testing and refinement.

### Iterative Debugging Workflow

Migration is rarely one-and-done. Use this iterative process:

1. **Run tests** → Identify failures
2. **Analyze failures** → Understand root cause  
3. **Fix issues** → Refine migrated code
4. **Re-run tests** → Verify fix, repeat until passing

**Prompt for analyzing failures (Agent mode):**
```
@workspace Analyze the test failures in [test-file] and suggest fixes to match expected behavior.

Reference:
- Test plan: #file:TESTPLAN.md
- Original source: #file:[source-file]
- Migrated code: #file:[target-file]

For each failure:
1. Explain why the test is failing
2. Show the fix needed in the migrated code
3. Verify the fix doesn't break other functionality
```

### Generate Tests from Test Plan

**Prompt (Agent mode):**
```
Create unit and integration tests from the test plan in #file:TESTPLAN.md.

For the migrated code in [target-folder]:
- Use [TARGET_TEST_FRAMEWORK]
- Generate tests for #file:[migrated-module]
- Cover all test cases from the plan
- Include setup/teardown as needed

Provide all dependencies required to run the tests.
```

### Manual Testing

> ⚠️ **Important:** Automated tests don't catch everything. Always manually verify:
> - User-facing workflows behave identically
> - Edge cases discovered during migration
> - Performance feels comparable
> - Error messages are user-friendly

### Validation Steps

#### 1. Functional Equivalence Testing

**Prompt (Agent mode):**
```
Generate tests to verify migrated [MODULE] is functionally equivalent to source:

Test:
- All input/output combinations
- Edge cases
- Error conditions
- Integration points

Use [TARGET_TEST_FRAMEWORK].
Compare behavior with source code: #file:[source]
```

#### 2. Integration Testing

**Prompt (Agent mode):**
```
Create integration tests for migrated [FEATURE]:
1. Test API endpoints (if applicable)
2. Test database interactions
3. Test external service integrations
4. Test authentication/authorization flows

Ensure end-to-end functionality matches source.
```

#### 3. Performance Comparison

**Prompt (Ask mode - Claude):**
```
Compare performance characteristics:
- Source: [SOURCE_LANGUAGE/FRAMEWORK]
- Target: [TARGET_LANGUAGE/FRAMEWORK]

For [SPECIFIC OPERATIONS]:
- Expected performance differences?
- Optimization opportunities in target?
- Benchmarking approach?
```

#### 4. Code Review

**Prompt (Agent mode):**
```
Review migrated code for:
1. Correctness (matches source behavior)
2. Idiomatic target code (uses target best practices)
3. Performance (no obvious bottlenecks)
4. Security (no vulnerabilities introduced)
5. Maintainability (clear, documented)

Reference:
- Source: #file:[source]
- Migrated: #file:[target]
```

### Optimization

**Prompt (Agent mode):**
```
Optimize this migrated code for [TARGET]:
#file:[migrated-file]

Leverage target-specific features:
- [e.g., "Use TypeScript generics for type safety"]
- [e.g., "Use Node.js streams for large data"]
- [e.g., "Use React hooks for state"]

Maintain functional equivalence while improving code quality.
```

---

## Example Migration Session

### Scenario: Migrate Python Flask API to Node.js Express

#### Source Code (Python/Flask)

```python
# app.py
from flask import Flask, request, jsonify
from models import db, Book
from sqlalchemy.exc import IntegrityError

app = Flask(__name__)

@app.route('/books', methods=['GET'])
def get_books():
    books = Book.query.all()
    return jsonify([book.to_dict() for book in books])

@app.route('/books/<int:id>', methods=['GET'])
def get_book(id):
    book = Book.query.get_or_404(id)
    return jsonify(book.to_dict())

@app.route('/books', methods=['POST'])
def create_book():
    data = request.get_json()
    try:
        book = Book(title=data['title'], author=data['author'])
        db.session.add(book)
        db.session.commit()
        return jsonify(book.to_dict()), 201
    except IntegrityError:
        db.session.rollback()
        return jsonify({"error": "Book already exists"}), 400
    except KeyError as e:
        return jsonify({"error": f"Missing field: {e}"}), 400
```

```python
# models.py
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Book(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(200), nullable=False)
    author = db.Column(db.String(100), nullable=False)
    
    def to_dict(self):
        return {
            'id': self.id,
            'title': self.title,
            'author': self.author
        }
```

#### Step 1: Analyze & Plan (Ask mode - Claude)

**Prompt:**
```
Analyze this Flask API for migration to Express + Prisma + TypeScript:
[PASTE SOURCE CODE]

Provide migration plan with phases.
```

**AI Response:**
- Phase 1: Setup Express + TypeScript project
- Phase 2: Define Prisma schema (Book model)
- Phase 3: Implement routes
- Phase 4: Add validation & error handling
- Phase 5: Testing

#### Step 2: Setup Target (Agent mode)

**Prompt:**
```
Setup Express + TypeScript + Prisma project:
1. Initialize with proper tsconfig
2. Install dependencies (express, prisma, etc.)
3. Create folder structure (src/routes, src/models, etc.)
4. Configure build scripts
```

#### Step 3: Migrate Models (Agent mode)

**Prompt:**
```
Migrate this SQLAlchemy model to Prisma:
[PASTE models.py]

Generate Prisma schema and TypeScript types.
```

**AI Generates:**

```prisma
// prisma/schema.prisma
model Book {
  id     Int    @id @default(autoincrement())
  title  String @db.VarChar(200)
  author String @db.VarChar(100)
}
```

```typescript
// src/types/book.ts
export interface Book {
  id: number;
  title: string;
  author: string;
}
```

#### Step 4: Migrate Routes (Agent mode)

**Prompt:**
```
Migrate Flask routes to Express + TypeScript:
[PASTE app.py]

Use:
- Express Router
- Prisma Client
- Proper TypeScript types
- Async/await
- Error handling middleware

Maintain same endpoints and behavior.
```

**AI Generates:**

```typescript
// src/routes/books.ts
import { Router } from 'express';
import { PrismaClient } from '@prisma/client';
import { z } from 'zod';

const router = Router();
const prisma = new PrismaClient();

// Validation schema
const CreateBookSchema = z.object({
  title: z.string().max(200),
  author: z.string().max(100),
});

// GET /books
router.get('/', async (req, res, next) => {
  try {
    const books = await prisma.book.findMany();
    res.json(books);
  } catch (error) {
    next(error);
  }
});

// GET /books/:id
router.get('/:id', async (req, res, next) => {
  try {
    const id = parseInt(req.params.id);
    const book = await prisma.book.findUnique({ where: { id } });
    
    if (!book) {
      return res.status(404).json({ error: 'Book not found' });
    }
    
    res.json(book);
  } catch (error) {
    next(error);
  }
});

// POST /books
router.post('/', async (req, res, next) => {
  try {
    const data = CreateBookSchema.parse(req.body);
    const book = await prisma.book.create({ data });
    res.status(201).json(book);
  } catch (error) {
    if (error instanceof z.ZodError) {
      return res.status(400).json({ 
        error: 'Validation error', 
        details: error.errors 
      });
    }
    if (error.code === 'P2002') { // Prisma unique constraint
      return res.status(400).json({ error: 'Book already exists' });
    }
    next(error);
  }
});

export default router;
```

#### Step 5: Validate (Agent mode)

**Prompt:**
```
Generate integration tests for migrated book API:
- Test GET /books
- Test GET /books/:id (found and not found)
- Test POST /books (success, duplicate, missing fields)

Use Jest + Supertest. Test against actual database.
```

**Prompt:**
```
Compare Flask vs Express API:
1. Are all endpoints functionally equivalent?
2. Are error responses consistent?
3. Any performance differences?
4. Security considerations?
```

---

## Common Migration Scenarios

### Python → TypeScript/Node.js

**Key Translations:**
- Classes → Classes or interfaces + functions
- List comprehensions → map/filter/reduce
- Decorators → Higher-order functions or decorators
- Context managers → try/finally or using patterns
- Type hints → TypeScript types

### Ruby/Rails → Node.js/Express

**Key Translations:**
- ActiveRecord → Sequelize/Prisma/TypeORM
- Rails routes → Express routes
- ERB templates → EJS/Handlebars/React
- Rails helpers → Custom middleware
- Gems → npm packages

### JavaScript → TypeScript

**Key Focus:**
- Add type annotations
- Convert implicit any → explicit types
- Use interfaces for object shapes
- Add generics where appropriate
- Enable strict mode

### Monolith → Microservices

**Key Focus:**
- Identify bounded contexts
- Extract services by domain
- Define service APIs
- Handle distributed data
- Implement inter-service communication

---

## 🤖 Automating Migrations with Custom Agents & Prompt Files

**Purpose:** Create reusable, automated migration workflows that ensure consistency across large codebases and team members.

The prompts and techniques you created earlier in this track can be leveraged for automated workflows:

| From Earlier in Track 4 | Use in Automation |
|-------------------------|-------------------|
| Migration plan prompts (Part A) | Save as prompt files for reuse across projects |
| Test plan generation (Part C) | Codify into reusable prompts |
| File migration patterns (Part D) | Create agents that apply consistent translation rules |
| Validation techniques (Part E) | Add verification steps to automated workflows |

---

If you completed **Track 1: Agent-Driven Development**, you already have custom agents and domain instructions that enhance your migration capabilities:

| From Track 1 | Use in Migrations |
|--------------|-------------------|
| Domain instruction files | Reference in migration prompts for context-aware translations |
| Custom specialist agents | Invoke for domain-specific code generation in target stack |
| Coding standards | Ensure migrated code follows established patterns |

**Quick Start:** If you created a `backend-specialist` agent in Track 1, try: Choose the backend-specialist agent and *"Migrate this Python service to TypeScript following our backend standards."*

---

For JetBrains or Without Custom Agents

Use **prompt templates** from [JETBRAINS_PROMPTS.md - Migration Section](JETBRAINS_PROMPTS.md#track-4-migration-prompts):
- Copy migration prompts for your language pair
- Manually add context: `#file:.github/instructions/[domain].instructions.md`
- Use Ask/Agent modes as shown in examples

---

### Part A: Create a Migration Custom Agent

Custom agents allow you to define specialized migration assistants that automatically apply your translation patterns and standards.

#### Step 1: Create the Agent File

Create `.github/agents/migrator.md`:

```markdown
---
name: migrator
description: Assists with code migration from source to target stack
tools:
  - semantic_search
  - read_file
  - grep_search
---

# Code Migration Specialist

You are a senior developer specializing in code migrations. Your role is to migrate code between languages/frameworks while preserving functionality.

## Migration Process

1. **Understand Source:** Read the file(s) to understand purpose, dependencies, and business logic
2. **Check Standards:** Reference instruction files for target stack patterns
3. **Translate Code:** Convert to target language using idiomatic patterns
4. **Preserve Behavior:** Ensure all edge cases and error handling are maintained
5. **Document Decisions:** Add comments explaining non-obvious translations

## Translation Priorities

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

### Performance (Consider)
- Note any performance implications
- Suggest optimizations in target
- Flag potential bottlenecks

## Output Format

For each migration:
\`\`\`
### Migration: [source-file] → [target-file]
**Source:** path/to/source.py
**Target:** path/to/target.ts
**Complexity:** Low|Medium|High
**Notes:** Any translation decisions or caveats

[Generated target code]
\`\`\`

## References

Always check and follow these files when available:
- `.github/instructions/[target]-common.instructions.md`
- `TESTPLAN.md` for expected behavior
- `MIGRATION_NOTES.md` for project context
```

#### Step 2: Use the Agent

In VS Code Copilot Chat:
1. Choose `migrator` from the Agent list
2. Prompt: *"Migrate #file:src/models/user.py to TypeScript with Prisma"*
3. The agent follows its defined process automatically

#### Step 3: Create Additional Agents Using Agent Mode

Once you have your first agent, use **Agent mode** to generate additional specialized agents:

**Prompt (Agent mode):**
```
Using #file:.github/agents/migrator.md as a template, create a new agent file called "quick-migrate.md" in the .github/agents folder.

This agent should:
- Focus on rapid file-by-file migration
- Skip detailed analysis for simple translations
- Use emoji indicators: ✅ Migrated, ⚠️ Needs Review, ❌ Manual Required
- Optimized for batch processing multiple files
```

**More agents to create with Agent mode:**

| Agent Name | Prompt to Create It |
|------------|---------------------|
| `model-migrator` | *"Create a data model migration agent based on #file:.github/agents/migrator.md that specializes in ORM translations (SQLAlchemy → Prisma, ActiveRecord → TypeORM)"* |
| `api-migrator` | *"Create an API migration agent that focuses on route handlers, middleware, and request/response translations"* |
| `test-migrator` | *"Create a test migration agent that converts test suites between frameworks (pytest → Jest, RSpec → Mocha)"* |

> 💡 **Tip:** Let AI do the heavy lifting! Once you have one well-crafted agent, use it as a template to generate others. This ensures consistency across your agent library.

### Part B: Create Reusable Prompt Files

Prompt files (`.prompt.md`) create reusable, shareable migration workflows that run in fresh context each time.

> ⚠️ **Why not one big prompt?** Attempting to migrate an entire module in a single prompt can overload the context window, leading to incomplete migrations, missed edge cases, or hallucinated code. Instead, use focused prompts for each step.

#### Step-by-Step Migration Workflow

Run these prompts **in sequence**, reviewing output between each step:

| Step | Prompt File | What It Does | Review Before Next Step |
|------|-------------|--------------|-------------------------|
| 1 | `analyze-module.prompt.md` | Maps dependencies, identifies migration order | Verify dependency graph is correct |
| 2 | `migrate-models.prompt.md` | Converts data models/schemas | Ensure types match, run schema validation |
| 3 | `migrate-file.prompt.md` | Converts business logic (repeat per file) | Check each file compiles |
| 4 | `migrate-api.prompt.md` | Converts routes/handlers | Verify route signatures match |
| 5 | `link-imports.prompt.md` | Fixes imports across migrated files | Run `tsc` or equivalent to verify |
| 6 | `migrate-tests.prompt.md` | Converts test suite | Run tests, note failures |
| 7 | `analyze-failure.prompt.md` | Debugs test failures (repeat as needed) | Fix until tests pass |

#### Step 1: Create the First Prompt File

Start with a file migration prompt - this handles the core translation work:

Create `.github/prompts/migrate-file.prompt.md`:

```markdown
---
mode: agent
description: Migrate a source file to target stack
tools:
  - read_file
  - grep_search
  - semantic_search
---

# File Migration

Migrate the specified source file to the target language/framework.

## Requirements

1. Preserve all functionality exactly
2. Follow target language best practices and idioms
3. Use appropriate libraries/patterns for target framework
4. Add type annotations where supported
5. Include comments for non-obvious translations
6. Maintain existing error handling

## Process

1. Read and understand the source file
2. Identify dependencies and imports
3. Translate to target language
4. Apply target framework patterns
5. Add explanatory comments

## Input

Source file: ${input:sourceFile:Path to source file to migrate}
Target language: ${input:targetLang:Target language (e.g., TypeScript, Go, Rust)}
Target framework: ${input:targetFramework:Target framework (e.g., Express, Gin, Actix)}

## Output

Provide:
1. Complete migrated code
2. List of new dependencies needed
3. Any manual steps required
4. Test cases to verify migration
```

#### Step 2: Generate the Remaining Prompt Files

Use **Agent mode** to create the other prompt files based on your first one:

**Prompt (Agent mode):**
```
Using #file:.github/prompts/migrate-file.prompt.md as a template, create the remaining migration workflow prompts in .github/prompts/:

1. analyze-module.prompt.md - Analyze module structure and create migration order (no code generation)
2. migrate-models.prompt.md - Convert data models/schemas to target stack
3. migrate-api.prompt.md - Convert API routes and handlers
4. link-imports.prompt.md - Fix imports across all migrated files
5. migrate-tests.prompt.md - Convert test files to target test framework
6. analyze-failure.prompt.md - Debug a specific test failure

Each prompt should:
- Use the same YAML frontmatter structure
- Include ${input:...} variables for user input
- Be focused on ONE task (no multi-step workflows)
- Include clear instructions on what to output
```

> 💡 **Tip:** Each prompt runs in a fresh context, preventing overload. Review and commit after each step before proceeding.

### Part C: Automate with Agents + Prompts

Combine your custom agent with prompt files for a streamlined migration workflow.

#### Using Prompt Files

1. **From Command Palette:** `Ctrl+Shift+P` → "Chat: Run Prompt File"
2. **From Chat:** Type `/` and select your prompt
3. **With variables:** Prompts with `${input:...}` will ask for values

#### Agent-Driven Workflow

Instead of running prompts manually, use your migration agent to orchestrate the workflow:

**Step 1: Analyze with Agent**
```
Choose the migrator agent: "Analyze #file:src/users/ and create a migration plan. 
List all files, map dependencies, and recommend migration order."
```

**Step 2: Migrate with Prompts**

For each file in the migration order, run the appropriate prompt:
```
Run: /migrate-models → src/users/models.py
Run: /migrate-file → src/users/service.py  
Run: /migrate-api → src/users/routes.py
```

**Step 3: Link and Validate**
```
Run: /link-imports → dist/users/
Run: /migrate-tests → tests/users/
```

**Step 4: Debug Failures with Agent**
```
Choose the migrator agent: "Analyze the test failure in #file:tests/users/service.test.ts. 
Compare against #file:TESTPLAN.md and provide a targeted fix."
```

#### Batch Migration with Agent

For larger migrations, use the agent to process multiple files:

**Prompt:**
```
Choose the migrator agent: "Migrate all files in #file:src/models/ to TypeScript with Prisma.

For each file:
1. Convert to TypeScript
2. Replace SQLAlchemy with Prisma schema
3. Generate corresponding interface types
4. List any manual steps needed

Process files in dependency order. Stop and report after each file."
```

> 💡 **Tip:** The agent maintains context across the conversation, so it can reference previous migrations when handling dependent files.

### Folder Structure Summary

```
.github/
├── agents/
│   └── migrator.md              # Migration specialist agent
├── prompts/
│   ├── analyze-module.prompt.md # Step 1: Dependency analysis
│   ├── migrate-models.prompt.md # Step 2: Data models
│   ├── migrate-file.prompt.md   # Step 3: Business logic
│   ├── migrate-api.prompt.md    # Step 4: Routes/handlers
│   ├── link-imports.prompt.md   # Step 5: Fix imports
│   ├── migrate-tests.prompt.md  # Step 6: Test suite
│   └── analyze-failure.prompt.md# Step 7: Debug failures
└── instructions/
    ├── migration.instructions.md
    └── [target]-common.instructions.md
```

### Benefits of Automation

| Benefit | Description |
|---------|-------------|
| **Consistency** | Same translation patterns applied to every file |
| **Speed** | Prompt files eliminate repetitive typing |
| **Team Alignment** | Shared prompts ensure consistent migrations |
| **Onboarding** | New developers use established patterns |
| **Audit Trail** | Prompt files are version-controlled |
| **Iteration** | Refine prompts once, benefit everywhere |

---

## Key Takeaways

✅ **Understand First:** Explain and diagram code before transforming it  
✅ **Test Plan Early:** Document expected behavior before writing migrated code  
✅ **Plan Thoroughly:** Analysis prevents migration surprises  
✅ **Migrate in Phases:** Layer-by-layer reduces risk  
✅ **Iterate on Failures:** Expect issues and refine until tests pass  
✅ **Manual + Automated:** Automated tests don't catch everything—verify manually too  
✅ **Automate at Scale:** Use prompt files and custom agents for consistent, repeatable migrations  
✅ **Refactor First:** Clean source code migrates better (Track 3)  
✅ **Leverage AI:** Use AI for translation, but validate carefully

---

## Hands-On Practice

🎯 **Want guided practice?** Try the [Modernizing Legacy Code with GitHub Copilot](https://github.com/skills/modernize-your-legacy-code-with-github-copilot) Skills exercise for a step-by-step walkthrough of the migration process.

---

## Navigation

[← Previous: Refactoring](TRACK3_REFACTORING.md) (Optional) | [🏠 Home](README.md) | [Next: MCP Integration →](TRACK5_MCP_INTEGRATION.md) (Optional)
