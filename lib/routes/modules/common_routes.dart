import 'package:go_router/go_router.dart';
import 'package:astha_engineering/routes/app_routes.dart';
import 'package:astha_engineering/features/common/notifications/presentation/pages/notifications_screen.dart';
import 'package:astha_engineering/features/common/profile/presentation/pages/profile_screen.dart';
import 'package:astha_engineering/features/common/webview/presentation/pages/webview_screen.dart';

class CommonRoutes {
  static List<RouteBase> get routes => [
        GoRoute(
          path: Routes.profile,
          name: Routes.profile.substring(1),
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: Routes.notifications,
          builder: (context, state) => const NotificationsScreen(),
        ),
        GoRoute(
          path: Routes.webview,
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>? ?? {};
            final title = extra['title'] as String? ?? 'Webview';
            final endpoint = extra['endpoint'] as String? ?? '';
            return WebviewScreen(title: title, endpoint: endpoint);
          },
        ),
      ];
}
