import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';
import 'package:safecheck_techno/routes/app_routes.dart';

class EquipmentDetailsScreen extends StatelessWidget {
  const EquipmentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(AppStrings.equipmentDetails,
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
          IconButton(
            icon: const Icon(Icons.edit, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Info
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'EOT Crane 5 Ton',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimaryLight,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.location_city, size: 16, color: Colors.grey),
                      SizedBox(width: 8),
                      Text(AppStrings.makeDemagModelX, style: TextStyle(color: Colors.black87)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.grey),
                      SizedBox(width: 8),
                      Expanded(child: Text('MIDC Plant Area 1 (Tech Innovations)', style: TextStyle(color: Colors.grey))),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppStrings.status1, style: TextStyle(fontSize: 12, color: Colors.black54)),
                              SizedBox(height: 4),
                              Text('Active', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.orange.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppStrings.nextInspection, style: TextStyle(fontSize: 12, color: Colors.black54)),
                              SizedBox(height: 4),
                              Text('12 Oct 2026', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            
            const SizedBox(height: 16),

            // Certificates Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppStrings.recentCertificates,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimaryLight,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(Routes.manageCertificates);
                    },
                    child: Text(AppStrings.viewAll, style: TextStyle(color: AppColors.primary)),
                  ),
                ],
              ),
            ),
            
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: 2,
              itemBuilder: (context, index) {
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
                        color: Colors.red.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.picture_as_pdf, color: Colors.red),
                    ),
                    title: Text(
                      'Certificate 202${5-index}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Issued: 12 Oct 202${5-index}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.download, color: AppColors.primary),
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
