// Widget para los detalles expandidos del usuario
import 'package:flutter/material.dart';

import '../../atomic_design/protons/colors.dart';
import '../../atomic_design/protons/spacing.dart';
import '../../models/user_model.dart';
import 'home/address_card_widget.dart';
import 'home/info_row_widget.dart';
import 'home/info_section_widget.dart';

class UserDetails extends StatelessWidget {
  final User user;
  final String formattedDate;
  final VoidCallback onDeleteUser;

  const UserDetails({
    super.key,
    required this.user,
    required this.formattedDate,
    required this.onDeleteUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.neutral200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoSection(
            title: 'Información Personal',
            icon: Icons.person_outline,
            children: [
              InfoRow(
                  label: 'Nombre completo',
                  value: '${user.firstName} ${user.lastName}'),
              InfoRow(label: 'Fecha de nacimiento', value: formattedDate),
              InfoRow(
                  label: 'Edad',
                  value: '${_calculateAge(user.birthDate)} años'),
            ],
          ),
          if (user.addresses.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            InfoSection(
              title: 'Direcciones',
              icon: Icons.location_on_outlined,
              children: user.addresses.asMap().entries.map((entry) {
                final index = entry.key;
                final address = entry.value;
                return AddressCard(address: address, index: index + 1);
              }).toList(),
            ),
          ],
          const SizedBox(height: AppSpacing.md),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        const Spacer(),
        OutlinedButton.icon(
          onPressed: onDeleteUser,
          icon: const Icon(Icons.delete_outline, size: 16),
          label: const Text('Eliminar'),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.error,
            side: const BorderSide(color: AppColors.error),
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
