# Memory
Current project state for SafeCheck Techno.

## Current Status
- **Core Infrastructure**: Basic folder structure, routing (GoRouter), theme, and core widgets are in place.
- **Authentication**: Base screens created, along with BLoC components.
- **Phase 1A (Admin Dashboard & User Management)**: UI for Admin Dashboard, Manage Users, Add User is complete. Dashboard BLoC integrated.
- **Phase 1B (Customer & Site Management)**: UI for Customer List, Add Customer, Customer Details, Site List, Add Site, Site Details is complete and routed using GoRouter.

## Pending Architecture Debt
- Add proper BLoC / Cubits for all newly created Phase 1A and 1B screens (User Management, Customer Management, Site Management) following the Clean Architecture pattern (`features/*/presentation/bloc`).
- Connect these screens to the Domain and Data layers.

## Next Step
- Complete Phase 1C & 1D (Equipment Management & Certificate Management).
- Ensure every new feature adheres strictly to `docs/RULES.md` and `docs/ARCHITECTURE.md`.
