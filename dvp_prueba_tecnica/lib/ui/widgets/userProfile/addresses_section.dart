import 'package:flutter/material.dart';
import '../../../atomic_design/atoms/app_text.dart';
import '../../../atomic_design/protons/colors.dart';
import '../../../atomic_design/protons/spacing.dart';
import '../../../models/address_model.dart';
import '../../../providers/users/global_user_provider.dart';

class AddressesSection extends StatelessWidget {
  final List<Address> addresses;
  final GlobalUserNotifier userNotifier;
  final Function(String addressId)? onDeleteAddress;

  const AddressesSection({
    super.key,
    required this.addresses,
    required this.userNotifier,
    this.onDeleteAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(),
          const SizedBox(height: AppSpacing.md),
          if (addresses.isEmpty)
            _buildEmptyState()
          else
            ...addresses.map((address) => _buildAddressCard(address)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            Icon(
              Icons.location_on,
              color: AppColors.primary600,
              size: 24,
            ),
            SizedBox(width: AppSpacing.sm),
            AppText.heading3('Direcciones'),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary100,
            borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          ),
          child: AppText.caption(
            '${addresses.length}',
            color: AppColors.primary700,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(
          color: AppColors.neutral200,
          width: 1,
        ),
      ),
      child: const Column(
        children: [
          Icon(
            Icons.location_off_outlined,
            color: AppColors.neutral400,
            size: 48,
          ),
          SizedBox(height: AppSpacing.md),
          AppText.body1(
            'Sin direcciones agregadas',
            color: AppColors.neutral600,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSpacing.xs),
          AppText.caption(
            'Agrega al menos una dirección para completar tu perfil',
            color: AppColors.neutral500,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard(Address address) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(
          color: AppColors.neutral200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral900.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            _buildAddressIcon(),
            const SizedBox(width: AppSpacing.md),
            _buildAddressInfo(address),
            _buildDeleteButton(address),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressIcon() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.primary100,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: const Icon(
        Icons.location_on_outlined,
        color: AppColors.primary600,
        size: 20,
      ),
    );
  }

  Widget _buildAddressInfo(Address address) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.body1(
            '${address.municipalityName}, ${address.departmentName}',
            color: AppColors.neutral900,
          ),
          const SizedBox(height: AppSpacing.xs),
          AppText.caption(
            address.countryName,
            color: AppColors.neutral600,
          ),
        ],
      ),
    );
  }

  Widget _buildDeleteButton(Address address) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _handleDeleteAddress(address),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        child: const Padding(
          padding: EdgeInsets.all(AppSpacing.sm),
          child: Icon(
            Icons.delete_outline,
            color: AppColors.error,
            size: 20,
          ),
        ),
      ),
    );
  }

  void _handleDeleteAddress(Address address) {
    if (onDeleteAddress != null && address.id != null) {
      onDeleteAddress!(address.id!);
    }
  }
}
