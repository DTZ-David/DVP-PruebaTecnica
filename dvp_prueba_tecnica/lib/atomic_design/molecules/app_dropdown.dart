import 'package:flutter/material.dart';
import '../../atomic_design/atoms/app_text.dart';
import '../../atomic_design/protons/colors.dart';
import '../../atomic_design/protons/spacing.dart';

class AppDropdown<T> extends StatelessWidget {
  final String labelText;
  final String hintText;
  final T? selectedValue;
  final List<T> items;
  final String Function(T) getItemLabel;
  final String Function(T) getItemValue;
  final void Function(T?) onChanged;
  final bool isLoading;
  final bool isEnabled;
  final String? errorText;

  const AppDropdown({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.selectedValue,
    required this.items,
    required this.getItemLabel,
    required this.getItemValue,
    required this.onChanged,
    this.isLoading = false,
    this.isEnabled = true,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        AppText.body2(
          labelText,
          color: AppColors.neutral700,
        ),

        const SizedBox(height: AppSpacing.xs),

        // Dropdown Container
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            border: Border.all(
              color: errorText != null ? AppColors.error : AppColors.neutral300,
              width: 1,
            ),
          ),
          child: isLoading ? _buildLoadingState() : _buildDropdown(),
        ),

        // Error message
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

  Widget _buildLoadingState() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: const Row(
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primary500,
            ),
          ),
          SizedBox(width: AppSpacing.sm),
          AppText.body2(
            'Cargando...',
            color: AppColors.neutral500,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<T>(
      value: selectedValue,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.neutral400,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: isEnabled ? AppColors.neutral600 : AppColors.neutral400,
      ),
      style: const TextStyle(
        color: AppColors.neutral900,
        fontSize: 14,
      ),
      dropdownColor: AppColors.white,
      items: items.isEmpty
          ? null
          : items.map((T item) {
              return DropdownMenuItem<T>(
                value: item,
                child: AppText.body2(
                  getItemLabel(item),
                  color: AppColors.neutral900,
                ),
              );
            }).toList(),
      onChanged: isEnabled && items.isNotEmpty ? onChanged : null,
      validator: (value) => errorText,
    );
  }
}
