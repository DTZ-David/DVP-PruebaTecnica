// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../atomic_design/protons/colors.dart';
import '../../providers/address/address_form_provider.dart';
import '../../providers/users/global_user_provider.dart';
import '../views/address_form_view.dart';
import '../widgets/widgets/app_scaffold_wrapper.dart';

class AddressFormScreen extends ConsumerWidget {
  const AddressFormScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffoldWrapper(
      backgroundColor: AppColors.neutral100,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.neutral700,
          ),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          },
        ),
        title: const Text(
          'Agregar Dirección',
          style: TextStyle(
            color: AppColors.neutral900,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: AddressFormView(
            onAddressAdded: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: AppColors.white,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text('¡Dirección agregada correctamente!'),
                    ],
                  ),
                  backgroundColor: AppColors.success,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.all(16),
                ),
              );
            },
            onSaveAndContinue: () => _handleSaveAndContinue(context, ref),
          ),
        ),
      ),
    );
  }

  /// Maneja el flujo de guardar y continuar
  Future<void> _handleSaveAndContinue(
      BuildContext context, WidgetRef ref) async {
    final addressState = ref.read(addressFormNotifierProvider);
    final addressNotifier = ref.read(addressFormNotifierProvider.notifier);
    final globalUserNotifier = ref.read(globalUserNotifierProvider.notifier);

    try {
      // 1. Si hay una dirección actual válida sin guardar, guardarla primero
      if (addressState.isValid && !addressState.isSavingAddress) {
        final success = await addressNotifier.saveAddress();
        if (!success) {
          _showErrorSnackBar(context, 'Error al guardar la dirección actual');
          return;
        }
      }

      // 2. Obtener las direcciones guardadas (actualizadas después del guardado si aplica)
      final updatedAddressState = ref.read(addressFormNotifierProvider);
      final savedAddresses = updatedAddressState.savedAddresses;

      // 3. Validar que hay al menos una dirección
      if (savedAddresses.isEmpty) {
        _showErrorSnackBar(
            context, 'Debes agregar al menos una dirección para continuar');
        return;
      }

      // 4. Transferir todas las direcciones al usuario global
      globalUserNotifier.updateUserAddresses(savedAddresses);

      // 5. Mostrar mensaje de éxito
      _showSuccessSnackBar(context,
          '${savedAddresses.length} direcciones guardadas en tu perfil');

      // 6. Navegar al perfil
      context.go('/profile');
    } catch (e) {
      _showErrorSnackBar(context, 'Error inesperado: ${e.toString()}');
    }
  }

  void _showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check_circle,
              color: AppColors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(message),
          ],
        ),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: AppColors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}
