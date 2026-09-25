# Design System

## Style Requirements
- **Theme:** Modern, Minimal, and Professional.
- **Material 3:** Follow Material 3 guidelines for Flutter.
- **Dark/Light Mode:** Ensure all colors are compatible with both theme modes.

## Core Constraints & Theming
- **NO HARDCODING:** Colors, text sizes, padding, and margins must never be hardcoded in UI files.
- **Use Proper Theme:** Always use `Theme.of(context)` for colors, text styles, and typography. Do not hardcode raw colors or font sizes directly in the widgets.
- Always fetch design tokens from `lib/core/theme/` or `lib/core/constants/`.

## Typography
- **Primary Font:** (E.g., Google Fonts 'Inter' or 'Poppins')
- Ensure proper text scaling for accessibility.

## UX & States (Mandatory)
Every feature must handle the following states visually:
1. **Loading State:** Shimmer effects or Custom Loaders.
2. **Empty State:** User-friendly message with an illustration when no data exists.
3. **Error State:** Friendly error message with a "Retry" button.
4. **Offline State:** Clear indication if the user has lost internet connectivity.

## Widget Placement Rule
- **Common Widgets:** App-level generic components (Buttons, TextFields, Dialogs, BottomSheets, Loaders) MUST be placed in `lib/core/widgets/`.
- **Feature-Specific Widgets:** Widgets that belong to a particular screen or flow MUST be placed in `lib/features/<feature_name>/presentation/widgets/`. Do not put feature-specific UI in the core folder.
