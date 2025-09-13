// app_icon.dart
import 'package:flutter/material.dart';

import '../protons/colors.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;

  const AppIcon(this.icon, {super.key, this.size, this.color});

  const AppIcon.small(this.icon, {super.key, this.color}) : size = 16;
  const AppIcon.medium(this.icon, {super.key, this.color}) : size = 24;
  const AppIcon.large(this.icon, {super.key, this.color}) : size = 32;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: size ?? 24, color: color ?? AppColors.neutral600);
  }
}
