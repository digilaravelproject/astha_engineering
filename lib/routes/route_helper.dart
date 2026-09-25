import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/routes/app_routes.dart';
import 'package:safecheck_techno/routes/modules/admin_routes.dart';
import 'package:safecheck_techno/routes/modules/auth_routes.dart';
import 'package:safecheck_techno/routes/modules/common_routes.dart';
import 'package:safecheck_techno/routes/modules/customer_routes.dart';
import 'package:safecheck_techno/routes/modules/engineer_routes.dart';

class RouteHelper {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: Routes.splash,
    routes: [
      ...AuthRoutes.routes,
      ...AdminRoutes.routes,
      ...CustomerRoutes.routes,
      ...EngineerRoutes.routes,
      ...CommonRoutes.routes,
    ],
  );
}
