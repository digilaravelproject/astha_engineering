import 'package:astha_engineering/core/constants/app_strings.dart';

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.valEmptyEmail;
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim())) {
      return AppStrings.valInvalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.valEmptyPassword;
    }
    if (value.length < 8) {
      return AppStrings.valMinPasswordLength;
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.valEmptyName;
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return AppStrings.valEmptyConfirmPassword;
    }
    if (value != password) {
      return AppStrings.valPasswordMismatch;
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Mobile number is required';
    }
    if (!RegExp(r'^\+?[0-9]{10,14}$').hasMatch(value.trim())) {
      return 'Enter a valid mobile number';
    }
    return null;
  }
}
