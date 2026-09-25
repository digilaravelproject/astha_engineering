import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';
import 'package:safecheck_techno/routes/app_routes.dart';
import 'package:safecheck_techno/features/admin/dashboard/presentation/bloc/admin_dashboard_bloc.dart';
import 'package:safecheck_techno/features/admin/dashboard/presentation/bloc/admin_dashboard_event.dart';
import 'package:safecheck_techno/features/admin/dashboard/presentation/bloc/admin_dashboard_state.dart';
import 'package:safecheck_techno/features/admin/dashboard/presentation/widgets/metric_stat_card.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {

  @override
  void initState() {
    super.initState();
    context.read<AdminDashboardBloc>().add(LoadAdminDashboardData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'SafeCheck Techno',
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
          Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 8.0),
            child: const CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
      body: BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
        builder: (context, state) {
          if (state is AdminDashboardLoading) {
            return const Center(child: CircularProgressIndicator(color: AppColors.primary));
          } else if (state is AdminDashboardLoaded) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dashboard Overview',
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
                        title: 'Total Customers',
                        value: state.totalCustomers.toString(),
                        icon: Icons.business,
                        color: Colors.blue,
                        onTap: () => context.go(Routes.manageCustomers),
                      ),
                      MetricStatCard(
                        title: 'Total Sites',
                        value: state.totalSites.toString(),
                        icon: Icons.location_on,
                        color: Colors.orange,
                        onTap: () => context.go(Routes.manageSites),
                      ),
                      MetricStatCard(
                        title: 'Total Users',
                        value: state.totalUsers.toString(),
                        icon: Icons.group,
                        color: Colors.purple,
                        onTap: () => context.go(Routes.manageUsers),
                      ),
                      MetricStatCard(
                        title: 'Engineers',
                        value: state.totalEngineers.toString(),
                        icon: Icons.engineering,
                        color: Colors.teal,
                      ),
                      MetricStatCard(
                        title: 'Equipment',
                        value: state.totalEquipment.toString(),
                        icon: Icons.precision_manufacturing,
                        color: Colors.indigo,
                        onTap: () => context.push(Routes.manageEquipment), // Not a tab, so push is fine
                      ),
                      MetricStatCard(
                        title: 'Certificates',
                        value: state.totalCertificates.toString(),
                        icon: Icons.workspace_premium,
                        color: Colors.green,
                        onTap: () => context.push(Routes.manageCertificates), // Not a tab, so push is fine
                      ),
                      MetricStatCard(
                        title: 'Inspections',
                        value: state.totalInspections.toString(),
                        icon: Icons.fact_check,
                        color: Colors.lightBlue,
                      ),
                      MetricStatCard(
                        title: 'Renewals Pending',
                        value: state.renewalsPending.toString(),
                        icon: Icons.autorenew,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Recent Feed',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimaryLight,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildRecentFeedItem('Certificate Generated', 'SCTS/092026/0012 created for Turbhe MIDC.', Icons.description, Colors.green),
                  _buildRecentFeedItem('Inspection Completed', 'Chain Pulley Block at Pune Plant by Tushar.', Icons.check_circle, Colors.blue),
                  _buildRecentFeedItem('Renewal Alert', 'EOT Crane at Mumbai HQ due in 15 days.', Icons.warning, Colors.orange),
                ],
              ),
            );
          } else if (state is AdminDashboardError) {
            return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildRecentFeedItem(String title, String subtitle, IconData icon, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
        ),
      ),
    );
  }
}
