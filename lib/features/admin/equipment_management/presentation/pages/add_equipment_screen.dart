import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';
import 'package:safecheck_techno/core/widgets/custom_button.dart';
import 'package:safecheck_techno/core/widgets/custom_text_field.dart';
import 'package:safecheck_techno/features/admin/equipment_management/domain/entities/equipment_entity.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/bloc/equipment_form_bloc.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/bloc/equipment_form_event.dart';
import 'package:safecheck_techno/features/admin/equipment_management/presentation/bloc/equipment_form_state.dart';

class AddEquipmentScreen extends StatefulWidget {
  const AddEquipmentScreen({super.key});

  @override
  State<AddEquipmentScreen> createState() => _AddEquipmentScreenState();
}

class _AddEquipmentScreenState extends State<AddEquipmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _shortNameController = TextEditingController();
  final _makeController = TextEditingController();
  final _modelController = TextEditingController();
  final _serialController = TextEditingController();
  final _equipmentNumberController = TextEditingController();
  final _ratedCapacityController = TextEditingController();
  final _swlCapacityController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _remarksController = TextEditingController();

  String _selectedSite = 'MIDC Plant Area 1';
  String _selectedStatus = 'Active';
  bool _isEditMode = false;
  EquipmentEntity? _existingEquipment;

  final List<String> _dummySites = ['MIDC Plant Area 1', 'Sector 5 Factory'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = GoRouterState.of(context).extra;
      if (args != null && args is EquipmentEntity) {
        _isEditMode = true;
        _existingEquipment = args;
        _prefillData(args);
        context.read<EquipmentFormBloc>().add(LoadEquipmentForEdit(args));
      }
    });
  }

  void _prefillData(EquipmentEntity equipment) {
    _nameController.text = equipment.equipmentName;
    _shortNameController.text = equipment.equipmentShortName;
    _makeController.text = equipment.manufacturerMake;
    _modelController.text = equipment.model;
    _serialController.text = equipment.serialNumber;
    _equipmentNumberController.text = equipment.equipmentNumber;
    _ratedCapacityController.text = equipment.ratedCapacity.toString();
    _swlCapacityController.text = equipment.swlCapacity.toString();
    _descriptionController.text = equipment.description ?? '';
    _remarksController.text = equipment.remarks ?? '';
    setState(() {
      _selectedStatus = equipment.status;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _shortNameController.dispose();
    _makeController.dispose();
    _modelController.dispose();
    _serialController.dispose();
    _equipmentNumberController.dispose();
    _ratedCapacityController.dispose();
    _swlCapacityController.dispose();
    _descriptionController.dispose();
    _remarksController.dispose();
    super.dispose();
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
      child: Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87)),
    );
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final equipment = EquipmentEntity(
      id: _existingEquipment?.id ?? '',
      siteId: _selectedSite,
      equipmentName: _nameController.text.trim(),
      equipmentShortName: _shortNameController.text.trim(),
      formType: 'Standard',
      manufacturerMake: _makeController.text.trim(),
      model: _modelController.text.trim(),
      serialNumber: _serialController.text.trim(),
      equipmentNumber: _equipmentNumberController.text.trim(),
      ratedCapacity: double.tryParse(_ratedCapacityController.text) ?? 0.0,
      swlCapacity: double.tryParse(_swlCapacityController.text) ?? 0.0,
      description: _descriptionController.text.trim().isEmpty ? null : _descriptionController.text.trim(),
      status: _selectedStatus,
      remarks: _remarksController.text.trim().isEmpty ? null : _remarksController.text.trim(),
      createdAt: _existingEquipment?.createdAt ?? DateTime.now(),
    );

    context.read<EquipmentFormBloc>().add(SaveEquipment(equipment));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EquipmentFormBloc, EquipmentFormState>(
      listener: (context, state) {
        if (state is EquipmentFormSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.green),
          );
          context.pop(true);
        } else if (state is EquipmentFormError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            _isEditMode ? 'Edit Equipment' : 'Add New Equipment',
            style: const TextStyle(color: AppColors.textPrimaryLight, fontWeight: FontWeight.w700),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
            onPressed: () => context.pop(),
          ),
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildLabel('Select Site / Location *'),
                  DropdownButtonFormField<String>(
                    value: _selectedSite,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.location_on, color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xFFF9FAFB),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade200)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade200)),
                    ),
                    items: _dummySites.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                    onChanged: (val) => setState(() => _selectedSite = val ?? _dummySites.first),
                    validator: (val) => val == null || val.isEmpty ? 'Please select a site' : null,
                  ),
                  _buildLabel('Equipment Name *'),
                  CustomTextField(controller: _nameController, hintText: 'E.g., Chain Pulley Block', prefixIcon: Icons.precision_manufacturing_outlined, validator: (val) => val == null || val.isEmpty ? 'Required' : null),
                  _buildLabel('Equipment Short Name *'),
                  CustomTextField(controller: _shortNameController, hintText: 'E.g., CPB', prefixIcon: Icons.short_text, validator: (val) => val == null || val.isEmpty ? 'Required' : null),
                  _buildLabel('Manufacturer / Make *'),
                  CustomTextField(controller: _makeController, hintText: 'E.g., Demag', prefixIcon: Icons.factory_outlined, validator: (val) => val == null || val.isEmpty ? 'Required' : null),
                  _buildLabel('Model *'),
                  CustomTextField(controller: _modelController, hintText: 'Model Number', prefixIcon: Icons.model_training, validator: (val) => val == null || val.isEmpty ? 'Required' : null),
                  Row(
                    children: [
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        _buildLabel('Serial Number *'),
                        CustomTextField(controller: _serialController, hintText: 'SN-12345', prefixIcon: Icons.numbers, validator: (val) => val == null || val.isEmpty ? 'Required' : null),
                      ])),
                      const SizedBox(width: 16),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        _buildLabel('Equipment No. *'),
                        CustomTextField(controller: _equipmentNumberController, hintText: 'EQ-001', prefixIcon: Icons.tag, validator: (val) => val == null || val.isEmpty ? 'Required' : null),
                      ])),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        _buildLabel('Rated Capacity *'),
                        CustomTextField(controller: _ratedCapacityController, hintText: 'Value', prefixIcon: Icons.scale, keyboardType: TextInputType.number, validator: (val) => val == null || val.isEmpty ? 'Required' : null),
                      ])),
                      const SizedBox(width: 16),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        _buildLabel('SWL / Capacity *'),
                        CustomTextField(controller: _swlCapacityController, hintText: 'Value', prefixIcon: Icons.monitor_weight_outlined, keyboardType: TextInputType.number, validator: (val) => val == null || val.isEmpty ? 'Required' : null),
                      ])),
                    ],
                  ),
                  _buildLabel('Description'),
                  CustomTextField(controller: _descriptionController, hintText: 'Optional', prefixIcon: Icons.description_outlined, maxLines: 2),
                  _buildLabel('Remarks'),
                  CustomTextField(controller: _remarksController, hintText: 'Optional', prefixIcon: Icons.comment_outlined, maxLines: 2),
                  _buildLabel('Status *'),
                  DropdownButtonFormField<String>(
                    value: _selectedStatus,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.toggle_on_outlined, color: Colors.grey),
                      filled: true,
                      fillColor: const Color(0xFFF9FAFB),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade200)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade200)),
                    ),
                    items: ['Active', 'Inactive'].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                    onChanged: (val) => setState(() => _selectedStatus = val ?? 'Active'),
                  ),
                  const SizedBox(height: 32),
                  BlocBuilder<EquipmentFormBloc, EquipmentFormState>(
                    builder: (context, state) {
                      final isLoading = state is EquipmentFormLoading;
                      return Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: isLoading ? null : () => context.pop(),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                side: BorderSide(color: Colors.grey.shade300),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              child: const Text('Cancel', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 2,
                            child: CustomButton(
                              text: isLoading ? 'Saving...' : (_isEditMode ? 'Update Equipment' : 'Save Equipment'),
                              onPressed: isLoading ? null : _onSubmit,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
