// Widget para el contenedor animado del pill
import 'package:flutter/material.dart';

import '../../../atomic_design/protons/colors.dart';
import '../../../atomic_design/protons/spacing.dart';

class PillContainer extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onTap;
  final Widget child;

  const PillContainer({
    super.key,
    required this.isExpanded,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      constraints: BoxConstraints(
        maxWidth: isExpanded ? MediaQuery.of(context).size.width - 32 : 200,
        maxHeight: isExpanded ? 400 : 48,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary500, AppColors.primary600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        border: Border.all(
          color: AppColors.white.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          child: child,
        ),
      ),
    );
  }
}
