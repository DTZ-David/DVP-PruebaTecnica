// app_gap.dart
import 'package:flutter/material.dart';
import '../protons/spacing.dart';

class AppGap extends StatelessWidget {
  final double size;
  final bool isVertical;

  const AppGap(this.size, {super.key, this.isVertical = true});

  const AppGap.xs({super.key, this.isVertical = true}) : size = AppSpacing.xs;
  const AppGap.sm({super.key, this.isVertical = true}) : size = AppSpacing.sm;
  const AppGap.md({super.key, this.isVertical = true}) : size = AppSpacing.md;
  const AppGap.lg({super.key, this.isVertical = true}) : size = AppSpacing.lg;
  const AppGap.xl({super.key, this.isVertical = true}) : size = AppSpacing.xl;

  @override
  Widget build(BuildContext context) {
    return isVertical ? SizedBox(height: size) : SizedBox(width: size);
  }
}
