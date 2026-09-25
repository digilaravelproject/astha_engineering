import 'package:flutter/material.dart';
import 'package:safecheck_techno/core/constants/app_strings.dart';
import 'package:safecheck_techno/core/widgets/error_screen.dart';

class NoInternetScreen extends StatelessWidget {
  final VoidCallback onRetry;

  const NoInternetScreen({
    super.key,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return ErrorScreen(
      title: 'No Internet Connection',
      message: AppStrings.noInternetError,
      onRetry: onRetry,
    );
  }
}
