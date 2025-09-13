import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../atomic_design/protons/colors.dart';
import '../../models/user_model.dart';
import '../../providers/users/users_list_provider.dart';
import '../../providers/users/global_user_provider.dart';
import '../views/home_view.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      floatingActionButton:
          _AddUserFAB(onPressed: () => _startUserCreationFlow(context, ref)),
      body: SafeArea(
        child: HomeView(
          onAddUser: () => _startUserCreationFlow(context, ref),
          onUserTap: (user) => _viewUserProfile(context, ref, user),
          onDeleteUser: (userId) => _showDeleteUserDialog(context, ref, userId),
        ),
      ),
    );
  }

  void _startUserCreationFlow(BuildContext context, WidgetRef ref) {
    ref.read(globalUserNotifierProvider.notifier).resetUser();
    context.go('/user_form');
  }

  void _viewUserProfile(BuildContext context, WidgetRef ref, User user) {
    ref.read(globalUserNotifierProvider.notifier).setUser(user);
    context.go('/profile');
  }

  void _showDeleteUserDialog(
      BuildContext context, WidgetRef ref, String userId) {
    final usersState = ref.read(usersListNotifierProvider);
    final user = usersState.users.firstWhere(
      (u) => u.id == userId,
      orElse: () => throw Exception('Usuario no encontrado'),
    );

    showDialog(
      context: context,
      builder: (dialogContext) => _DeleteUserDialog(
        user: user,
        onConfirm: () async {
          Navigator.of(dialogContext).pop();
          await _deleteUser(
              context, ref, userId, '${user.firstName} ${user.lastName}');
        },
        onCancel: () => Navigator.of(dialogContext).pop(),
      ),
    );
  }

  Future<void> _deleteUser(BuildContext context, WidgetRef ref, String userId,
      String userName) async {
    try {
      await ref.read(usersListNotifierProvider.notifier).deleteUser(userId);
      if (context.mounted) {
        _showSuccessSnackBar(context, '$userName eliminado correctamente');
      }
    } catch (e) {
      if (context.mounted) {
        _showErrorSnackBar(context, 'Error eliminando usuario: $e');
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
            Expanded(child: Text(message)),
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
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: AppColors.white, size: 20),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}

// FloatingActionButton para agregar usuario
class _AddUserFAB extends StatelessWidget {
  final VoidCallback onPressed;

  const _AddUserFAB({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: AppColors.primary500,
      foregroundColor: AppColors.white,
      elevation: 8,
      icon: const Icon(Icons.person_add_outlined),
      label: const Text(
        'Nuevo Usuario',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

// Dialog de confirmación para eliminar usuario
class _DeleteUserDialog extends StatelessWidget {
  final User user;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const _DeleteUserDialog({
    required this.user,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: const Row(
        children: [
          Icon(Icons.warning_outlined, color: AppColors.error, size: 24),
          SizedBox(width: 12),
          Text('Eliminar Usuario'),
        ],
      ),
      content: Text(
        '¿Estás seguro de que deseas eliminar a "${user.firstName} ${user.lastName}"? Esta acción no se puede deshacer.',
        style: const TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: const Text(
            'Cancelar',
            style: TextStyle(color: AppColors.neutral600),
          ),
        ),
        ElevatedButton(
          onPressed: onConfirm,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.error,
            foregroundColor: AppColors.white,
          ),
          child: const Text('Eliminar'),
        ),
      ],
    );
  }
}
