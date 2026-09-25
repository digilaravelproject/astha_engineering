import 'package:flutter/material.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerWidget.rectangular({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.borderRadius = 8.0,
  });

  const ShimmerWidget.circular({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300], // Will be replaced by shimmer package effect
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
