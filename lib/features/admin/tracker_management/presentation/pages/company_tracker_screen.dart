import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astha_engineering/core/theme/app_colors.dart';
import '../controllers/company_tracker_controller.dart';

class CompanyTrackerScreen extends GetView<CompanyTrackerController> {
  const CompanyTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text(
          'Manage Tracker - Company',
          style: TextStyle(
            color: AppColors.textPrimaryLight,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text(
                  controller.companyName.value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimaryLight,
                  ),
                )),
            const SizedBox(height: 16),
            
            // Site Details Card
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Site Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        TextButton(
                          onPressed: controller.onSearchSite,
                          child: const Text('Search Site',
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 8),
                    Obx(() => Text(
                          controller.siteName.value,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        )),
                    const SizedBox(height: 4),
                    Obx(() => Text(
                          controller.address.value,
                          style: TextStyle(color: Colors.grey.shade700),
                        )),
                    const SizedBox(height: 4),
                    Obx(() => Text(
                          controller.email.value,
                          style: TextStyle(color: Colors.grey.shade700),
                        )),
                    const SizedBox(height: 4),
                    Obx(() => Text(
                          controller.phone.value,
                          style: TextStyle(color: Colors.grey.shade700),
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Company Matters Section
            const Text(
              'Company Matters',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: 12),
            
            // Input Section
            _buildActionSection(
              title: 'Input',
              actions: [
                'Prepare CheckList',
                'Manage Certificates',
                'Set Default Employer',
              ],
            ),
            const SizedBox(height: 16),
            
            // Output Section
            _buildActionSection(
              title: 'Output',
              actions: [
                'Certificate Excel Report',
                'Download Certificates (ZIP)',
                'Exception Report',
                'User Activity Report',
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionSection(
      {required String title, required List<String> actions}) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      color: Colors.grey.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const Divider(),
            ...actions.map((action) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: InkWell(
                    onTap: () => controller.onActionSelected(action),
                    child: Row(
                      children: [
                        const Icon(Icons.circle, size: 6, color: Colors.blue),
                        const SizedBox(width: 8),
                        Text(
                          action,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
