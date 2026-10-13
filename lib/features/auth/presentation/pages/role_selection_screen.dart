import 'package:astha_engineering/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:astha_engineering/core/constants/app_constants.dart';
import 'package:astha_engineering/core/enums/user_role.dart';
import 'package:astha_engineering/core/theme/app_colors.dart';
import 'package:astha_engineering/routes/app_routes.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(AppStrings.selectRoleToTest,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(AppStrings.thisScreenIsForDevelopment,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 48),
                _buildRoleButton(
                  context,
                  title: 'Admin Portal',
                  icon: Icons.admin_panel_settings,
                  color: Colors.blueAccent,
                  role: UserRole.admin,
                  route: Routes.adminDashboard,
                ),
                const SizedBox(height: 16),
                _buildRoleButton(
                  context,
                  title: 'Inspection Engineer',
                  icon: Icons.engineering,
                  color: Colors.orangeAccent,
                  role: UserRole.inspectionEngineer,
                  route: Routes.engineerDashboard,
                ),
                const SizedBox(height: 16),
                _buildRoleButton(
                  context,
                  title: 'Customer Portal',
                  icon: Icons.business,
                  color: Colors.green,
                  role: UserRole.customer,
                  route: Routes.customerDashboard,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required UserRole role,
    required String route,
  }) {
    return ElevatedButton(
      onPressed: () {
        AppConstants.currentTestRole = role;
        context.go(route);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: color.withValues(alpha: 0.5), width: 1.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: color, size: 16),
        ],
      ),
    );
  }
}
