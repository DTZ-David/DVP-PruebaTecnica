// Widget reutilizable para secciones de información
import 'package:flutter/material.dart';

import '../../../atomic_design/atoms/app_text.dart';
import '../../../atomic_design/protons/colors.dart';
import '../../../atomic_design/protons/spacing.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const InfoSection({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: AppColors.primary600),
            const SizedBox(width: AppSpacing.xs),
            AppText.body1(title, color: AppColors.primary600),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        ...children,
      ],
    );
  }
}
