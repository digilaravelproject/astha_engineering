import 'package:astha_engineering/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:astha_engineering/core/theme/app_colors.dart';
import 'package:astha_engineering/routes/app_routes.dart';

class EngineerHistoryScreen extends StatelessWidget {
  const EngineerHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backgroundLight,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(AppStrings.myInspections,
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            labelColor: AppColors.primary,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColors.primary,
            tabs: [
              Tab(text: 'Completed'),
              Tab(text: 'Drafts'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildHistoryList(context, isDraft: false),
            _buildHistoryList(context, isDraft: true),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryList(BuildContext context, {required bool isDraft}) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: isDraft ? 2 : 5,
      itemBuilder: (context, index) {
        return _buildHistoryCard(
          context,
          id: isDraft ? 'DRAFT-${100 + index}' : 'CERT-${1024 + index}',
          customerName: 'Customer $index Ltd',
          equipmentName: 'Forklift Model ${index + 1}',
          date: isDraft ? 'Started 2 hours ago' : 'Completed on 12 Oct 2026',
          isDraft: isDraft,
        );
      },
    );
  }

  Widget _buildHistoryCard(
    BuildContext context, {
    required String id,
    required String customerName,
    required String equipmentName,
    required String date,
    required bool isDraft,
  }) {
    final statusColor = isDraft ? Colors.orange : Colors.green;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: statusColor.withValues(alpha: 0.3), width: 1.5),
      ),
      child: InkWell(
        onTap: () {
          if (!isDraft) {
            context.push(Routes.certificatePreview);
          } else {
            // Navigate back to checklist form
          }
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    id,
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
                      isDraft ? 'In Progress' : 'Passed',
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
                  const Icon(Icons.access_time, size: 14, color: Colors.grey),
                  const SizedBox(width: 6),
                  Text(
                    date,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const Spacer(),
                  if (!isDraft)
                    const Icon(Icons.picture_as_pdf, color: AppColors.primary, size: 20),
                  if (!isDraft)
                    const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
