# Development Rules

## 0. STRICT DOCUMENTATION RULE (MANDATORY)
- **ALWAYS READ DOCS:** Aage ka koi bhi development, architecture setup, ya UI design ka kaam shuru karne se pehle, **hamesha `docs/` folder ki saari files (`PRD.md`, `ARCHITECTURE.md`, `DESIGN.md`, `RULES.md`, `TASKS.md`, `MEMORY.md`) ko read aur cross-verify karna mandatory hai**. In docs ke rules aur plan ke bina koi code generate nahi hoga.

## 1. General Rules
- **Understand First:** First understand the existing project and codebase. Never blindly modify code.
- **Inspect:** Before making changes, inspect the relevant files, architecture, models, APIs, routes, state management, and existing patterns.
- **Respect Architecture:** Follow the existing project architecture unless there is a strong technical reason to improve it.
- **Scoped Changes:** Modify only the files required for the requested task. Do not rewrite or restructure unrelated code.
- **Preserve Functionality:** Do not remove existing functionality unless explicitly requested.
- **No Duplication:** Do not create duplicate screens, models, repositories, services, or widgets if an existing implementation can be reused.
- **Production Ready:** Keep the implementation production-ready.
- **Simplicity:** Prefer simple, maintainable, scalable code over unnecessary complexity.
## 2. Flutter Architecture Rules
- **Feature-Based Architecture:** Do not put feature-specific screens directly inside a global screens folder if the project already follows feature-based architecture (Clean Architecture). All feature-specific files must stay within their respective `features/<feature_name>/` directory.
- **Root Protection:** Root `lib/` mein direct koi screen/widget file mat rakho.
## Layer Responsibility
- **Data Layer (`data/`)**: 
  - `models/`: Sirf data classes (`fromJson`/`toJson`, `copyWith`).
  - `datasources/`: Raw API/DB call karta hai. 
  - `repositories/`: Abstract repository ko implement karta hai.
- **Domain Layer (`domain/`)**: 
  - `entities/`: Core business objects.
  - `repositories/`: Sirf abstract class/interface.
  - `usecases/`: Business rules apply karte hain.
- **Presentation Layer (`presentation/`)**:
  - `bloc/`: UI state hold karta hai. Business logic isme nahi hoga, sirf event receive karke state emit karega aur usecase call karega.
  - `pages/`: Full page UI, `BlocBuilder` / `BlocConsumer` use kare.
  - `widgets/`: Us feature ke chhote reusable UI pieces.

## Repository Pattern — Mandatory
- UI (presentation) kabhi direct API/database call nahi karega.
- `domain/usecases/` sirf `domain/repositories` ko call karega.

## Core Files Usage
- Colors, strings, sizes hardcode mat karo — hamesha `core/constants/` se use karo.
- Reusable widgets `core/widgets/` mein rakho.

## State Management — BLoC
- State update karne ke liye `flutter_bloc` (BlocBuilder, BlocListener, BlocConsumer) use karo.
- Poore widget tree ko `setState` se rebuild mat karo; granular updates ke liye `BlocSelector` ya chhoti builder wrapping use karo.

## Routing
- **`Navigator.push` ya `Navigator.pop` direct use karne ke bajaye** standard routing approach (jaise `go_router` ya basic `Navigator` with named routes) follow karo.
- Files: `routes/app_routes.dart` aur `routes/app_router.dart`.

## Scalability & App Lifecycle (1 Million+ Users)
- **Background State**: FCM Data Messages ka use karo, jisse app background/killed hone pe silent processing ho sake.
- **Caching**: App open hone par pehle local cache dikhao (Hive/SQLite), aur silently background mein backend se naya data fetch karo. Polling avoid karo.

## 3. STATE MANAGEMENT
Use the project's existing state-management solution (BLoC).
- Keep business logic outside UI.
- Use Equatable where appropriate.
- Keep events, states, and business logic clean.
- Do not put API calls directly inside widgets.
- Do not use setState for business logic when BLoC is already established.

