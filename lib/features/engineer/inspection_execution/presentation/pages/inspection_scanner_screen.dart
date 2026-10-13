import 'package:astha_engineering/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:astha_engineering/core/theme/app_colors.dart';
import 'package:astha_engineering/routes/app_routes.dart';

class InspectionScannerScreen extends StatelessWidget {
  const InspectionScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(AppStrings.scanEquipment,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          // Simulated Camera Preview
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.qr_code_scanner, color: Colors.white54, size: 64),
                    SizedBox(height: 16),
                    Text(AppStrings.alignQrCodeWithinFrame,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Bottom Controls
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(AppStrings.havingTroubleScanning,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: () {
                      _showManualEntryDialog(context);
                    },
                    icon: const Icon(Icons.keyboard),
                    label: Text(AppStrings.enterEquipmentIdManually),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Simulate successful scan
                      context.pushReplacementNamed(
                        Routes.engineerChecklistForm.substring(1),
                        extra: 'CPB-001', // Passing mock equipment ID
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(AppStrings.simulateScanSuccessDev),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showManualEntryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppStrings.manualEntry),
        content: const TextField(
          decoration: InputDecoration(
            hintText: 'e.g. CPB-001',
            labelText: 'Equipment ID',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.pushReplacementNamed(
                Routes.engineerChecklistForm.substring(1),
                extra: 'CPB-001',
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
            child: Text(AppStrings.proceed),
          ),
        ],
      ),
    );
  }
}
