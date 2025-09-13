import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../atomic_design/protons/colors.dart';
import '../../../providers/users/global_user_provider.dart';

class UserProfileDialogs {
  static void showDeleteAddressDialog(
    BuildContext context,
    String addressId,
    GlobalUserNotifier userNotifier,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Row(
            children: [
              Icon(
                Icons.warning_outlined,
                color: AppColors.warning,
                size: 24,
              ),
              SizedBox(width: 12),
              Text('Eliminar Dirección'),
            ],
          ),
          content: const Text(
            '¿Estás seguro de que deseas eliminar esta dirección? Esta acción no se puede deshacer.',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text(
                'Cancelar',
                style: TextStyle(color: AppColors.neutral600),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                userNotifier.removeAddressFromUser(addressId);
                Navigator.of(dialogContext).pop();
                _showSuccessSnackBar(
                  context,
                  'Dirección eliminada correctamente',
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error,
                foregroundColor: AppColors.white,
              ),
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }

  static void showResetDialog(
    BuildContext context,
    GlobalUserNotifier userNotifier,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Row(
            children: [
              Icon(
                Icons.warning_outlined,
                color: AppColors.error,
                size: 24,
              ),
              SizedBox(width: 12),
              Text('Reiniciar Datos'),
            ],
          ),
          content: const Text(
            '¿Estás seguro de que deseas eliminar todos los datos del usuario? Esta acción no se puede deshacer y tendrás que volver a llenar toda la información.',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text(
                'Cancelar',
                style: TextStyle(color: AppColors.neutral600),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                userNotifier.resetUser();
                Navigator.of(dialogContext).pop();
                context.go('/');
                _showInfoSnackBar(
                  context,
                  'Datos reiniciados. Puedes comenzar de nuevo.',
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error,
                foregroundColor: AppColors.white,
              ),
              child: const Text('Reiniciar'),
            ),
          ],
        );
      },
    );
  }

  static void _showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: AppColors.white, size: 20),
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

  static void _showInfoSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.info_outline, color: AppColors.white, size: 20),
            const SizedBox(width: 8),
            Text(message),
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
