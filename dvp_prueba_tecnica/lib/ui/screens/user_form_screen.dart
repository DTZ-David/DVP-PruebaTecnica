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
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ✅ CORRECCIÓN: Eliminar el Consumer innecesario
              StepIndicator(
                currentStep: stepState.currentStep,
                totalSteps: stepState.totalSteps,
                stepLabels: stepState.stepLabels,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: UserFormView(
                  onFormSubmitted: () {
                    // Completar el formulario de usuario
                    stepNotifier.completeUserForm();

                    // Navegar al siguiente paso
                    context.go('/address-form');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
