import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:astha_engineering/core/theme/app_colors.dart';
import 'package:astha_engineering/routes/app_routes.dart';
import '../controllers/manage_checklist_controller.dart';

class ManageChecklistScreen extends GetView<ManageChecklistController> {
  const ManageChecklistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text(
          'Manage CheckList',
          style: TextStyle(
            color: AppColors.textPrimaryLight,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Back', style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Filters Section
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
                    children: [
                      // Site Name Dropdown mock
                      Row(
                        children: [
                          const Text('Site Name ', style: TextStyle(color: Colors.grey, fontSize: 12)),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Obx(() => Text(controller.siteName.value, style: const TextStyle(fontSize: 14))),
                                  const Icon(Icons.arrow_drop_down, color: Colors.grey),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(child: _buildTextField('CheckList Number')),
                          const SizedBox(width: 8),
                          Expanded(child: _buildTextField('Barcode')),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(child: _buildTextField('Equipment Name')),
                          const SizedBox(width: 8),
                          Expanded(child: _buildTextField('Inspection Engineer')),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Obx(() => Radio(
                                value: true,
                                groupValue: controller.isActive.value,
                                onChanged: (val) => controller.isActive.value = val as bool,
                                visualDensity: VisualDensity.compact,
                              )),
                              const Text('Active', style: TextStyle(fontSize: 12)),
                              Obx(() => Radio(
                                value: false,
                                groupValue: controller.isActive.value,
                                onChanged: (val) => controller.isActive.value = val as bool,
                                visualDensity: VisualDensity.compact,
                              )),
                              const Text('De-Active', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(4)),
                                child: IconButton(
                                  icon: const Icon(Icons.search, color: Colors.white, size: 20),
                                  onPressed: controller.search,
                                  constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Container(
                                decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4)),
                                child: IconButton(
                                  icon: const Icon(Icons.refresh, color: Colors.white, size: 20),
                                  onPressed: controller.reset,
                                  constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Container(
                                decoration: BoxDecoration(color: Colors.green.shade700, borderRadius: BorderRadius.circular(4)),
                                child: IconButton(
                                  icon: const Icon(Icons.add, color: Colors.white, size: 20),
                                  onPressed: controller.addChecklist,
                                  constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Data Table Section
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(() {
                    return DataTable(
                      headingRowColor: WidgetStateProperty.all(Colors.grey.shade100),
                      columnSpacing: 20,
                      columns: const [
                        DataColumn(label: Text('CheckList Number', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                        DataColumn(label: Text('Barcode', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                        DataColumn(label: Text('Barcode Type', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                        DataColumn(label: Text('Equipment Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                        DataColumn(label: Text('Inspection Date', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                        DataColumn(label: Text('Valid Till Date', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                        DataColumn(label: Text('Inspection Engineer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                        DataColumn(label: Text('Action', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                      ],
                      rows: controller.checklists.map((item) {
                        return DataRow(
                          cells: [
                            DataCell(Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                                    child: const Icon(Icons.remove, size: 10, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(item.checklistNumber, style: const TextStyle(color: Colors.blue, fontSize: 12)),
                              ],
                            )),
                            DataCell(Text(item.barcode, style: const TextStyle(fontSize: 12))),
                            DataCell(Text(item.barcodeType, style: const TextStyle(fontSize: 12))),
                            DataCell(Text(item.equipmentName, style: const TextStyle(fontSize: 12))),
                            DataCell(Text(item.inspectionDate, style: const TextStyle(fontSize: 12))),
                            DataCell(Text(item.validTillDate, style: const TextStyle(fontSize: 12))),
                            DataCell(Text(item.inspectionEngineer, style: const TextStyle(fontSize: 12))),
                            DataCell(Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildActionIcon(
                                  Icons.list_alt,
                                  Colors.grey,
                                  onTap: () => context.push(Routes.viewChecklist, extra: item),
                                ),
                                const SizedBox(width: 4),
                                _buildActionIcon(
                                  Icons.insert_drive_file,
                                  Colors.black87,
                                  onTap: () => _showCertificateTypeDialog(context),
                                ),
                                const SizedBox(width: 4),
                                _buildActionIcon(
                                  Icons.copy,
                                  Colors.green,
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(text: item.checklistNumber));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Checklist ${item.checklistNumber} copied to clipboard', style: const TextStyle(color: Colors.white)),
                                        backgroundColor: Colors.black87,
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(width: 4),
                                _buildActionIcon(
                                  Icons.edit,
                                  Colors.blue,
                                  onTap: () => context.push(Routes.prepareChecklist, extra: item),
                                ),
                              ],
                            )),
                          ],
                        );
                      }).toList(),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Showing 1 - 10 of 10 entries', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          isDense: true,
        ),
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, Color color, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, size: 16, color: color),
      ),
    );
  }

  void _showCertificateTypeDialog(BuildContext context) {
    final certificateType = 'Sign & Stamp'.obs;
    
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          padding: const EdgeInsets.all(24),
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Certificate Type',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 24),
              const Text(
                'Certificate Type',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Obx(() => Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio<String>(
                        value: 'Sign & Stamp',
                        groupValue: certificateType.value,
                        onChanged: (val) => certificateType.value = val!,
                        activeColor: AppColors.primary,
                      ),
                      const Text('Sign & Stamp', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio<String>(
                        value: 'No Sign & Stamp',
                        groupValue: certificateType.value,
                        onChanged: (val) => certificateType.value = val!,
                        activeColor: AppColors.primary,
                      ),
                      const Text('No Sign & Stamp', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              )),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  context.pop();
                  // Handle print/download logic here based on certificateType.value
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6), // Using blue color as seen in the image for Generate
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text('Generate', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
