import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';

class RenewalsMasterScreen extends StatelessWidget {
  const RenewalsMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backgroundLight,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(AppStrings.renewalsMaster,
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black87),
          bottom: const TabBar(
            labelColor: AppColors.primary,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColors.primary,
            tabs: [
              Tab(text: 'Upcoming (30 Days)'),
              Tab(text: 'Expired'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildRenewalsList(context, isExpired: false),
            _buildRenewalsList(context, isExpired: true),
          ],
        ),
      ),
    );
  }

  Widget _buildRenewalsList(BuildContext context, {required bool isExpired}) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 4,
      itemBuilder: (context, index) {
        return _buildRenewalCard(
          context,
          certificateId: 'CERT-${1024 + index}',
          customerName: 'Customer $index Ltd',
          equipmentName: 'Forklift Model ${index + 1}',
          expiryDate: isExpired ? 'Expired 5 days ago' : 'Expires in ${index + 2} days',
          isExpired: isExpired,
        );
      },
    );
  }

  Widget _buildRenewalCard(
    BuildContext context, {
    required String certificateId,
    required String customerName,
    required String equipmentName,
    required String expiryDate,
    required bool isExpired,
  }) {
    final statusColor = isExpired ? Colors.red : Colors.orange;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: statusColor.withValues(alpha: 0.3), width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  certificateId,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    expiryDate,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              equipmentName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.business, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  customerName,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.mail_outline, size: 18),
                    label: Text(AppStrings.sendReminder),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_task, size: 18),
                    label: Text(AppStrings.reschedule),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
