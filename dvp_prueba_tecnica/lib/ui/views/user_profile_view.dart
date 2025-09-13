import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../atomic_design/atoms/app_text.dart';
import '../../atomic_design/atoms/primary_button.dart';
import '../../atomic_design/protons/spacing.dart';
import '../../providers/users/global_user_provider.dart';
import '../widgets/userProfile/addresses_section.dart';
import '../widgets/userProfile/profile_header_card.dart';

class UserProfileView extends ConsumerWidget {
  final VoidCallback? onAddNewAddress;
  final VoidCallback? onEditUser;
  final Function(String addressId)? onDeleteAddress;
  final VoidCallback? onCompleteProfile;

  const UserProfileView({
    super.key,
    this.onAddNewAddress,
    this.onEditUser,
    this.onDeleteAddress,
    this.onCompleteProfile,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(globalUserNotifierProvider);
    final userNotifier = ref.read(globalUserNotifierProvider.notifier);

    if (userState.currentUser == null) {
      return const Center(
        child: AppText.body1('No hay información de usuario disponible'),
      );
    }

    final user = userState.currentUser!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.lg),
        ProfileHeaderCard(
          user: user,
          onEditUser: onEditUser,
        ),
        const SizedBox(height: AppSpacing.lg),
        AddressesSection(
          addresses: user.addresses,
          userNotifier: userNotifier,
          onDeleteAddress: onDeleteAddress,
        ),
        const SizedBox(height: AppSpacing.xl),
        _buildActionButtons(user.addresses.isNotEmpty),
      ],
    );
  }

  Widget _buildActionButtons(bool hasAddresses) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        children: [
          PrimaryButton(
            text: hasAddresses
                ? 'Agregar nueva dirección'
                : 'Agregar primera dirección',
            variant: ButtonVariant.outlined,
            onPressed: onAddNewAddress,
          ),
          if (hasAddresses) ...[
            const SizedBox(height: AppSpacing.sm),
            PrimaryButton(
              text: 'Completar perfil',
              variant: ButtonVariant.filled,
              onPressed: onCompleteProfile,
            ),
          ],
        ],
      ),
    );
  }
}
