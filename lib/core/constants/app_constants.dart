import 'package:safecheck_techno/core/enums/user_role.dart';
import 'package:safecheck_techno/routes/app_routes.dart';

class AppConstants {
  static const String appName = 'SafeCheck Techno';
  static const String appVersion = '1.0.0';
  static const String fontFamily = 'Inter'; 
  
  // Storage keys
  static const String themeKey = 'theme_mode';
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';

  // Role for Testing UI
  static UserRole currentTestRole = UserRole.admin;

  // Navigation
  static String get defaultDashboardRoute {
    switch (currentTestRole) {
      case UserRole.admin:
        return Routes.adminDashboard;
      case UserRole.inspectionEngineer:
        return Routes.engineerDashboard;
      case UserRole.customer:
        return Routes.customerDashboard;
    }
  }
}
