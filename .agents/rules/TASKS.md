# Tasks Breakdown

## Phase 1: Core Setup
- [x] Initialize / Create Flutter project (`flutter create`).
- [x] Add all required dependencies (`flutter_bloc`, `dio`, `hive`, `go_router`, `equatable`, etc.) to `pubspec.yaml`.
- [x] Initialize standard folder structure (`lib/core/`, `lib/features/`, `lib/routes/`).
- [x] Setup `app_routes.dart` & `route_helper.dart` for named routing / go_router.
- [x] Setup `MultiBlocProvider` in `main.dart` (or via GoRouter).
- [x] Create core theme, constants (colors, strings, text styles).
- [x] Setup basic generic widgets (Loading, Error view, Custom Button).

## Phase 2: Core Infrastructure
- [x] Setup API Client (e.g., Dio interceptors for auth & logging).
- [x] Setup Local Caching infrastructure (Hive or SQLite).
- [ ] Setup FCM for Push Notifications (Foreground, Background, Killed states).

## Phase 3: Authentication Feature
- [x] **Data:** Auth DataSource, UserModel, AuthRepositoryImpl.
- [x] **Domain:** UserEntity, LoginUseCase, SignupUseCase, AuthRepository Interface.
- [x] **Presentation:** AuthBloc (Events & States), LoginScreen, SignupScreen.

## Phase 4: Main Dashboard & Admin Panels
- [ ] **Data:** Fetch core data.
- [ ] **Domain:** Apply business logic for dashboard.
- [x] **Presentation:** Build dashboard UI with `BlocBuilder` reactive state.
- [x] **Phase 1A:** Admin User Management UI.
- [x] **Phase 1B:** Customer & Site Management UI.
- [ ] **Phase 1C & 1D:** Equipment & Certificate UI.
- [ ] Integrate BLoC for Phase 1A, 1B, 1C, 1D screens.

## Phase 5: Testing & QA
- [ ] Write Unit Tests for UseCases, Repositories, and Blocs (`bloc_test`).
- [ ] Run Integration tests for main user journeys.
- [ ] Verify offline mode and background state handling.
