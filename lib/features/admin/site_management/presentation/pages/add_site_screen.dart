import 'package:astha_engineering/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:astha_engineering/core/theme/app_colors.dart';
import 'package:astha_engineering/core/widgets/custom_button.dart';
import 'package:astha_engineering/core/widgets/custom_text_field.dart';
import 'package:astha_engineering/features/admin/site_management/domain/entities/site_entity.dart';
import 'package:astha_engineering/features/admin/site_management/presentation/bloc/site_form_bloc.dart';
import 'package:astha_engineering/features/admin/site_management/presentation/bloc/site_form_event.dart';
import 'package:astha_engineering/features/admin/site_management/presentation/bloc/site_form_state.dart';

class AddSiteScreen extends StatefulWidget {
  const AddSiteScreen({super.key});

  @override
  State<AddSiteScreen> createState() => _AddSiteScreenState();
}

class _AddSiteScreenState extends State<AddSiteScreen> {
  final _formKey = GlobalKey<FormState>();
  final _siteNameController = TextEditingController();
  final _flatBlockController = TextEditingController();
  final _buildingPremisesController = TextEditingController();
  final _streetLaneController = TextEditingController();
  final _areaLocalityController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _additionalContactController = TextEditingController();

  String _selectedCustomer = 'Tech Innovations Pvt. Ltd';
  String _selectedStatus = 'Active';
  bool _isEditMode = false;
  SiteEntity? _existingSite;

