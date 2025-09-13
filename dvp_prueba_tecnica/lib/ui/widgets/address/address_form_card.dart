// widgets/address_form_card.dart
import 'package:flutter/material.dart';
import '../../../atomic_design/atoms/app_text.dart';
import '../../../atomic_design/protons/colors.dart';
import '../../../atomic_design/protons/spacing.dart';
import '../../../models/address_form_models.dart';
import '../../../providers/address/address_form_provider.dart';
import 'address_dropdowns_section.dart';
import 'address_action_buttons.dart';

class AddressFormCard extends StatelessWidget {
  final AddressFormState addressState;
  final AddressFormNotifier addressNotifier;
  final VoidCallback? onAddressAdded;
  final VoidCallback? onSaveAndContinue;

  const AddressFormCard({
    super.key,
    required this.addressState,
    required this.addressNotifier,
    this.onAddressAdded,
    this.onSaveAndContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral900.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: AppSpacing.lg),
          AddressDropdownsSection(
            addressState: addressState,
            addressNotifier: addressNotifier,
          ),
          const SizedBox(height: AppSpacing.xl),
          AddressActionButtons(
            addressState: addressState,
            onAddressAdded: onAddressAdded,
            onSaveAndContinue: onSaveAndContinue,
            onAddAnother: _handleAddAnother,
            onSaveAndContinueAction: _handleSaveAndContinue,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.heading3(
          addressState.savedAddresses.isEmpty
              ? 'Agregar Primera Dirección'
              : 'Agregar Otra Dirección',
        ),
        const AppText.caption(
          'Selecciona tu ubicación paso a paso',
          color: AppColors.neutral500,
        ),
      ],
    );
  }

  void _handleAddAnother() async {
    final success = await addressNotifier.saveAddress();
    if (success && onAddressAdded != null) {
      onAddressAdded!();
    }
  }

  void _handleSaveAndContinue() async {
    if (addressState.savedAddresses.isEmpty) {
      if (addressState.isValid) {
        final success = await addressNotifier.saveAddress();
        if (success && onSaveAndContinue != null) {
          onSaveAndContinue!();
        }
      }
    } else {
      if (onSaveAndContinue != null) {
        onSaveAndContinue!();
      }
    }
  }
}
