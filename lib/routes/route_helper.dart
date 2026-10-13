import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:astha_engineering/routes/app_routes.dart';
import 'package:astha_engineering/routes/modules/admin_routes.dart';
import 'package:astha_engineering/routes/modules/auth_routes.dart';
import 'package:astha_engineering/routes/modules/common_routes.dart';
import 'package:astha_engineering/routes/modules/customer_routes.dart';
import 'package:astha_engineering/routes/modules/engineer_routes.dart';

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
