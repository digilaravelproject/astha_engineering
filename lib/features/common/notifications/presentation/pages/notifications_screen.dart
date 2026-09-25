import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(AppStrings.notifications,
          style: TextStyle(
            color: AppColors.textPrimaryLight,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => context.pop(),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(AppStrings.markAllAsRead),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 5,
        itemBuilder: (context, index) {
          final isUnread = index < 2;
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: isUnread ? AppColors.primary.withValues(alpha: 0.3) : Colors.grey.shade200,
                width: isUnread ? 1.5 : 1,
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: (isUnread ? AppColors.primary : Colors.grey).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  index % 2 == 0 ? Icons.assignment_turned_in : Icons.warning_amber_rounded,
                  color: isUnread ? AppColors.primary : Colors.grey.shade600,
                ),
              ),
              title: Text(
                index % 2 == 0 ? 'Certificate Generated' : 'Inspection Pending',
                style: TextStyle(
                  fontWeight: isUnread ? FontWeight.bold : FontWeight.w500,
                  fontSize: 16,
                  color: isUnread ? AppColors.textPrimaryLight : Colors.black87,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      index % 2 == 0
                          ? 'Certificate for Equipment CPB-001 has been successfully generated and sent to the customer.'
                          : 'You have a pending inspection for Chakan Warehouse due today.',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${index + 1} hours ago',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              isThreeLine: true,
              onTap: () {
                // Navigate to specific item
              },
            ),
          );
        },
      ),
    );
  }
}
