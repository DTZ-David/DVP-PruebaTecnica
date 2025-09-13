import 'package:flutter/material.dart';
import '../../../atomic_design/atoms/app_text.dart';
import '../../../atomic_design/protons/colors.dart';
import '../../../atomic_design/protons/spacing.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final List<String> stepLabels;

  const StepIndicator({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.stepLabels,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          // Stack para superponer líneas y círculos
          SizedBox(
            height: 32,
            child: Stack(
              children: [
                // Líneas de fondo - CORREGIDO: Solo colorea hasta el paso actual
                Positioned(
                  top: 15,
                  left: 16,
                  right: 16,
                  child: Row(
                    children: List.generate(totalSteps - 1, (index) {
                      // CORRECCIÓN: La línea se colorea si el paso siguiente ya fue completado
                      final nextStepNumber = index + 2;
                      final isLineActive = nextStepNumber <= currentStep;

                      return Expanded(
                        child: Container(
                          height: 2,
                          margin: const EdgeInsets.symmetric(horizontal: 0),
                          decoration: BoxDecoration(
                            color: isLineActive
                                ? AppColors.primary500
                                : AppColors.neutral200,
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                // Círculos posicionados uniformemente
                Row(
                  children: List.generate(totalSteps, (index) {
                    return Expanded(
                      child: Center(
                        child: _buildStepCircle(index),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.md),

          // Labels de los steps
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(totalSteps, (index) {
              final stepNumber = index + 1;
              final isCurrent = stepNumber == currentStep;
              final isCompleted = stepNumber < currentStep;

              return Expanded(
                child: AppText.caption(
                  stepLabels[index],
                  textAlign: TextAlign.center,
                  color: (isCurrent || isCompleted)
                      ? AppColors.primary600
                      : AppColors.neutral400,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }),
          ),

          const SizedBox(height: AppSpacing.sm),

          // Indicador de progreso actual
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: AppColors.primary50,
              borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
              border: Border.all(color: AppColors.primary100),
            ),
            child: AppText.caption(
              'Paso $currentStep de $totalSteps',
              color: AppColors.primary700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepCircle(int index) {
    final stepNumber = index + 1;
    final isCompleted = stepNumber < currentStep;
    final isCurrent = stepNumber == currentStep;

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _getStepColor(isCompleted, isCurrent),
        border: Border.all(
          color: _getStepBorderColor(isCompleted, isCurrent),
          width: 2,
        ),
      ),
      child: Center(
        child: isCompleted
            ? const Icon(
                Icons.check,
                color: AppColors.white,
                size: 16,
              )
            : AppText.body3(
                stepNumber.toString(),
                color: _getStepTextColor(isCompleted, isCurrent),
              ),
      ),
    );
  }

  Color _getStepColor(bool isCompleted, bool isCurrent) {
    if (isCompleted) return AppColors.primary500;
    if (isCurrent) return AppColors.white;
    return AppColors.white;
  }

  Color _getStepBorderColor(bool isCompleted, bool isCurrent) {
    if (isCompleted) return AppColors.primary500;
    if (isCurrent) return AppColors.primary500;
    return AppColors.neutral300;
  }

  Color _getStepTextColor(bool isCompleted, bool isCurrent) {
    if (isCompleted) return AppColors.white;
    if (isCurrent) return AppColors.primary500;
    return AppColors.neutral400;
  }
}
