import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';
import 'package:safecheck_techno/core/widgets/custom_button.dart';
import 'package:safecheck_techno/core/widgets/custom_text_field.dart';
import 'package:safecheck_techno/core/utils/validators.dart';
import 'package:safecheck_techno/features/admin/customer_management/domain/entities/customer_entity.dart';
import 'package:safecheck_techno/features/admin/customer_management/presentation/bloc/customer_form_bloc.dart';
import 'package:safecheck_techno/features/admin/customer_management/presentation/bloc/customer_form_event.dart';
import 'package:safecheck_techno/features/admin/customer_management/presentation/bloc/customer_form_state.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _companyController = TextEditingController();
  final _contactPersonController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _gstController = TextEditingController();
  final _addressController = TextEditingController();
  final _pincodeController = TextEditingController();

  String _selectedStatus = 'Active';
  bool _isEditMode = false;
  CustomerEntity? _existingCustomer;

  @override
  void initState() {
    super.initState();
    // Check if entity was passed for edit mode
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = GoRouterState.of(context).extra;
      if (args != null && args is CustomerEntity) {
        _isEditMode = true;
        _existingCustomer = args;
        _prefillData(args);
        context.read<CustomerFormBloc>().add(LoadCustomerForEdit(args));
      }
    });
  }

  void _prefillData(CustomerEntity customer) {
    _companyController.text = customer.companyName;
    _contactPersonController.text = customer.contactPerson;
    _emailController.text = customer.email;
    _phoneController.text = customer.phone;
    _gstController.text = customer.gstNumber ?? '';
    _addressController.text = customer.address;
    _pincodeController.text = customer.pincode ?? '';
    setState(() {
      _selectedStatus = customer.status;
    });
  }

  @override
  void dispose() {
    _companyController.dispose();
    _contactPersonController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _gstController.dispose();
    _addressController.dispose();
    _pincodeController.dispose();
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

    final customer = CustomerEntity(
      id: _existingCustomer?.id ?? '',
      companyName: _companyController.text.trim(),
      contactPerson: _contactPersonController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      gstNumber: _gstController.text.trim().isEmpty ? null : _gstController.text.trim(),
      address: _addressController.text.trim(),
      country: 'India',
      state: 'Maharashtra',
      city: 'Mumbai',
      pincode: _pincodeController.text.trim().isEmpty ? null : _pincodeController.text.trim(),
      status: _selectedStatus,
      createdAt: _existingCustomer?.createdAt ?? DateTime.now(),
    );

    context.read<CustomerFormBloc>().add(SaveCustomer(customer));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomerFormBloc, CustomerFormState>(
      listener: (context, state) {
        if (state is CustomerFormSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.green),
          );
          context.pop(true);
        } else if (state is CustomerFormError) {
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
            _isEditMode ? 'Edit Customer' : 'Add New Customer',
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
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColors.backgroundLight,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: Icon(Icons.business, size: 40, color: Colors.grey.shade400),
                        ),
                        Positioned(
                          bottom: -4,
                          right: -4,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(Icons.camera_alt, color: Colors.white, size: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  _buildLabel(AppStrings.companyName),
                  CustomTextField(
                    controller: _companyController,
                    hintText: AppStrings.enterCompanyOrOrganizationName,
                    prefixIcon: Icons.business,
                    validator: Validators.validateName,
                  ),

                  _buildLabel(AppStrings.contactPersonName),
                  CustomTextField(
                    controller: _contactPersonController,
                    hintText: AppStrings.enterMainContactPerson,
                    prefixIcon: Icons.person_outline,
                    validator: Validators.validateName,
                  ),

                  _buildLabel(AppStrings.emailAddress),
                  CustomTextField(
                    controller: _emailController,
                    hintText: AppStrings.enterEmailAddress,
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.validateEmail,
                  ),

                  _buildLabel(AppStrings.mobileNumber),
                  CustomTextField(
                    controller: _phoneController,
                    hintText: AppStrings.enterMobileNumber,
                    prefixIcon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    validator: Validators.validatePhone,
                  ),

                  _buildLabel(AppStrings.gstNumberOptional),
                  CustomTextField(
                    controller: _gstController,
                    hintText: AppStrings.enterGstNumber,
                    prefixIcon: Icons.receipt_long_outlined,
                  ),

                  _buildLabel(AppStrings.billingAddress),
                  CustomTextField(
                    controller: _addressController,
                    hintText: AppStrings.enterFullBillingAddress,
                    prefixIcon: Icons.location_on_outlined,
                    maxLines: 3,
                    validator: (val) => val == null || val.isEmpty ? 'Address is required' : null,
                  ),

                  _buildLabel(AppStrings.pincodeOptional),
                  CustomTextField(
                    controller: _pincodeController,
                    hintText: AppStrings.enterPincode,
                    prefixIcon: Icons.pin_drop_outlined,
                    keyboardType: TextInputType.number,
                  ),

                  _buildLabel(AppStrings.status),
                  DropdownButtonFormField<String>(
                    value: _selectedStatus,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.toggle_on_outlined, color: Colors.grey),
                      filled: true,
                      fillColor: AppColors.inputFillColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                    items: ['Active', 'Inactive'].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                    onChanged: (val) => setState(() => _selectedStatus = val ?? 'Active'),
                  ),

                  const SizedBox(height: 32),
                  BlocBuilder<CustomerFormBloc, CustomerFormState>(
                    builder: (context, state) {
                      final isLoading = state is CustomerFormLoading;
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
                              text: isLoading ? 'Saving...' : (_isEditMode ? 'Update Customer' : 'Save Customer'),
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
