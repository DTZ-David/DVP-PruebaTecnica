// Dialog de confirmación para eliminar usuario
import 'package:flutter/material.dart';

import '../../../atomic_design/protons/colors.dart';
import '../../../models/user_model.dart';

class DeleteUserDialog extends StatelessWidget {
  final User user;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const DeleteUserDialog({
    super.key,
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
