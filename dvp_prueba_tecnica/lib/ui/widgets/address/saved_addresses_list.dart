import 'package:flutter/material.dart';
import '../../../atomic_design/atoms/app_text.dart';
import '../../../atomic_design/protons/colors.dart';
import '../../../atomic_design/protons/spacing.dart';
import '../../../models/address_model.dart';

class SavedAddressesList extends StatelessWidget {
  final List<Address> addresses;
  final Function(String) onRemoveAddress;

  const SavedAddressesList({
    super.key,
    required this.addresses,
    required this.onRemoveAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: AppSpacing.lg,
        left: AppSpacing.md,
        right: AppSpacing.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText.heading3('Direcciones Agregadas'),
          const SizedBox(height: AppSpacing.sm),
          ...addresses.map((address) => _buildAddressItem(address)),
        ],
      ),
    );
  }

  Widget _buildAddressItem(Address address) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.neutral200),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: AppColors.primary500,
            size: 20,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.body2(
                  '${address.municipalityName}, ${address.departmentName}',
                  color: AppColors.neutral900,
                ),
                AppText.caption(
                  address.countryName,
                  color: AppColors.neutral600,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => onRemoveAddress(address.id!),
            icon: const Icon(
              Icons.delete_outline,
              color: AppColors.error,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
