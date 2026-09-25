import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:safecheck_techno/core/constants/app_constants.dart';

import 'package:safecheck_techno/core/theme/app_colors.dart';
import 'package:safecheck_techno/core/widgets/custom_button.dart';
import 'package:safecheck_techno/features/auth/presentation/widgets/auth_background.dart';
import 'package:safecheck_techno/core/widgets/custom_text_field.dart';
import 'package:safecheck_techno/core/utils/custom_snackbar.dart';
import 'package:safecheck_techno/core/utils/validators.dart';
import 'package:safecheck_techno/routes/app_routes.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
        bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24.0, top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                AppStrings.dontHaveAccount,
                style: TextStyle(color: Colors.black54),
              ),
              GestureDetector(
                onTap: () {
                  context.push(Routes.signup);
                },
                child: Text(
                  AppStrings.signUpButton,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.accent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            CustomSnackbar.showSuccess(AppStrings.loginSuccess);
            context.go(Routes.roleSelection);
          } else if (state is LoginFailure) {
            CustomSnackbar.showError(state.message);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    AppStrings.signInTitle,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    AppStrings.signInSubtitle,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Email Field
                  _buildLabel(AppStrings.emailLabel),
                  CustomTextField(
                    controller: _emailController,
                    hintText: AppStrings.emailHint,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.validateEmail,
                  ),
                  const SizedBox(height: 16),
                  
                  // Password Field
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
                  const SizedBox(height: 12),
                  
                  // Remember Me and Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: Checkbox(
                              value: _rememberMe,
                              onChanged: (val) {
                                setState(() {
                                  _rememberMe = val ?? false;
                                });
                              },
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Remember me',
                            style: TextStyle(color: Colors.black87, fontSize: 13),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push(Routes.forgotPassword);
                        },
                        child: Text(
                          AppStrings.forgotPassword,
                          style: TextStyle(
                            color: AppColors.accent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Sign In Button
                  CustomButton(
                    text: AppStrings.signInButton,
                    isLoading: state is LoginLoading,
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                        context.read<LoginBloc>().add(SubmitLogin(
                          identifier: _emailController.text.trim().isEmpty ? 'admin@admin.com' : _emailController.text.trim(),
                          password: _passwordController.text.isEmpty ? 'password' : _passwordController.text,
                        ));
                      // }
                    },
                    // We can override the button color if CustomButton supports it, otherwise it uses Theme primary.
                    // Assuming CustomButton relies on Theme primaryColor.
                  ),
                  const SizedBox(height: 24),
                  
                  // Divider
                  Row(
                    children: [
                      const Expanded(child: Divider(color: Colors.black12, thickness: 1)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          AppStrings.orContinueWith,
                          style: TextStyle(color: Colors.black38, fontSize: 13),
                        ),
                      ),
                      const Expanded(child: Divider(color: Colors.black12, thickness: 1)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Social Buttons
                  OutlinedButton.icon(
                    onPressed: () {
                      context.push(Routes.emailLogin);
                    },
                    icon: const Icon(Icons.email_outlined, color: Color(0xFF2C7D73)),
                    label: const Text(
                      AppStrings.continueWithEmail,
                      style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: Colors.black12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ),
             ),
            ),
          );
        },
      ),
      ),
    );
  }
}
