import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astha_engineering/core/theme/app_colors.dart';
import 'package:astha_engineering/core/widgets/labeled_text_field.dart';
import 'package:astha_engineering/core/widgets/labeled_dropdown.dart';
import 'package:astha_engineering/core/widgets/custom_button.dart';
import 'package:astha_engineering/core/widgets/custom_text_field.dart';
import '../controllers/prepare_checklist_controller.dart';

class PrepareChecklistScreen extends GetView<PrepareChecklistController> {
  const PrepareChecklistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC), // Soft modern off-white background
      appBar: AppBar(
        title: const Text(
          'Prepare CheckList',
          style: TextStyle(
            color: AppColors.textPrimaryLight,
            fontWeight: FontWeight.w800,
            fontSize: 18,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: AppColors.textPrimaryLight),
      ),
      body: Obx(() => Stepper(
        type: StepperType.horizontal,
        currentStep: controller.currentStep.value,
        onStepContinue: controller.nextStep,
        onStepCancel: controller.previousStep,
        onStepTapped: (step) => controller.currentStep.value = step,
        physics: const BouncingScrollPhysics(),
        controlsBuilder: (context, details) {
          final isLastStep = controller.currentStep.value == 3;
          return Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Row(
              children: [
                if (controller.currentStep.value > 0) ...[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: details.onStepCancel,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: AppColors.primary),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Back', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
                if (isLastStep)
                  Expanded(
                    child: CustomButton(
                      text: 'SUBMIT CHECKLIST',
                      onPressed: controller.submitForm,
                    ),
                  )
                else
                  Expanded(
                    child: CustomButton(
                      text: 'Continue',
                      onPressed: details.onStepContinue,
                    ),
                  ),
              ],
            ),
          );
        },
        steps: [
          Step(
            title: const Text('Basic', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            content: Padding(padding: const EdgeInsets.only(top: 16), child: _buildBasicDetailsCard()),
            isActive: controller.currentStep.value >= 0,
            state: controller.currentStep.value > 0 ? StepState.complete : StepState.editing,
          ),
          Step(
            title: const Text('Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            content: Padding(padding: const EdgeInsets.only(top: 16), child: _buildEquipmentDetailsSection()),
            isActive: controller.currentStep.value >= 1,
            state: controller.currentStep.value > 1 ? StepState.complete : StepState.editing,
          ),
          Step(
            title: const Text('Checks', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            content: Padding(padding: const EdgeInsets.only(top: 16), child: _buildCheckpointsSection()),
            isActive: controller.currentStep.value >= 2,
            state: controller.currentStep.value > 2 ? StepState.complete : StepState.editing,
          ),
          Step(
            title: const Text('Final', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            content: Padding(padding: const EdgeInsets.only(top: 16), child: _buildTestResultsSection()),
            isActive: controller.currentStep.value >= 3,
            state: controller.currentStep.value == 3 ? StepState.editing : StepState.complete,
          ),
        ],
      )),
    );
  }

  Widget _buildCard({required Widget child, EdgeInsetsGeometry? padding}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(20.0),
        child: child,
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text, {bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
      child: RichText(
        text: TextSpan(
          text: text,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimaryLight,
          ),
          children: [
            if (isRequired)
              const TextSpan(
                text: ' *',
                style: TextStyle(color: AppColors.error, fontSize: 13),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicDetailsCard() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel('Barcode Type'),
          Obx(() => Row(
            children: [
              _buildCustomRadio('Auto', controller.barcodeType),
              const SizedBox(width: 24),
              _buildCustomRadio('Manual', controller.barcodeType),
            ],
          )),
          const SizedBox(height: 16),
          Obx(() => LabeledDropdown<String>(
            label: 'Equipment Name *',
            value: controller.equipmentName.value.isEmpty ? null : controller.equipmentName.value,
            items: controller.equipmentList.map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(fontSize: 14)))).toList(),
            onChanged: (val) {
              if (val != null) controller.onEquipmentChanged(val);
            },
          )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: LabeledTextField(
                  label: 'Barcode *',
                  hintText: 'Enter barcode',
                  onChanged: (val) => controller.barcode.value = val,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: LabeledTextField(
                  label: 'Inspection Date *',
                  hintText: 'DD/MM/YYYY',
                  suffixIcon: Icons.calendar_today_outlined,
                  onChanged: (val) => controller.inspectionDate.value = val,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEquipmentDetailsSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSectionHeader('EQUIPMENT DETAILS', Icons.build_circle_outlined),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red.shade100),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.red.shade400, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Note: Selecting new equipment will refresh and clear values below.',
                          style: TextStyle(color: Colors.red.shade700, fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Obx(() => ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.equipmentParameters.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final param = controller.equipmentParameters[index];
                    return Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            param.name,
                            style: const TextStyle(fontSize: 13, color: AppColors.textPrimaryLight, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  hintText: 'Value',
                                  onChanged: (val) => param.value.value = val,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.error.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.delete_outline, color: AppColors.error, size: 20),
                                  onPressed: () => controller.removeEquipmentParameter(index),
                                  constraints: const BoxConstraints(),
                                  padding: const EdgeInsets.all(8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckpointsSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSectionHeader('CHECKPOINTS', Icons.fact_check_outlined),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() => ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.checkpoints.length,
              separatorBuilder: (_, __) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: Colors.grey.shade200),
              ),
              itemBuilder: (context, index) {
                final cp = controller.checkpoints[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${index + 1}. ${cp.parameter}',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimaryLight),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Observation', style: TextStyle(fontSize: 11, color: Colors.grey)),
                              const SizedBox(height: 4),
                              Obx(() => Row(
                                children: [
                                  _buildCustomRadio('OK', cp.observation),
                                  const SizedBox(width: 16),
                                  _buildCustomRadio('NOT OK', cp.observation, isError: true),
                                ],
                              )),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Rectification', style: TextStyle(fontSize: 11, color: Colors.grey)),
                              const SizedBox(height: 4),
                              CustomTextField(
                                hintText: 'Remarks',
                                onChanged: (val) => cp.rectification.value = val,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildTestResultsSection() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Final Results & Validation',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimaryLight),
          ),
          const SizedBox(height: 16),
          _buildLabel('Type Of Test'),
          Obx(() => Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              _buildCustomRadio('Visual', controller.typeOfTest),
              _buildCustomRadio('Load Test', controller.typeOfTest),
              _buildCustomRadio('Drop Test', controller.typeOfTest),
              _buildCustomRadio('Load & Drop Test', controller.typeOfTest),
            ],
          )),
          _buildLabel('Test Result'),
          Obx(() => Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              _buildCustomRadio('Fit For Use', controller.testResult),
              _buildCustomRadio('Needs Repairs', controller.testResult, isError: true),
              _buildCustomRadio('Unfit For Use', controller.testResult, isError: true),
            ],
          )),
          const SizedBox(height: 24),
          
          LabeledTextField(
            label: 'Load Test Weight',
            hintText: 'NA',
            onChanged: (val) => controller.loadTestWeight.value = val,
          ),
          
          LabeledTextField(
            label: 'Validity In months *',
            hintText: '0',
            onChanged: (val) => controller.validityInMonths.value = val,
          ),
          
          _buildLabel('Validity Type'),
          Obx(() => Wrap(
            spacing: 24,
            runSpacing: 8,
            children: [
              _buildCustomRadio('Day/s', controller.validityType),
              _buildCustomRadio('Month/s', controller.validityType),
            ],
          )),
          const SizedBox(height: 24),
          
          LabeledTextField(
            label: 'Representative Name',
            hintText: 'Representative Name',
            onChanged: (val) => controller.representativeName.value = val,
          ),
          
          Obx(() => LabeledDropdown<String>(
            label: 'Inspection Engineer *',
            value: controller.inspectionEngineer.value.isEmpty ? null : controller.inspectionEngineer.value,
            items: controller.engineersList.map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(fontSize: 14)))).toList(),
            onChanged: (val) {
              if (val != null) controller.inspectionEngineer.value = val;
            },
          )),
          
          LabeledTextField(
            label: 'Representative Email',
            hintText: 'Email',
            onChanged: (val) => controller.representativeEmail.value = val,
          ),
          
          _buildLabel('Representative Sign'),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFFF7FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFCBD5E0), style: BorderStyle.solid),
            ),
            child: Stack(
              children: [
                const Center(child: Text('Draw Signature Here', style: TextStyle(color: Color(0xFFA0AEC0)))),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.redAccent,
                      side: const BorderSide(color: Colors.redAccent),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      visualDensity: VisualDensity.compact,
                    ),
                    child: const Text('Clear', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ],
            ),
          ),
          
          LabeledTextField(
            label: 'Additional Information',
            hintText: 'Any other remarks...',
            maxLines: 3,
            onChanged: (val) => controller.additionalInformation.value = val,
          ),
          
          _buildLabel('Select Inspection Pictures'),
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: const Color(0xFFF7FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFCBD5E0), width: 1.5),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_upload_outlined, color: AppColors.primary, size: 40),
                  const SizedBox(height: 12),
                  const Text('Tap to upload pictures', style: TextStyle(color: AppColors.textPrimaryLight, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 4),
                  const Text('JPG, PNG up to 10MB', style: TextStyle(color: AppColors.textSecondaryLight, fontSize: 12)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Reusable custom components missing in core/widgets/ ---

  Widget _buildCustomRadio(String title, RxString groupValue, {bool isError = false}) {
    return GestureDetector(
      onTap: () => groupValue.value = title,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 18,
            height: 18,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: groupValue.value == title
                    ? (isError ? AppColors.error : AppColors.primary)
                    : const Color(0xFFCBD5E0),
                width: 2,
              ),
            ),
            child: groupValue.value == title
                ? Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isError ? AppColors.error : AppColors.primary,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: groupValue.value == title ? FontWeight.w600 : FontWeight.w500,
              color: groupValue.value == title ? AppColors.textPrimaryLight : AppColors.textSecondaryLight,
            ),
          ),
        ],
      ),
    );
  }
}
