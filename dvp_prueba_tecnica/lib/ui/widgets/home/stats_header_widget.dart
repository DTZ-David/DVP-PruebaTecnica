// Widget para el header con estadísticas
import 'package:flutter/material.dart';

import '../../../atomic_design/atoms/app_text.dart';
import '../../../atomic_design/protons/colors.dart';
import '../../../atomic_design/protons/spacing.dart';

class StatsHeader extends StatelessWidget {
  final int userCount;

  const StatsHeader({super.key, required this.userCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary500, AppColors.primary600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary500.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: const Icon(Icons.people, color: AppColors.white, size: 30),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText.heading2('Usuarios Registrados',
                    color: AppColors.white),
                const SizedBox(height: AppSpacing.xs),
                AppText.body2(
                  '$userCount ${userCount == 1 ? 'usuario' : 'usuarios'} en total',
                  color: AppColors.white.withOpacity(0.9),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