## 4. API DEVELOPMENT
When working with APIs:
- Check the existing API service/client, request/response models, and token handling.
- Follow existing API conventions.
- Add proper loading, success, empty, and error states.
- Handle API failures gracefully.
- Do not hardcode API URLs, tokens, IDs, or credentials.
- Reuse existing networking infrastructure whenever possible.
- New APIs require: Request model (if required), Response model, Repository, Data source/service, BLoC, and UI integration following existing architecture.

## 5. UI DEVELOPMENT
When implementing UI:
- Match the existing design system.
- Reuse existing colors, typography, spacing, buttons, text fields, dialogs, and common widgets.
- Make layouts responsive. Avoid hardcoded screen dimensions.
- Handle small and large screens and keyboard overflow.
- Handle loading and empty states and long text safely.
- Maintain accessibility and readability.
- Do not redesign the application unless explicitly requested.

## 6. DATABASE / LOCAL STORAGE
When working with Hive, SQLite, SharedPreferences, Secure Storage, etc.:
- Inspect existing storage architecture first. Reuse existing boxes/tables/services.
- Do not create duplicate storage mechanisms unnecessarily.
- Handle migrations safely. Do not delete existing user data accidentally.
- Keep local caching logic outside UI.

## 7. PERFORMANCE
Always consider:
- Unnecessary widget rebuilds, Large lists (use ListView.builder), Image caching.
- Memory usage, API calls (avoid duplicates), Unnecessary BLoC events, Excessive animations, Build method complexity.
- Avoid unnecessary rebuilds and expensive operations inside `build()`.

## 8. ERROR HANDLING
Every important feature should properly handle:
Loading, Success, Empty, API error, Network error, Timeout, Unauthorized/session expired, Invalid response, Unexpected exception.
- Do not silently ignore errors.
- Use the project's existing logging system.
- Never expose sensitive information such as tokens, passwords, or API keys in logs.

## 9. DEBUGGING PROCESS
When fixing a bug:
- Reproduce/understand the reported behavior. Trace the complete flow.
- Identify the actual root cause. Do not apply random patches. Fix the root cause.
- Check related flows for regression. Keep the fix as small as reasonably possible.
- Before saying a bug is fixed, verify the affected code path.

## 10. CODE MODIFICATION RULE
IMPORTANT: Before editing any file:
- Read the complete relevant section, understand dependencies, understand how the code is currently working, identify exactly what needs to change.
- Then make the minimum required modification.
- Do NOT: Rewrite complete files unnecessarily, Change naming conventions without reason, Change architecture without request, Upgrade packages unnecessarily, Change unrelated UI, Remove working functionality, Add unnecessary dependencies.

## 11. DEPENDENCIES
Before adding a package:
- Check whether the project already has a package that solves the problem.
- Prefer existing dependencies. Add a new dependency only when necessary.
- Never upgrade Flutter/Dart/package versions unless explicitly requested or required.

## 12. SECURITY
Never hardcode: API keys, Access tokens, Passwords, Secret keys, Private credentials.
- Use the project's existing environment/configuration mechanism.
- Validate user input where required. Do not log sensitive data.

## 13. TESTING
After making changes:
- Run/analyze the affected code. Check for Dart analyzer errors, imports, null-safety.
- Check navigation, API integration, state transitions, loading/error/empty states, possible runtime crashes.
- If tests exist, update/run relevant tests.
- If you cannot run the application, clearly mention what was verified statically and what still requires runtime testing.

## 14. GIT / CHANGES
Keep changes focused. At the end, provide:
- **Changed Files:** (list files)
- **Changes Made:** (list changes)
- **Verification:** (what was checked, any remaining issue)
- Do not claim something was tested if it was not actually tested.

## 15. WHEN REQUIREMENTS ARE UNCLEAR
- Do not immediately start coding if the requirement is ambiguous.
- First determine whether the existing codebase provides enough information.
- If a critical requirement is missing, ask a concise clarification.
- If the requirement is sufficiently clear, proceed without unnecessary questions.

## 16. PRIORITIES & ANTI-PATTERNS
**NEVER do this:** GUESS → CODE → BREAK EXISTING FEATURES

Your priority is strictly in this order:
1. Existing functionality
2. Correctness
3. Clean architecture
4. Maintainability
5. Performance
6. Security
7. Minimal changes

Always preserve existing behavior unless the requested feature specifically requires changing it.
