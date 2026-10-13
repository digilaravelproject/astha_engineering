import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:astha_engineering/core/constants/app_strings.dart';
import 'package:astha_engineering/core/theme/app_colors.dart';
import 'package:astha_engineering/core/widgets/custom_button.dart';
import 'package:astha_engineering/features/auth/presentation/widgets/auth_background.dart';
import 'package:astha_engineering/core/utils/custom_snackbar.dart';
import 'package:astha_engineering/routes/app_routes.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  final String nextRoute;
  const OtpScreen({super.key, required this.email, required this.nextRoute});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _pinController = TextEditingController();
  final focusNode = FocusNode();
  bool _isLoading = false;

  @override
  void dispose() {
    _pinController.dispose();
    focusNode.dispose();
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

  void _verifyOtp() async {
    if (_pinController.text.length < 4) return;
    
    setState(() => _isLoading = true);
    // Simulate verification
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);
    
    if (!mounted) return;

    CustomSnackbar.showSuccess('Verified successfully!');
    context.go(widget.nextRoute);
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 72,
      height: 60,
      textStyle: const TextStyle(fontSize: 32, color: Colors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: AppColors.inputFillColor,
        border: Border.all(color: AppColors.primary, width: 1.2), // Teal border
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primary, width: 2.0),
    );

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                AppStrings.verifyEmailTitle,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                AppStrings.verifyEmailSubtitle,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 40),
              
              _buildLabel(AppStrings.enterOtp),
              Pinput(
                controller: _pinController,
                focusNode: focusNode,
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                showCursor: true,
                obscureText: true,
                obscuringCharacter: '•',
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                onCompleted: (pin) => _verifyOtp(),
              ),
              const SizedBox(height: 24),
              
              Row(
                children: [
                  const Text(
                    AppStrings.didntGetCode,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      CustomSnackbar.showSuccess('OTP Resent!');
                    },
                    child: Text(
                      AppStrings.resend,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.accent,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              
              CustomButton(
                text: AppStrings.verify,
                isLoading: _isLoading,
                onPressed: _verifyOtp,
              ),
              const SizedBox(height: 32),
              
              // Sign In text as requested in original image
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.alreadyHaveAccount,
                    style: TextStyle(color: Colors.black54),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go(Routes.login);
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
            ],
          ),
        ),
      ),
      ),
    );
  }
}
