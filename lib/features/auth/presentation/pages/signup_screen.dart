import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:safecheck_techno/core/constants/app_constants.dart';
import 'package:safecheck_techno/core/theme/app_colors.dart';
import 'package:safecheck_techno/core/widgets/custom_button.dart';
import 'package:safecheck_techno/core/widgets/custom_text_field.dart';
import 'package:safecheck_techno/core/utils/custom_snackbar.dart';
import 'package:safecheck_techno/core/utils/validators.dart';
import 'package:safecheck_techno/core/constants/app_urls.dart';
import 'package:safecheck_techno/features/auth/presentation/widgets/auth_background.dart';
import 'package:safecheck_techno/routes/app_routes.dart';
import '../bloc/signup_bloc.dart';
import '../bloc/signup_event.dart';
import '../bloc/signup_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _agreedToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
        bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24.0, top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                AppStrings.alreadyHaveAccount,
                style: TextStyle(color: Colors.black54),
              ),
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Text(
                  AppStrings.signInButton,
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            CustomSnackbar.showSuccess(AppStrings.signupSuccess);
            context.go(Routes.roleSelection);
          } else if (state is SignupFailure) {
            CustomSnackbar.showError(state.message);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  const Text(
                    AppStrings.createAccountTitle,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    AppStrings.createAccountSubtitle,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  _buildLabel(AppStrings.nameLabel),
                  CustomTextField(
                    controller: _nameController,
                    hintText: AppStrings.nameHint,
                    validator: Validators.validateName,
                  ),
                  
                  _buildLabel(AppStrings.emailLabel),
                  CustomTextField(
                    controller: _emailController,
                    hintText: AppStrings.emailHint,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.validateEmail,
                  ),
                  
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
                  
                  // Checkbox
                  Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          value: _agreedToTerms,
                          onChanged: (val) {
                            setState(() {
                              _agreedToTerms = val ?? false;
                            });
                          },
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            context.push(Routes.webview, extra: {
                              'title': 'Terms & Conditions',
                              'endpoint': AppUrls.termsEndpoint,
                            });
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: AppStrings.iAgreeWith,
                              style: TextStyle(color: Colors.black54, fontSize: 13),
                              children: [
                                TextSpan(
                                  text: AppStrings.termsAndConditions,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  CustomButton(
                    text: AppStrings.signUpButton,
                    isLoading: state is SignupLoading,
                    onPressed: () {
                      if (!_agreedToTerms) {
                        CustomSnackbar.showError('You must agree to the Terms and Conditions');
                        return;
                      }
                      if (_formKey.currentState!.validate()) {
                        context.read<SignupBloc>().add(SubmitSignup(
                          name: _nameController.text.trim(),
                          email: _emailController.text.trim(),
                          password: _passwordController.text,
                        ));
                      }
                    },
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
                    icon: const Icon(Icons.email_outlined, color: AppColors.primaryDark),
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
