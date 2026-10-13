import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:astha_engineering/core/constants/app_strings.dart';
import 'package:astha_engineering/core/widgets/custom_button.dart';
import 'package:astha_engineering/core/widgets/custom_text_field.dart';
import 'package:astha_engineering/core/utils/custom_snackbar.dart';
import 'package:astha_engineering/core/utils/validators.dart';
import 'package:astha_engineering/features/auth/presentation/widgets/auth_background.dart';
import 'package:astha_engineering/routes/app_routes.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 12.0),
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
    return AuthBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                AppStrings.setNewPasswordTitle,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                AppStrings.setNewPasswordSubtitle,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),
              
              _buildLabel(AppStrings.passwordLabel),
              CustomTextField(
                controller: _passwordController,
                hintText: AppStrings.passwordHint,
                obscureText: !_isPasswordVisible,
                suffixIcon: _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                onSuffixTap: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                validator: Validators.validatePassword,
              ),
              
              const SizedBox(height: 16),
              
              _buildLabel(AppStrings.confirmPasswordLabel),
              CustomTextField(
                controller: _confirmPasswordController,
                hintText: AppStrings.confirmPasswordHint,
                obscureText: !_isConfirmPasswordVisible,
                suffixIcon: _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                onSuffixTap: () {
                  setState(() {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  });
                },
                validator: (value) => Validators.validateConfirmPassword(
                  value,
                  _passwordController.text,
                ),
              ),
              
              const SizedBox(height: 32),
              CustomButton(
                text: AppStrings.updatePassword,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    CustomSnackbar.showSuccess(AppStrings.passwordResetSuccess);
                    context.go(Routes.login);
                  }
                },
              ),
            ],
          ),
        ),
        ),
      ),
      ),
    );
  }
}
