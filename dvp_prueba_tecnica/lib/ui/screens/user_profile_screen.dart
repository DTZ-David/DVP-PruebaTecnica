import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../atomic_design/protons/colors.dart';
import '../../providers/users/global_user_provider.dart';
import '../../providers/stepper/form_step_provider.dart';
import '../views/user_profile_view.dart';
import '../widgets/userProfile/user_profile_dialogs.dart';
import '../widgets/userProfile/user_profile_service.dart';
import '../widgets/widgets/app_scaffold_wrapper.dart';
import '../widgets/widgets/step_indicator_widget.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.read(globalUserNotifierProvider.notifier);
    final profileService = UserProfileService(ref);
    final stepState = ref.watch(formStepNotifierProvider);

    return AppScaffoldWrapper(
      backgroundColor: AppColors.backgroundPrimary,
      // ALTERNATIVA: Usar AppBar normal con navegación personalizada
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.neutral700,
          ),
          onPressed: () => _handleBackNavigation(context, ref),
        ),
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
          // Botones de reset y export
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'reset':
                  UserProfileDialogs.showResetDialog(context, userNotifier);
                  break;
                case 'export':
                  _showExportSnackBar(context);
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'reset',
                child: Row(
                  children: [
                    Icon(Icons.refresh, size: 20),
                    SizedBox(width: 8),
                    Text('Resetear'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'export',
                child: Row(
                  children: [
                    Icon(Icons.download, size: 20),
                    SizedBox(width: 8),
                    Text('Exportar'),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // AGREGAR: StepIndicator si venimos del flujo de registro
              if (stepState.currentStep >
                  1) // Solo mostrar si estamos en el flujo del stepper
                StepIndicator(
                  currentStep: stepState.currentStep,
                  totalSteps: stepState.totalSteps,
                  stepLabels: stepState.stepLabels,
                ),
              UserProfileView(
                onAddNewAddress: () {
                  // CAMBIO: Usar push en lugar de go para mantener historial
                  context.push('/address-form');
                },
                onEditUser: () {
                  // CAMBIO: Usar push en lugar de go para mantener historial
                  context.push('/user_form');
                },
                onDeleteAddress: (addressId) =>
                    UserProfileDialogs.showDeleteAddressDialog(
                  context,
                  addressId,
                  userNotifier,
                ),
                onCompleteProfile: () =>
                    profileService.completeProfile(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // NUEVO MÉTODO: Manejar navegación hacia atrás
  void _handleBackNavigation(BuildContext context, WidgetRef ref) {
    final stepNotifier = ref.read(formStepNotifierProvider.notifier);
    final stepState = ref.read(formStepNotifierProvider);

    // Si estamos en el flujo del stepper (currentStep > 1), manejar según el contexto
    if (stepState.currentStep > 1) {
      // Retroceder en el stepper (de paso 3 a paso 2)
      stepNotifier.previousStep();

      if (context.canPop()) {
        context.pop(); // Regresa a AddressFormScreen
      } else {
        // Fallback
        context.go('/address-form');
      }
    } else {
      // Si no estamos en el flujo del stepper, simplemente ir al home
      if (context.canPop()) {
        context.pop();
      } else {
        context.go('/');
      }
    }
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
