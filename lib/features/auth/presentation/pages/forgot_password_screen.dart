import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:safecheck_techno/core/widgets/custom_button.dart';
import 'package:safecheck_techno/core/widgets/custom_text_field.dart';
import 'package:safecheck_techno/core/utils/validators.dart';
import 'package:safecheck_techno/features/auth/presentation/widgets/auth_background.dart';
import 'package:safecheck_techno/routes/app_routes.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                AppStrings.forgotPasswordTitle,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                AppStrings.forgotPasswordSubtitle,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),
              _buildLabel(AppStrings.emailLabel),
              CustomTextField(
                controller: _emailController,
                hintText: AppStrings.emailHint,
                keyboardType: TextInputType.emailAddress,
                validator: Validators.validateEmail,
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: AppStrings.sendOtp,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.push(Routes.otpVerify, extra: {
                      'email': _emailController.text,
                      'nextRoute': Routes.setNewPassword,
                    });
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
