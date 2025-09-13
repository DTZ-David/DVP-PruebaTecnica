import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_step_provider.freezed.dart';
part 'form_step_provider.g.dart';

// Modelo para el estado de los pasos
@freezed
class FormStepState with _$FormStepState {
  const factory FormStepState({
    @Default(1) int currentStep,
    @Default(3) int totalSteps,
    @Default(['Usuario', 'Dirección', 'Perfil']) List<String> stepLabels,
    @Default(false) bool isUserFormCompleted,
    @Default(false) bool isAddressFormCompleted,
    @Default(false) bool isProfileFormCompleted,
  }) = _FormStepState;
}

// Provider para manejar el estado de los pasos
@riverpod
class FormStepNotifier extends _$FormStepNotifier {
  @override
  FormStepState build() {
    return const FormStepState();
  }

  // Avanzar al siguiente paso
  void nextStep() {
    if (state.currentStep < state.totalSteps) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  // Retroceder al paso anterior
  void previousStep() {
    if (state.currentStep > 1) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  // Ir a un paso específico
  void goToStep(int step) {
    if (step >= 1 && step <= state.totalSteps) {
      state = state.copyWith(currentStep: step);
    }
  }

  // Marcar el formulario de usuario como completado
  void completeUserForm() {
    state = state.copyWith(
      isUserFormCompleted: true,
      currentStep: 2, // Avanzar al paso 2
    );
  }

  // Marcar el formulario de dirección como completado
  void completeAddressForm() {
    state = state.copyWith(
      isAddressFormCompleted: true,
      currentStep: 3, // Avanzar al paso 3
    );
  }

  // Marcar el formulario de perfil como completado
  void completeProfileForm() {
    state = state.copyWith(
      isProfileFormCompleted: true,
    );
  }

  // Resetear todos los pasos
  void resetSteps() {
    state = const FormStepState();
  }
}

// Providers para validar si se puede avanzar/retroceder
@riverpod
bool canGoToNextStep(Ref ref) {
  final stepState = ref.watch(formStepNotifierProvider);
  return stepState.currentStep < stepState.totalSteps;
}

@riverpod
bool canGoToPreviousStep(Ref ref) {
  final stepState = ref.watch(formStepNotifierProvider);
  return stepState.currentStep > 1;
}
