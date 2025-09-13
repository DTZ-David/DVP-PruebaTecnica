import 'package:flutter/material.dart';
import '../../../atomic_design/atoms/app_text.dart';
import '../../../atomic_design/protons/colors.dart';
import '../../../atomic_design/protons/spacing.dart';

class AddressCounterWidget extends StatelessWidget {
  final int count;

  const AddressCounterWidget({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppColors.primary50,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            border: Border.all(color: AppColors.primary200),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                color: AppColors.primary600,
                size: 16,
              ),
              const SizedBox(width: AppSpacing.xs),
              AppText.caption(
                '$count direcciones agregadas',
                color: AppColors.primary700,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
      ],
    );
  }
}
