import 'package:flutter/material.dart';
import 'package:astha_engineering/core/constants/image_constants.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: const AssetImage(ImageConstants.bgGrey),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withValues(alpha: 0.85),
            BlendMode.srcOver,
          ),
        ),
      ),
      child: child,
    );
  }
}
