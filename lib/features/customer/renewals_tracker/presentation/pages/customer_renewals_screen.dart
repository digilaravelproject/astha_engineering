import 'package:astha_engineering/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:astha_engineering/core/theme/app_colors.dart';
import 'package:astha_engineering/core/widgets/custom_button.dart';

class CustomerRenewalsScreen extends StatelessWidget {
  const CustomerRenewalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(AppStrings.renewalsRequests,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 4,
        itemBuilder: (context, index) {
          final isExpired = index == 0;
          final isRequested = index == 1;
          
          return _buildCustomerRenewalCard(
            context,
            equipmentId: 'EQ-${4320 + index}',
            equipmentName: 'Hydraulic Press Model ${index + 1}',
            siteName: 'Plant Alpha, Pune',
            expiryDate: isExpired ? 'Expired 10 days ago' : 'Expires in ${index * 15 + 5} days',
            isExpired: isExpired,
            isRequested: isRequested,
          );
        },
      ),
    );
  }

  Widget _buildCustomerRenewalCard(
    BuildContext context, {
    required String equipmentId,
    required String equipmentName,
    required String siteName,
    required String expiryDate,
    required bool isExpired,
    required bool isRequested,
  }) {
    final statusColor = isExpired ? Colors.red : Colors.orange;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: isRequested ? Colors.green.shade200 : statusColor.withValues(alpha: 0.3), width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    equipmentId,
                    style: const TextStyle(
                      color: AppColors.accent,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isRequested ? Colors.green.withValues(alpha: 0.1) : statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    isRequested ? 'Request Sent' : expiryDate,
                    style: TextStyle(
                      color: isRequested ? Colors.green : statusColor,
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
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(
                  siteName,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (!isRequested)
              CustomButton(
                text: 'Request Re-inspection',
                onPressed: () {
                  _showRequestModal(context, equipmentName);
                },
                // Assuming we want a slightly different style, but CustomButton is standard.
              )
            else
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 20),
                    SizedBox(width: 8),
                    Text(AppStrings.ourTeamWillContactYou,
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showRequestModal(BuildContext context, String equipmentName) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          top: 24,
          left: 24,
          right: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.requestInspection,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'for $equipmentName',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 24),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: AppStrings.anySpecificPreferredDateOr,
                filled: true,
                fillColor: AppColors.backgroundLight,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Confirm Request',
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(AppStrings.reinspectionRequestSubmittedSuccessfully)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
