# Architecture Document

## Tech Stack
- **Framework:** Flutter
- **Language:** Dart
- **State Management:** BLoC (flutter_bloc)
- **Local Storage / DB:** Hive / SQLite, SharedPreferences
- **Network / API:** Dio
- **Push Notifications:** Local Notifications

## Clean Architecture Layers

1. **Data Layer (`data/`)**
   - `models/`: Data classes (`fromJson`/`toJson`, `copyWith`). Extends entities.
   - `datasources/`: Raw API/DB calls.
   - `repositories/`: Implements domain repository interfaces, handles errors, and returns `Either` or `Result`.

2. **Domain Layer (`domain/`)**
   - `entities/`: Core business objects (No Flutter/JSON dependencies).
   - `repositories/`: Abstract classes/interfaces.
   - `usecases/`: Executes business rules and calls repository methods.

3. **Presentation Layer (`presentation/`)**
   - `bloc/`: Must contain 3 files strictly per feature: `_bloc.dart`, `_event.dart`, `_state.dart`. Emits states based on events. Calls usecases. No business logic here.
   - `pages/` (or `screens/`): Uses `BlocBuilder` and `BlocConsumer` to react to state changes.
   - `widgets/`: Feature-specific reusable UI pieces.

4. **Core Layer (`core/`)** (Based on Astrology User Project)
   - `constants/`: 
     - `app_constants.dart`, `image_constants.dart`, `dimensions.dart`, `app_strings.dart`, `app_urls.dart`
   - `enums/`: 
     - `data_source.dart`
   - `theme/`: 
     - `app_colors.dart`, `light_theme.dart`, `dark_theme.dart`, `text_theme.dart`, `theme_controller.dart`
   - `utils/`: 
     - `logger.dart`, `custom_toast.dart`, `custom_snackbar.dart`, `app_validators.dart`, `responsive_helper.dart`, `image_picker_helper.dart`
   - `services/`: 
     - `network/` (`api_client.dart`, `api_checker.dart`, `network_info.dart`)
     - `storage/` (`hive_storage.dart`, `shared_prefs.dart`, `token_manger.dart`)
     - `payment/` (`razorpay_service.dart`)
     - `local_notification_service.dart`
   - `widgets/`: 
     - `custom_app_bar.dart`, `custom_button.dart`, `custom_text_field.dart`, `loading_widget.dart`, `shimmer_widget.dart`, `error_screen.dart`, `no_internet_screen.dart`

## Strict Data Flow
`Page (BlocBuilder) → BLoC (flutter_bloc) → Domain (UseCase) → Domain (Repository Interface) → Data (RepositoryImpl) → Data (DataSource) → Model/Entity`

## Directory Structure
```text
lib/
├── core/
│   ├── constants/
│   ├── error/
│   ├── services/
│   ├── theme/
│   ├── utils/
│   └── widgets/
├── features/
│   ├── admin/
│   │   ├── dashboard/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   ├── user_management/
│   │   └── customer_management/
│   ├── engineer/
│   │   ├── inspection/
│   │   └── dashboard/
│   ├── customer/
│   │   └── dashboard/
│   ├── common/
│   │   └── auth/
├── routes/
│   ├── app_routes.dart
│   └── app_router.dart
└── main.dart
```

---

## 4. UI & Loading State Rules
Implement and maintain **4 types of loading states** in the Flutter application:

1. **Full Screen Loading**: 
   - Use when the complete screen/page is loading for the first time.
   - Show a centered loader. Prevent duplicate API calls.
2. **Skeleton Loading**:
   - Use for lists, feeds, cards, profiles, dashboard sections, etc.
   - Show content-shaped placeholders instead of a generic spinner (Use `SkeletonLoadingList`).
3. **Button / Inline Loading**:
   - Use for actions such as Login, Submit, Save, Delete, Upload.
   - Show the loader only on the affected button/component (`CustomButton(isLoading: true)`).
4. **Pull-to-Refresh Loading**:
   - Implement pull-to-refresh on applicable list/feed screens using `RefreshIndicator`.
   - Refresh the data and automatically stop the indicator.
   - Prevent duplicate calls.
