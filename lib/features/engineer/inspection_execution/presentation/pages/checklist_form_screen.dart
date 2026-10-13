import 'package:astha_engineering/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:astha_engineering/core/theme/app_colors.dart';

class ChecklistFormScreen extends StatefulWidget {
  final String equipmentId;

  const ChecklistFormScreen({
    super.key,
    required this.equipmentId,
  });

  @override
  State<ChecklistFormScreen> createState() => _ChecklistFormScreenState();
}

class _ChecklistFormScreenState extends State<ChecklistFormScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.inspectionForm, style: TextStyle(color: Colors.white, fontSize: 16)),
            Text(
              'Equipment: ${widget.equipmentId}',
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 2) {
            setState(() => _currentStep += 1);
          } else {
            // Submit form
            _showSuccessDialog();
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep -= 1);
          }
        },
        controlsBuilder: (context, details) {
          final isLastStep = _currentStep == 2;
          return Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isLastStep ? Colors.green : AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(isLastStep ? 'Submit & Generate PDF' : 'Next Step'),
                  ),
                ),
                if (_currentStep > 0) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: details.onStepCancel,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(AppStrings.back),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
        steps: [
          Step(
            title: Text(AppStrings.visualInspection, style: TextStyle(fontWeight: FontWeight.bold)),
            content: _buildTestItem('Hooks & Latches condition'),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: Text(AppStrings.loadTesting, style: TextStyle(fontWeight: FontWeight.bold)),
            content: _buildTestItem('SWL (Safe Working Load) Limit Test'),
            isActive: _currentStep >= 1,
            state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: Text(AppStrings.finalRemarksSignature, style: TextStyle(fontWeight: FontWeight.bold)),
            content: Column(
              children: [
                const TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Overall Inspector Remarks',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(AppStrings.drawSignatureHere, style: TextStyle(color: Colors.grey)),
                  ),
                ),
              ],
            ),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }

  Widget _buildTestItem(String testName) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(testName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text(AppStrings.pass, style: TextStyle(color: Colors.green)),
                    value: 'Pass',
                    groupValue: 'Pass', // Mock selected
                    onChanged: (val) {},
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text(AppStrings.fail, style: TextStyle(color: Colors.red)),
                    value: 'Fail',
                    groupValue: 'Pass',
                    onChanged: (val) {},
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt),
              label: Text(AppStrings.uploadEvidencePhoto),
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 64),
            const SizedBox(height: 16),
            Text(AppStrings.inspectionCompleted,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(AppStrings.certificateHasBeenGeneratedAnd,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // close dialog
                  Navigator.pop(context); // back to overview
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(AppStrings.backToDashboard),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
