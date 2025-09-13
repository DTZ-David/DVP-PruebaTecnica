// app_dropdown.dart
import 'package:flutter/material.dart';

import '../atoms/app_text.dart';
import '../protons/colors.dart';
import '../protons/spacing.dart';

class AppDropdown<T> extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final T? value;
  final List<T> items;
  final String Function(T) getItemText;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;

  const AppDropdown({
    super.key,
    this.labelText,
    this.hintText,
    required this.value,
    required this.items,
    required this.getItemText,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items
          .map((item) => DropdownMenuItem<T>(
                value: item,
                child: AppText.body1(getItemText(item)),
              ))
          .toList(),
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        // Usar mismo estilo que AppTextField
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: const BorderSide(color: AppColors.neutral300),
        ),
      ),
    );
  }
}
