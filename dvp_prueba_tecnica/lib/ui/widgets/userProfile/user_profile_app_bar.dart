import 'package:flutter/material.dart';
import '../../../atomic_design/protons/colors.dart';

class UserProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onReset;
  final VoidCallback onExport;

  const UserProfileAppBar({
    super.key,
    required this.onReset,
    required this.onExport,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: const Text(
        'Perfil de Usuario',
        style: TextStyle(
          color: AppColors.neutral900,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(
            Icons.more_vert,
            color: AppColors.neutral700,
          ),
          onSelected: (value) {
            switch (value) {
              case 'reset':
                onReset();
                break;
              case 'export':
                onExport();
                break;
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'export',
              child: Row(
                children: [
                  Icon(Icons.download_outlined, size: 20),
                  SizedBox(width: 12),
                  Text('Exportar datos'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'reset',
              child: Row(
                children: [
                  Icon(Icons.refresh_outlined,
                      size: 20, color: AppColors.error),
                  SizedBox(width: 12),
                  Text('Reiniciar datos',
                      style: TextStyle(color: AppColors.error)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
