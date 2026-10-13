import 'package:astha_engineering/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:astha_engineering/core/constants/app_constants.dart';
import 'package:astha_engineering/core/enums/user_role.dart';
import 'package:astha_engineering/core/theme/app_colors.dart';
import 'package:astha_engineering/routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(AppStrings.profileSettings,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Header
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
                const SizedBox(height: 16),
                Text(AppStrings.johnDoe,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _getRoleName(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 4),
                Text(AppStrings.johndoeexamplecom,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Settings Options
          Text(AppStrings.preferences,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          _buildSettingsTile(Icons.language, 'Language', 'English'),
          _buildSettingsTile(Icons.notifications_outlined, 'Notifications', 'Enabled'),
          _buildSettingsTile(Icons.security, 'Security & Password', null),
          
          const SizedBox(height: 24),
          Text(AppStrings.about,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          _buildSettingsTile(Icons.help_outline, 'Help & Support', null),
          _buildSettingsTile(Icons.info_outline, 'Terms & Conditions', null),

          const SizedBox(height: 32),
          
          // Logout Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                context.go(Routes.login);
              },
              icon: const Icon(Icons.logout, color: Colors.redAccent),
              label: Text(AppStrings.logOut, style: TextStyle(color: Colors.redAccent)),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: const BorderSide(color: Colors.redAccent),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Center(
            child: Text(
              'Version 1.0.0',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  String _getRoleName() {
    switch (AppConstants.currentTestRole) {
      case UserRole.admin:
        return 'System Administrator';
      case UserRole.inspectionEngineer:
        return 'Inspection Engineer';
      case UserRole.customer:
        return 'Customer Portal Access';
    }
  }

  Widget _buildSettingsTile(IconData icon, String title, String? trailingText) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: trailingText != null
            ? Text(trailingText, style: const TextStyle(color: Colors.grey))
            : const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}
