import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';
import 'package:safecheck_techno/core/widgets/custom_button.dart';

class AddCheckpointScreen extends StatefulWidget {
  const AddCheckpointScreen({super.key});

  @override
  State<AddCheckpointScreen> createState() => _AddCheckpointScreenState();
}

class _AddCheckpointScreenState extends State<AddCheckpointScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedType = 'Radio (Pass/Fail/NA)';
  
  final List<String> _fieldTypes = [
    'Radio (Pass/Fail/NA)',
    'Text Input',
    'Number Input',
    'Dropdown (Multiple Choice)',
    'Image Capture',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(AppStrings.addNewParameter,
          style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Basic Information'),
              _buildTextField('Parameter / Checkpoint Name', 'e.g. Check for cracks in wire rope'),
              const SizedBox(height: 16),
              _buildTextField('Equipment Category', 'e.g. Lifting Tools & Tackles'),
              
              const SizedBox(height: 24),
              _buildSectionTitle('Input Configuration'),
              
              Text(AppStrings.dataInputType,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.transparent),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedType,
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    items: _fieldTypes.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedType = newValue!;
                      });
                    },
                  ),
                ),
              ),
              
              if (_selectedType == 'Dropdown (Multiple Choice)') ...[
                const SizedBox(height: 16),
                _buildTextField('Options (Comma separated)', 'e.g. Good, Poor, Broken'),
              ],
              
              const SizedBox(height: 24),
              _buildSectionTitle('Compliance Criteria'),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (v) {},
                    activeColor: AppColors.primary,
                  ),
                  const Expanded(
                    child: Text(AppStrings.thisIsAMandatoryCheckpoint),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (v) {},
                    activeColor: AppColors.primary,
                  ),
                  const Expanded(
                    child: Text(AppStrings.requiresPhotoUploadIfMarked),
                  ),
                ],
              ),
              
              const SizedBox(height: 40),
              CustomButton(
                text: 'Save Checkpoint',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimaryLight,
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            filled: true,
            fillColor: AppColors.backgroundLight,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
        ),
      ],
    );
  }
}
