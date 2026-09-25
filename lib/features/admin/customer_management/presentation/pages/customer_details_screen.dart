import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';
import 'package:safecheck_techno/routes/app_routes.dart';

class CustomerDetailsScreen extends StatelessWidget {
  const CustomerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(AppStrings.customerDetails,
          style: TextStyle(
            color: AppColors.textPrimaryLight,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Customer Header Info
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text(
                        'T',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(AppStrings.techInnovationsPvtLtd,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimaryLight,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email, size: 14, color: Colors.grey),
                      SizedBox(width: 6),
                      Text(AppStrings.contacttechinnovationscom, style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone, size: 14, color: Colors.grey),
                      SizedBox(width: 6),
                      Text('+91 9876543210', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),

            // Customer Sites Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppStrings.associatedSites,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimaryLight,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      context.push(Routes.addSite);
                    },
                    icon: const Icon(Icons.add, size: 18, color: AppColors.primary),
                    label: Text(AppStrings.addSite,
                      style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            
            // Sites List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              itemCount: 3,
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
                        color: Colors.blue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.business_center, color: Colors.blue),
                    ),
                    title: Text(
                      'Site Location ${index + 1}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('MIDC Industrial Area, Block ${String.fromCharCode(65 + index)}'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // context.push(Routes.siteDetails);
                    },
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
