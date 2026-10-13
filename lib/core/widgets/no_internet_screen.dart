import 'package:flutter/material.dart';
import 'package:astha_engineering/core/constants/app_strings.dart';
import 'package:astha_engineering/core/widgets/error_screen.dart';

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
