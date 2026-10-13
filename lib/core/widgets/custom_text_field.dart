import 'package:flutter/material.dart';
import 'package:astha_engineering/core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  final bool obscureText;
  final Color? borderColor;
  final double borderRadius;
  final Color? iconColor;
  final TextStyle? textStyle;
  final bool isReadOnly;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.maxLength,
    this.maxLines = 1,
    this.obscureText = false,
    this.borderColor,
    this.borderRadius = 12.0,
    this.iconColor,
    this.textStyle,
    this.isReadOnly = false,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBorderColor = borderColor ?? AppColors.borderDefault;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: textStyle ?? const TextStyle(fontSize: 16),
      obscureText: obscureText,
      maxLength: maxLength,
      maxLines: obscureText ? 1 : maxLines,
      minLines: 1,
      readOnly: isReadOnly,
      onTap: onTap,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black38, fontSize: 14, fontWeight: FontWeight.w400),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: iconColor ?? Colors.black45) : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon, color: iconColor ?? Colors.black45),
                onPressed: onSuffixTap,
              )
            : null,
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: defaultBorderColor, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: validator,
    );
  }
}
