import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../atomic_design/protons/spacing.dart';
import '../../providers/address/address_form_provider.dart';
import '../widgets/address/address_counter_widget.dart';
import '../widgets/address/address_form_card.dart';
import '../widgets/address/saved_addresses_list.dart';
import '../widgets/widgets/step_indicator_widget.dart';

class AddressFormView extends ConsumerWidget {
  final VoidCallback? onAddressAdded;
  final VoidCallback? onSaveAndContinue;

  const AddressFormView({
    super.key,
    this.onAddressAdded,
    this.onSaveAndContinue,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressState = ref.watch(addressFormNotifierProvider);
    final addressNotifier = ref.read(addressFormNotifierProvider.notifier);

    return Column(
      children: [
        const StepIndicator(
          currentStep: 2,
          totalSteps: 3,
          stepLabels: ['Información Personal', 'Dirección', 'Confirmación'],
        ),
        const SizedBox(height: AppSpacing.lg),
        if (addressState.savedAddresses.isNotEmpty)
          AddressCounterWidget(count: addressState.savedAddresses.length),
        AddressFormCard(
          addressState: addressState,
          addressNotifier: addressNotifier,
          onAddressAdded: onAddressAdded,
          onSaveAndContinue: onSaveAndContinue,
        ),
        if (addressState.savedAddresses.isNotEmpty)
          SavedAddressesList(
            addresses: addressState.savedAddresses,
            onRemoveAddress: (addressId) =>
                addressNotifier.removeAddress(addressId),
          ),
      ],
    );
  }
}
