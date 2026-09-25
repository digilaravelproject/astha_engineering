import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';
import 'package:safecheck_techno/routes/app_routes.dart';

import 'package:safecheck_techno/features/admin/dashboard/presentation/widgets/metric_stat_card.dart';

class EngineerHomeScreen extends StatelessWidget {
  const EngineerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Inspector Portal',
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
              backgroundColor: Colors.teal,
              child: Icon(Icons.engineering, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Tasks Overview',
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
                  title: 'Pending Inspections',
                  value: '12',
                  icon: Icons.pending_actions,
                  color: Colors.orange,
                  onTap: () {},
                ),
                MetricStatCard(
                  title: 'Assigned Sites',
                  value: '5',
                  icon: Icons.location_on,
                  color: Colors.blue,
                  onTap: () {},
                ),
                MetricStatCard(
                  title: 'Completed Today',
                  value: '3',
                  icon: Icons.check_circle,
                  color: Colors.green,
                  onTap: () {},
                ),
                MetricStatCard(
                  title: 'Upcoming Renewals',
                  value: '8',
                  icon: Icons.autorenew,
                  color: Colors.red,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Assignments',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimaryLight,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('View All', style: TextStyle(color: AppColors.primary)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildAssignmentCard(
              'Turbhe MIDC Plant',
              'Chain Pulley Block Inspection',
              'Due: Today, 2:00 PM',
              Colors.orange,
            ),
            _buildAssignmentCard(
              'Pune Manufacturing Unit',
              'EOT Crane Annual Check',
              'Due: Tomorrow, 10:00 AM',
              Colors.blue,
            ),
            _buildAssignmentCard(
              'Mumbai HQ',
              'Lift Renewal Certification',
              'Completed',
              Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssignmentCard(String siteName, String taskName, String status, Color statusColor) {
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
            color: statusColor.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.assignment, color: statusColor),
        ),
        title: Text(
          siteName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              taskName,
              style: TextStyle(color: Colors.grey.shade800, fontSize: 13),
            ),
            const SizedBox(height: 4),
            Text(
              status,
              style: TextStyle(
                color: statusColor, 
                fontSize: 12, 
                fontWeight: FontWeight.w600,
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
