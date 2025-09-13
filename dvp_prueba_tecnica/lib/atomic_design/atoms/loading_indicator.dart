// loading_indicator.dart
import 'package:flutter/material.dart';

import '../protons/colors.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;
  final Color color;

  const LoadingIndicator(
      {super.key, this.size = 24, this.color = AppColors.primary500});

  const LoadingIndicator.small({super.key})
      : size = 16,
        color = AppColors.primary500;

  const LoadingIndicator.large({super.key})
      : size = 32,
        color = AppColors.primary500;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
