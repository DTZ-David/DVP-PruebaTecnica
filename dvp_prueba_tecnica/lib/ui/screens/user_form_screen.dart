import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../atomic_design/protons/colors.dart';
import '../../providers/stepper/form_step_provider.dart';
import '../views/user_form_view.dart';
import '../widgets/widgets/step_indicator_widget.dart';

class UserFormScreen extends ConsumerWidget {
  const UserFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepState = ref.watch(formStepNotifierProvider);
    final stepNotifier = ref.read(formStepNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Crear Usuario'),
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.neutral700,
          ),
          onPressed: () => _handleBackNavigation(context, ref),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StepIndicator(
                currentStep: stepState.currentStep,
                totalSteps: stepState.totalSteps,
                stepLabels: stepState.stepLabels,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: UserFormView(
                  onFormSubmitted: () {
                    // Completar el formulario de usuario (esto actualiza currentStep a 2)
                    stepNotifier.completeUserForm();

                    // CAMBIO IMPORTANTE: Usar push en lugar de go para mantener el historial
                    context.push('/address-form');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleBackNavigation(BuildContext context, WidgetRef ref) {
    final stepNotifier = ref.read(formStepNotifierProvider.notifier);

    // Resetear el stepper al volver al home
    stepNotifier.resetSteps();

    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/');
    }
  }
}
