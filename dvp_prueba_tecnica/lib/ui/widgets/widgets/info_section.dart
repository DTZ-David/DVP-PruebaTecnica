// Widget para las secciones de información (solo las que se repiten)
import 'package:flutter/material.dart';

import '../../../atomic_design/atoms/app_text.dart';
import '../../../atomic_design/protons/colors.dart';
import '../../../atomic_design/protons/spacing.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const InfoSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.body2(title),
        const SizedBox(height: AppSpacing.xs),
        Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            border: Border.all(
              color: AppColors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}
