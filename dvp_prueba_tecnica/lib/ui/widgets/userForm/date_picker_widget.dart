import 'package:flutter/material.dart';
import '../../../atomic_design/atoms/app_text.dart';
import '../../../atomic_design/protons/colors.dart';
import '../../../atomic_design/protons/spacing.dart';

class DatePickerField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final DateTime? selectedDate;
  final void Function(DateTime?)? onDateSelected;
  final String? errorText;

  const DatePickerField({
    super.key,
    this.labelText,
    this.hintText,
    this.selectedDate,
    this.onDateSelected,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          AppText.body2(
            labelText!,
            color: AppColors.neutral600,
          ),
          const SizedBox(height: AppSpacing.xs),
        ],
        InkWell(
          onTap: () => _showDatePicker(context),
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color:
                    errorText != null ? AppColors.error : AppColors.neutral300,
                width: errorText != null ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: selectedDate != null
                      ? AppColors.primary500
                      : AppColors.neutral400,
                  size: 20,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: AppText.body1(
                    selectedDate != null
                        ? _formatDate(selectedDate!)
                        : hintText ?? 'Seleccionar fecha',
                    color: selectedDate != null
                        ? AppColors.neutral900
                        : AppColors.neutral400,
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.neutral400,
                ),
              ],
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: AppSpacing.xs),
          AppText.caption(
            errorText!,
            color: AppColors.error,
          ),
        ],
      ],
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary500,
              onPrimary: AppColors.white,
              surface: AppColors.white,
              onSurface: AppColors.neutral900,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && onDateSelected != null) {
      onDateSelected!(picked);
    }
  }

  String _formatDate(DateTime date) {
    final months = [
      '',
      'Ene',
      'Feb',
      'Mar',
      'Abr',
      'May',
      'Jun',
      'Jul',
      'Ago',
      'Sep',
      'Oct',
      'Nov',
      'Dic'
    ];

    return '${date.day} ${months[date.month]} ${date.year}';
  }
}
