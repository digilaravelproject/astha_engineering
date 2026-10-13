import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:astha_engineering/core/theme/app_colors.dart';
import 'package:astha_engineering/features/admin/tracker_management/presentation/controllers/manage_checklist_controller.dart';

class ViewChecklistScreen extends StatelessWidget {
  const ViewChecklistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = GoRouterState.of(context).extra;
    final item = args is CheckListModel ? args : null;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Text(item != null ? 'View CheckList: ${item.checklistNumber}' : 'View CheckList', style: const TextStyle(color: AppColors.textPrimaryLight, fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: item == null 
        ? const Center(child: Text('No details available', style: TextStyle(color: Colors.grey)))
        : SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildInfoCard(
                  title: 'Basic Information',
                  icon: Icons.info_outline,
                  children: [
                    _buildDetailRow('Checklist Number', item.checklistNumber),
                    _buildDetailRow('Barcode', item.barcode),
                    _buildDetailRow('Barcode Type', item.barcodeType),
                    _buildDetailRow('Equipment Name', item.equipmentName),
                  ]
                ),
                const SizedBox(height: 16),
                _buildInfoCard(
                  title: 'Inspection Details',
                  icon: Icons.fact_check_outlined,
                  children: [
                    _buildDetailRow('Inspection Date', item.inspectionDate),
                    _buildDetailRow('Valid Till Date', item.validTillDate),
                    _buildDetailRow('Inspection Engineer', item.inspectionEngineer),
                  ]
                ),
                const SizedBox(height: 16),
                _buildInfoCard(
                  title: 'Status',
                  icon: Icons.check_circle_outline,
                  children: [
                    _buildDetailRow('Current Status', 'Active', valueColor: Colors.green),
                  ]
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildInfoCard({required String title, required IconData icon, required List<Widget> children}) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.primary, size: 20),
                const SizedBox(width: 8),
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight)),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Divider(height: 1),
            ),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(fontSize: 14, color: valueColor ?? Colors.black87, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
