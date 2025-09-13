// Widget para estado vacío
import 'package:flutter/material.dart';

import '../../../atomic_design/atoms/app_text.dart';
import '../../../atomic_design/protons/colors.dart';
import '../../../atomic_design/protons/spacing.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.neutral200),
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.neutral200,
              borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            ),
            child: const Icon(Icons.people_outline,
                size: 40, color: AppColors.neutral500),
          ),
          const SizedBox(height: AppSpacing.lg),
          const AppText.heading3('No hay usuarios registrados'),
          const SizedBox(height: AppSpacing.sm),
          const AppText.body2(
            'Agrega tu primer usuario presionando el botón +',
            color: AppColors.neutral600,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
