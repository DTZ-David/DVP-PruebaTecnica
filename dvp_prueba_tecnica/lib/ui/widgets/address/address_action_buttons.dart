import 'package:flutter/material.dart';
import '../../../atomic_design/atoms/primary_button.dart';
import '../../../atomic_design/protons/spacing.dart';
import '../../../models/address_form_models.dart';

class AddressActionButtons extends StatelessWidget {
  final AddressFormState addressState;
  final VoidCallback? onAddressAdded;
  final VoidCallback? onSaveAndContinue;
  final VoidCallback onAddAnother;
  final VoidCallback onSaveAndContinueAction;

  const AddressActionButtons({
    super.key,
    required this.addressState,
    this.onAddressAdded,
    this.onSaveAndContinue,
    required this.onAddAnother,
    required this.onSaveAndContinueAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          text: addressState.isSavingAddress
              ? 'Guardando...'
              : 'Agregar otra dirección',
          variant: ButtonVariant.outlined,
          onPressed: _canAddAnother() ? onAddAnother : null,
          isLoading: addressState.isSavingAddress,
          isDisabled: !_canAddAnother(),
        ),
        const SizedBox(height: AppSpacing.sm),
        PrimaryButton(
          text: _getContinueButtonText(),
          variant: ButtonVariant.filled,
          onPressed: _canContinue() ? onSaveAndContinueAction : null,
          isLoading: addressState.isSavingAddress,
          isDisabled: !_canContinue(),
        ),
      ],
    );
  }

  bool _canAddAnother() {
    return addressState.isValid && !addressState.isSavingAddress;
  }

  bool _canContinue() {
    return addressState.savedAddresses.isNotEmpty ||
        (addressState.isValid && !addressState.isSavingAddress);
  }

  String _getContinueButtonText() {
    if (addressState.isSavingAddress) return 'Guardando...';
    if (addressState.savedAddresses.isEmpty) {
      return 'Guardar dirección y continuar';
    }
    return 'Continuar';
  }
}
