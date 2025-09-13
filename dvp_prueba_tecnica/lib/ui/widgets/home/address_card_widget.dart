// Widget para las tarjetas de direcciones
import 'package:flutter/material.dart';

import '../../../atomic_design/atoms/app_text.dart';
import '../../../atomic_design/protons/colors.dart';
import '../../../atomic_design/protons/spacing.dart';

class AddressCard extends StatelessWidget {
  final dynamic address;
  final int index;

  const AddressCard({super.key, required this.address, required this.index});

  @override
  Widget build(BuildContext context) {
    final formattedAddress = _formatAddress();

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        border: Border.all(color: AppColors.neutral300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.home_outlined,
                  size: 16, color: AppColors.primary600),
              const SizedBox(width: AppSpacing.xs),
              AppText.body2('Dirección $index', color: AppColors.neutral700),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          AppText.caption(formattedAddress,
              color: AppColors.neutral600, maxLines: 3),
        ],
      ),
    );
  }

  String _formatAddress() {
    try {
      List<String> addressParts = [];

      if (address.municipalityName?.isNotEmpty == true) {
        addressParts.add(address.municipalityName);
      }
      if (address.departmentName?.isNotEmpty == true) {
        addressParts.add(address.departmentName);
      }
      if (address.countryName?.isNotEmpty == true) {
        addressParts.add(address.countryName);
      }

      return addressParts.isNotEmpty
          ? addressParts.join(', ')
          : 'Dirección no especificada';
    } catch (e) {
      return 'Información de dirección no disponible';
    }
  }
}
