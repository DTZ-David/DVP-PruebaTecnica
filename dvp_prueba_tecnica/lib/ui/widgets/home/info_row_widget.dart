// Widget para mostrar filas de información
import 'package:flutter/material.dart';

import '../../../atomic_design/atoms/app_text.dart';
import '../../../atomic_design/protons/colors.dart';
import '../../../atomic_design/protons/spacing.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: AppText.caption('$label:', color: AppColors.neutral600),
          ),
          Expanded(
            child: AppText.body2(value, color: AppColors.neutral900),
          ),
        ],
      ),
    );
  }
}
