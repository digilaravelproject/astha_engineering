import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';
import 'package:safecheck_techno/routes/app_routes.dart';

import 'package:safecheck_techno/features/admin/dashboard/presentation/widgets/metric_stat_card.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(AppStrings.customerPortal,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black87),
            onPressed: () {
              context.push(Routes.notifications);
            },
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0, left: 8.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.blueGrey,
              child: Icon(Icons.business, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.myInventoryOverview,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.4,
              children: [
                MetricStatCard(
                  title: 'Active Sites',
                  value: '4',
                  icon: Icons.location_on,
                  color: Colors.blue,
                  onTap: () {},
                ),
                MetricStatCard(
                  title: 'Total Equipment',
                  value: '26',
                  icon: Icons.precision_manufacturing,
                  color: Colors.indigo,
                  onTap: () {},
                ),
                MetricStatCard(
                  title: 'Valid Certificates',
                  value: '22',
                  icon: Icons.workspace_premium,
                  color: Colors.green,
                  onTap: () {},
                ),
                MetricStatCard(
                  title: 'Expiring Soon',
                  value: '4',
                  icon: Icons.warning,
                  color: Colors.orange,
                  onTap: () {
                    context.push(Routes.customerRenewals);
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppStrings.recentUpdates,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimaryLight,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(AppStrings.viewAll, style: TextStyle(color: AppColors.primary)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildUpdateCard(
              'Certificate Renewed',
              'EOT Crane (Site: Pune)',
              'Valid till 2027',
              Icons.check_circle,
              Colors.green,
            ),
            _buildUpdateCard(
              'Inspection Scheduled',
              'Chain Pulley Block (Site: Mumbai)',
              'Tomorrow, 10:00 AM',
              Icons.calendar_month,
              Colors.blue,
            ),
            _buildUpdateCard(
              'Renewal Alert',
              'Lift (Site: Turbhe MIDC)',
              'Expires in 15 days',
              Icons.warning,
              Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpdateCard(String title, String subtitle, String trailingText, IconData icon, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(color: Colors.grey.shade800, fontSize: 13),
            ),
            const SizedBox(height: 4),
            Text(
              trailingText,
              style: TextStyle(
                color: Colors.grey.shade600, 
                fontSize: 12, 
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}
