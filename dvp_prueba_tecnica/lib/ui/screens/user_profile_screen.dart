import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../atomic_design/protons/colors.dart';
import '../../providers/users/global_user_provider.dart';
import '../views/user_profile_view.dart';
import '../widgets/userProfile/user_profile_app_bar.dart';
import '../widgets/userProfile/user_profile_dialogs.dart';
import '../widgets/userProfile/user_profile_service.dart';
import '../widgets/widgets/app_scaffold_wrapper.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.read(globalUserNotifierProvider.notifier);
    final profileService = UserProfileService(ref);

    return AppScaffoldWrapper(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: UserProfileAppBar(
        onReset: () => UserProfileDialogs.showResetDialog(
          context,
          userNotifier,
        ),
        onExport: () => _showExportSnackBar(context),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: UserProfileView(
            onAddNewAddress: () => context.go('/address-form'),
            onEditUser: () => context.go('/user_form'),
            onDeleteAddress: (addressId) =>
                UserProfileDialogs.showDeleteAddressDialog(
              context,
              addressId,
              userNotifier,
            ),
            onCompleteProfile: () => profileService.completeProfile(context),
          ),
        ),
      ),
    );
  }

  void _showExportSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.info_outline, color: AppColors.white, size: 20),
            SizedBox(width: 8),
            Text('Función de exportar en desarrollo'),
          ],
        ),
        backgroundColor: AppColors.primary500,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
