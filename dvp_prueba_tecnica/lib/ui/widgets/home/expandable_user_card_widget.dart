import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../atomic_design/atoms/app_text.dart';
import '../../../atomic_design/protons/colors.dart';
import '../../../atomic_design/protons/spacing.dart';
import '../../../models/user_model.dart';
import '../user_details_widget.dart';

class ExpandableUserCard extends StatelessWidget {
  final User user;
  final bool isExpanded;
  final VoidCallback onToggleExpanded;
  final VoidCallback onDeleteUser;

  const ExpandableUserCard({
    super.key,
    required this.user,
    required this.isExpanded,
    required this.onToggleExpanded,
    required this.onDeleteUser,
  });

  @override
  Widget build(BuildContext context) {
    final age = _calculateAge(user.birthDate);
    final formattedDate = DateFormat('dd/MM/yyyy').format(user.birthDate);

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(
          color: isExpanded ? AppColors.primary400 : AppColors.neutral200,
          width: isExpanded ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isExpanded
                ? AppColors.primary500.withOpacity(0.1)
                : AppColors.neutral900.withOpacity(0.05),
            blurRadius: isExpanded ? 12 : 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onToggleExpanded,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                _buildHeader(age, formattedDate),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: UserDetails(
                    user: user,
                    formattedDate: formattedDate,
                    onDeleteUser: onDeleteUser,
                  ),
                  crossFadeState: isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(int age, String formattedDate) {
    return Row(
      children: [
        // Avatar
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary400, AppColors.primary600],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          child: Center(
            child: AppText.heading3(
              '${user.firstName[0]}${user.lastName[0]}',
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        // Información básica
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.body1(
                '${user.firstName} ${user.lastName}',
                color: AppColors.neutral900,
              ),
              const SizedBox(height: AppSpacing.xs),
              Row(
                children: [
                  const Icon(Icons.cake_outlined,
                      size: 16, color: AppColors.neutral600),
                  const SizedBox(width: AppSpacing.xs),
                  AppText.caption(
                    '$age años • $formattedDate',
                    color: AppColors.neutral600,
                  ),
                ],
              ),
            ],
          ),
        ),
        // Indicador de expansión
        AnimatedRotation(
          turns: isExpanded ? 0.5 : 0,
          duration: const Duration(milliseconds: 200),
          child: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.primary600,
            size: 24,
          ),
        ),
      ],
    );
  }

  int _calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }
}
