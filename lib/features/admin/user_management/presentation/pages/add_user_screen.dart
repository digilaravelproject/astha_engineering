import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';
import 'package:safecheck_techno/core/enums/user_role.dart';
import 'package:safecheck_techno/core/widgets/custom_button.dart';
import 'package:safecheck_techno/core/widgets/custom_text_field.dart';
import 'package:safecheck_techno/core/utils/validators.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _employeeIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  UserRole? _selectedRole;
  bool _isActive = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _employeeIdController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(AppStrings.addNewUser,
          style: TextStyle(
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
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.backgroundLight,
                        child: Icon(Icons.person, size: 50, color: Colors.grey.shade400),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.camera_alt, color: Colors.white, size: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                
                _buildLabel(AppStrings.fullName),
                CustomTextField(
                  controller: _nameController,
                  hintText: AppStrings.enterFullName,
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
                  controller: _mobileController,
                  hintText: AppStrings.enterMobileNumber,
                  prefixIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  validator: Validators.validatePhone,
                ),
                
                _buildLabel(AppStrings.employeeInspectorId),
                CustomTextField(
                  controller: _employeeIdController,
                  hintText: AppStrings.enterIdOptional,
                  prefixIcon: Icons.badge_outlined,
                ),
                
                _buildLabel(AppStrings.role),
                DropdownButtonFormField<UserRole>(
                  initialValue: _selectedRole,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.security, color: Colors.grey),
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
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                    ),
                  ),
                  hint: const Text('Select Role'),
                  items: [UserRole.admin, UserRole.inspectionEngineer].map((UserRole role) {
                    return DropdownMenuItem<UserRole>(
                      value: role,
                      child: Text(role.displayName),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedRole = newValue;
                    });
                  },
                  validator: (value) => value == null ? 'Please select a role' : null,
                ),
                
                _buildLabel(AppStrings.password),
                CustomTextField(
                  controller: _passwordController,
                  hintText: AppStrings.enterPassword,
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  validator: Validators.validatePassword,
                ),
                
                _buildLabel(AppStrings.confirmPassword),
                CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: AppStrings.reenterPassword,
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  validator: (val) {
                    if (val != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundLight,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.accountStatus,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimaryLight,
                        ),
                      ),
                      Switch(
                        value: _isActive,
                        activeThumbColor: AppColors.primary,
                        onChanged: (val) {
                          setState(() {
                            _isActive = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => context.pop(),
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
                        text: 'Save User',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Save logic here
                            context.pop();
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
