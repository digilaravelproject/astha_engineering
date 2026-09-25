import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';
import 'package:safecheck_techno/core/widgets/custom_button.dart';

class CertificateConfiguratorScreen extends StatelessWidget {
  const CertificateConfiguratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(AppStrings.certificateConfigurator,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.customizeThePdfOutputFor,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 24),
            
            // Header Settings
            _buildSectionHeader('Header Settings'),
            _buildSettingCard(
              title: 'Company Logo',
              subtitle: 'Upload the logo to display at the top',
              trailing: const Icon(Icons.upload_file, color: AppColors.primary),
            ),
            _buildSettingCard(
              title: 'Header Text / Title',
              subtitle: 'e.g. "Report of Thorough Examination"',
              trailing: const Icon(Icons.edit, color: AppColors.primary),
            ),
            
            const SizedBox(height: 24),
            
            // Field Mapping
            _buildSectionHeader('Field Mapping & Layout'),
            _buildSettingCard(
              title: 'Include Equipment Details block',
              subtitle: 'Shows Make, Model, SWL, etc.',
              trailing: Switch(
                value: true,
                onChanged: (v) {},
                activeColor: AppColors.primary,
              ),
            ),
            _buildSettingCard(
              title: 'Include Site/Customer Details',
              subtitle: 'Shows Customer Name, Site Address',
              trailing: Switch(
                value: true,
                onChanged: (v) {},
                activeColor: AppColors.primary,
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Signatures & Footer
            _buildSectionHeader('Signatures & Footer'),
            _buildSettingCard(
              title: 'Inspector Signature Required',
              subtitle: 'Digital signature from engineer',
              trailing: Switch(
                value: true,
                onChanged: (v) {},
                activeColor: AppColors.primary,
              ),
            ),
            _buildSettingCard(
              title: 'Customer Signature Required',
              subtitle: 'Digital signature from client representative',
              trailing: Switch(
                value: true,
                onChanged: (v) {},
                activeColor: AppColors.primary,
              ),
            ),
            _buildSettingCard(
              title: 'Footer Disclaimer Text',
              subtitle: 'Edit the legal text at the bottom',
              trailing: const Icon(Icons.edit, color: AppColors.primary),
            ),
            
            const SizedBox(height: 40),
            CustomButton(
              text: 'Save Configuration',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.visibility),
                label: Text(AppStrings.previewPdfLayout),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
        ),
      ),
    );
  }

  Widget _buildSettingCard({
    required String title,
    required String subtitle,
    required Widget trailing,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
        ),
        trailing: trailing,
        onTap: () {},
      ),
    );
  }
}
