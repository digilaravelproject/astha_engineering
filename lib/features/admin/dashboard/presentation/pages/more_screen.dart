import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';
import 'package:safecheck_techno/routes/app_routes.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Master Configurations', style: TextStyle(color: AppColors.textPrimaryLight, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildMenuCard(
            context,
            icon: Icons.checklist,
            title: 'Dynamic Parameters & Checkpoints',
            subtitle: 'Configure inspection fields and requirements',
            onTap: () => context.push(Routes.checkpoints),
          ),
          _buildMenuCard(
            context,
            icon: Icons.picture_as_pdf,
            title: 'Certificate Template Configurator',
            subtitle: 'Design output certificate layouts',
            onTap: () => context.push(Routes.certificateConfigurator),
          ),
          _buildMenuCard(
            context,
            icon: Icons.event_repeat,
            title: 'Renewals Master',
            subtitle: 'Manage upcoming and expired certificates',
            onTap: () => context.push(Routes.renewalsMaster),
          ),
          _buildMenuCard(
            context,
            icon: Icons.bar_chart,
            title: 'Reports & Analytics',
            subtitle: 'View system-wide inspection data',
            onTap: () => context.push(Routes.reportsMaster),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, {required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
