import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../atomic_design/atoms/app_text.dart';
import '../../../atomic_design/protons/colors.dart';
import '../../../atomic_design/protons/spacing.dart';
import '../../../models/user_model.dart';

class ProfileHeaderCard extends StatelessWidget {
  final User user;
  final VoidCallback? onEditUser;

  const ProfileHeaderCard({
    super.key,
    required this.user,
    this.onEditUser,
  });

  @override
  Widget build(BuildContext context) {
    final age = _calculateAge(user.birthDate);
    final formattedDate = DateFormat('dd/MM/yyyy').format(user.birthDate);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
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
      child: Column(
        children: [
          _buildAvatar(),
          const SizedBox(height: AppSpacing.md),
          _buildUserInfo(age, formattedDate),
          const SizedBox(height: AppSpacing.md),
          _buildEditButton(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.2),
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.white.withOpacity(0.3),
          width: 3,
        ),
      ),
      child: const Icon(
        Icons.person,
        color: AppColors.white,
        size: 40,
      ),
    );
  }

  Widget _buildUserInfo(int age, String formattedDate) {
    return Column(
      children: [
        AppText.heading2(
          '${user.firstName} ${user.lastName}',
          color: AppColors.white,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.xs),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cake_outlined,
              color: AppColors.white.withOpacity(0.8),
              size: 16,
            ),
            const SizedBox(width: AppSpacing.xs),
            AppText.body2(
              '$age años • $formattedDate',
              color: AppColors.white.withOpacity(0.9),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEditButton() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(
          color: AppColors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onEditUser,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.edit_outlined,
                  color: AppColors.white,
                  size: 16,
                ),
                SizedBox(width: AppSpacing.xs),
                AppText.body3(
                  'Editar información',
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ),
      ),
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