  final List<String> _dummyCustomers = [
    'Tech Innovations Pvt. Ltd',
    'Global Corp',
    'Alpha Industries'
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = GoRouterState.of(context).extra;
      if (args != null && args is SiteEntity) {
        _isEditMode = true;
        _existingSite = args;
        _prefillData(args);
        context.read<SiteFormBloc>().add(LoadSiteForEdit(args));
      }
    });
  }

  void _prefillData(SiteEntity site) {
    _siteNameController.text = site.siteName;
    _flatBlockController.text = site.flatBlockNo ?? '';
    _buildingPremisesController.text = site.buildingPremises ?? '';
    _streetLaneController.text = site.streetLane ?? '';
    _areaLocalityController.text = site.areaLocality ?? '';
    _pincodeController.text = site.pincode ?? '';
    _emailController.text = site.email ?? '';
    _phoneNumberController.text = site.phoneNumber ?? '';
    _mobileNumberController.text = site.mobileNumber ?? '';
    _additionalContactController.text = site.additionalContactDetails ?? '';
    setState(() {
      _selectedStatus = site.status;
    });
  }

  @override
  void dispose() {
    _siteNameController.dispose();
    _flatBlockController.dispose();
    _buildingPremisesController.dispose();
    _streetLaneController.dispose();
    _areaLocalityController.dispose();
    _pincodeController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _mobileNumberController.dispose();
    _additionalContactController.dispose();
    super.dispose();
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
    );
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final site = SiteEntity(
      id: _existingSite?.id ?? '',
      customerId: _selectedCustomer,
      siteName: _siteNameController.text.trim(),
      flatBlockNo: _flatBlockController.text.trim().isEmpty ? null : _flatBlockController.text.trim(),
      buildingPremises: _buildingPremisesController.text.trim().isEmpty ? null : _buildingPremisesController.text.trim(),
      streetLane: _streetLaneController.text.trim().isEmpty ? null : _streetLaneController.text.trim(),
      areaLocality: _areaLocalityController.text.trim().isEmpty ? null : _areaLocalityController.text.trim(),
      country: 'India',
      state: 'Maharashtra',
      cityDistrict: 'Mumbai',
      pincode: _pincodeController.text.trim().isEmpty ? null : _pincodeController.text.trim(),
      email: _emailController.text.trim().isEmpty ? null : _emailController.text.trim(),
      phoneNumber: _phoneNumberController.text.trim().isEmpty ? null : _phoneNumberController.text.trim(),
      mobileNumber: _mobileNumberController.text.trim().isEmpty ? null : _mobileNumberController.text.trim(),
      additionalContactDetails: _additionalContactController.text.trim().isEmpty ? null : _additionalContactController.text.trim(),
      status: _selectedStatus,
      createdAt: _existingSite?.createdAt ?? DateTime.now(),
    );

    context.read<SiteFormBloc>().add(SaveSite(site));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SiteFormBloc, SiteFormState>(
      listener: (context, state) {
        if (state is SiteFormSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.green),
          );
          context.pop(true);
        } else if (state is SiteFormError) {
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
            _isEditMode ? 'Edit Site' : 'Add New Site',
            style: const TextStyle(
              color: AppColors.textPrimaryLight,
              fontWeight: FontWeight.w700,
            ),
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
                  _buildLabel(AppStrings.selectCustomer),
                  DropdownButtonFormField<String>(
                    value: _selectedCustomer,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.business, color: Colors.grey),
                      filled: true,
                      fillColor: AppColors.inputFillColor,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade200)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade200)),
                    ),
                    hint: const Text('Choose a customer'),
                    items: _dummyCustomers.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                    onChanged: (val) => setState(() => _selectedCustomer = val ?? _dummyCustomers.first),
                    validator: (val) => val == null || val.isEmpty ? 'Please select a customer' : null,
                  ),
                  _buildLabel(AppStrings.siteName),
                  CustomTextField(
                    controller: _siteNameController,
                    hintText: 'E.g., MIDC Plant, Warehouse 1',
                    prefixIcon: Icons.location_city,
                    validator: (val) => val == null || val.isEmpty ? 'Site name is required' : null,
                  ),
                  _buildLabel(AppStrings.flatDoorBlockNo),
                  CustomTextField(controller: _flatBlockController, hintText: AppStrings.asApplicable, prefixIcon: Icons.meeting_room_outlined),
                  _buildLabel(AppStrings.buildingPremises),
                  CustomTextField(controller: _buildingPremisesController, hintText: AppStrings.asApplicable, prefixIcon: Icons.apartment),
                  _buildLabel(AppStrings.roadStreetLane),
                  CustomTextField(controller: _streetLaneController, hintText: AppStrings.asApplicable, prefixIcon: Icons.add_road),
                  _buildLabel(AppStrings.areaLocality),
                  CustomTextField(controller: _areaLocalityController, hintText: AppStrings.asApplicable, prefixIcon: Icons.map),
                  _buildLabel(AppStrings.pincode),
                  CustomTextField(controller: _pincodeController, hintText: AppStrings.asApplicable, prefixIcon: Icons.pin_drop_outlined, keyboardType: TextInputType.number),
                  _buildLabel('Email'),
                  CustomTextField(controller: _emailController, hintText: AppStrings.asApplicable, prefixIcon: Icons.email_outlined, keyboardType: TextInputType.emailAddress),
                  _buildLabel(AppStrings.phoneNumber),
                  CustomTextField(controller: _phoneNumberController, hintText: AppStrings.asApplicable, prefixIcon: Icons.phone, keyboardType: TextInputType.phone),
                  _buildLabel(AppStrings.mobileNumber1),
                  CustomTextField(controller: _mobileNumberController, hintText: AppStrings.asApplicable, prefixIcon: Icons.phone_android, keyboardType: TextInputType.phone),
                  _buildLabel(AppStrings.additionalContactDetails),
                  CustomTextField(controller: _additionalContactController, hintText: AppStrings.optional, prefixIcon: Icons.info_outline, maxLines: 2),
                  _buildLabel(AppStrings.status),
                  DropdownButtonFormField<String>(
                    value: _selectedStatus,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.toggle_on_outlined, color: Colors.grey),
                      filled: true,
                      fillColor: AppColors.inputFillColor,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade200)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade200)),
                    ),
                    items: ['Active', 'Inactive'].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                    onChanged: (val) => setState(() => _selectedStatus = val ?? 'Active'),
                  ),
                  const SizedBox(height: 32),
                  BlocBuilder<SiteFormBloc, SiteFormState>(
                    builder: (context, state) {
                      final isLoading = state is SiteFormLoading;
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
                              text: isLoading ? 'Saving...' : (_isEditMode ? 'Update Site' : 'Save Site'),
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
