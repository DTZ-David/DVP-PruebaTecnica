import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../atomic_design/protons/colors.dart';
import '../../../providers/users/global_user_provider.dart';
import '../../../providers/users/users_list_provider.dart';

class UserProfileService {
  final WidgetRef ref;

  UserProfileService(this.ref);

  Future<void> completeProfile(BuildContext context) async {
    final userNotifier = ref.read(globalUserNotifierProvider.notifier);
    final currentUser = ref.read(globalUserNotifierProvider).currentUser;

    if (currentUser == null) {
      _showErrorSnackBar(context, 'Error: No hay usuario para completar');
      return;
    }

    try {
      await ref.read(usersListNotifierProvider.notifier).addUser(currentUser);

      userNotifier.markProfileAsCompleted();

      if (context.mounted) {
        context.go('/');
        _showSuccessSnackBar(
          context,
          '¡Perfil completado y guardado exitosamente!',
        );
      }
    } catch (e) {
      if (context.mounted) {
        _showErrorSnackBar(context, 'Error al guardar perfil: $e');
      }
    }
  }

  void _showSuccessSnackBar(BuildContext context, String message) {
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
      ),
    );
  }
}
