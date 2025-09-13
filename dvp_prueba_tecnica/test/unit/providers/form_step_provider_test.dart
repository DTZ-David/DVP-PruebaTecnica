import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dvp_prueba_tecnica/providers/stepper/form_step_provider.dart';

void main() {
  group('FormStepProvider', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    group('Initial State', () {
      test('should have correct initial state', () {
        // Act
        final state = container.read(formStepNotifierProvider);

        // Assert
        expect(state.currentStep, equals(1));
        expect(state.totalSteps, equals(3));
        expect(state.stepLabels, equals(['Usuario', 'Dirección', 'Perfil']));
        expect(state.isUserFormCompleted, isFalse);
        expect(state.isAddressFormCompleted, isFalse);
        expect(state.isProfileFormCompleted, isFalse);
      });
    });

    group('Step Navigation', () {
      test('nextStep should advance to next step when possible', () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);

        // Act
        notifier.nextStep();
        final state = container.read(formStepNotifierProvider);

        // Assert
        expect(state.currentStep, equals(2));
      });

      test('nextStep should not advance beyond total steps', () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);

        // Avanzar hasta el último paso
        notifier.goToStep(3);

        // Act
        notifier.nextStep();
        final state = container.read(formStepNotifierProvider);

        // Assert
        expect(state.currentStep, equals(3)); // Se mantiene en 3
      });

      test('previousStep should go back to previous step when possible', () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);

        // Avanzar primero al paso 2
        notifier.nextStep();

        // Act
        notifier.previousStep();
        final state = container.read(formStepNotifierProvider);

        // Assert
        expect(state.currentStep, equals(1));
      });

      test('previousStep should not go below step 1', () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);

        // Act
        notifier.previousStep();
        final state = container.read(formStepNotifierProvider);

        // Assert
        expect(state.currentStep, equals(1)); // Se mantiene en 1
      });

      test('goToStep should navigate to valid step', () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);

        // Act
        notifier.goToStep(3);
        final state = container.read(formStepNotifierProvider);

        // Assert
        expect(state.currentStep, equals(3));
      });

      test('goToStep should ignore invalid step numbers', () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);

        // Act - Intentar ir a paso inválido
        notifier.goToStep(0);
        var state = container.read(formStepNotifierProvider);

        // Assert
        expect(state.currentStep, equals(1)); // Se mantiene en 1

        // Act - Intentar ir a paso mayor al total
        notifier.goToStep(5);
        state = container.read(formStepNotifierProvider);

        // Assert
        expect(state.currentStep, equals(1)); // Se mantiene en 1
      });
    });

    group('Form Completion', () {
      test(
          'completeUserForm should mark user form as completed and advance to step 2',
          () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);

        // Act
        notifier.completeUserForm();
        final state = container.read(formStepNotifierProvider);

        // Assert
        expect(state.isUserFormCompleted, isTrue);
        expect(state.currentStep, equals(2));
        expect(state.isAddressFormCompleted, isFalse);
        expect(state.isProfileFormCompleted, isFalse);
      });

      test(
          'completeAddressForm should mark address form as completed and advance to step 3',
          () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);

        // Act
        notifier.completeAddressForm();
        final state = container.read(formStepNotifierProvider);

        // Assert
        expect(state.isAddressFormCompleted, isTrue);
        expect(state.currentStep, equals(3));
        expect(state.isUserFormCompleted, isFalse);
        expect(state.isProfileFormCompleted, isFalse);
      });

      test(
          'completeProfileForm should mark profile form as completed without changing step',
          () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);

        // Primero ir al paso 3
        notifier.goToStep(3);

        // Act
        notifier.completeProfileForm();
        final state = container.read(formStepNotifierProvider);

        // Assert
        expect(state.isProfileFormCompleted, isTrue);
        expect(state.currentStep, equals(3)); // Se mantiene en paso 3
        expect(state.isUserFormCompleted, isFalse);
        expect(state.isAddressFormCompleted, isFalse);
      });

      test('should handle completing forms in sequence', () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);

        // Act - Completar formularios en orden
        notifier.completeUserForm();
        var state = container.read(formStepNotifierProvider);

        // Assert después del primer formulario
        expect(state.isUserFormCompleted, isTrue);
        expect(state.currentStep, equals(2));

        // Act - Completar segundo formulario
        notifier.completeAddressForm();
        state = container.read(formStepNotifierProvider);

        // Assert después del segundo formulario
        expect(state.isAddressFormCompleted, isTrue);
        expect(state.currentStep, equals(3));
        expect(state.isUserFormCompleted, isTrue); // Sigue siendo true

        // Act - Completar tercer formulario
        notifier.completeProfileForm();
        state = container.read(formStepNotifierProvider);

        // Assert después del tercer formulario
        expect(state.isProfileFormCompleted, isTrue);
        expect(state.currentStep, equals(3));
        expect(state.isUserFormCompleted, isTrue);
        expect(state.isAddressFormCompleted, isTrue);
      });

      test('completeUserForm from any step should advance to step 2', () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);

        // Ir al paso 3 primero
        notifier.goToStep(3);

        // Act
        notifier.completeUserForm();
        final state = container.read(formStepNotifierProvider);

        // Assert
        expect(state.isUserFormCompleted, isTrue);
        expect(state.currentStep,
            equals(2)); // Debe ir a paso 2 independientemente del paso actual
      });

      test('completeAddressForm from any step should advance to step 3', () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);

        // Quedarse en paso 1
        expect(container.read(formStepNotifierProvider).currentStep, equals(1));

        // Act
        notifier.completeAddressForm();
        final state = container.read(formStepNotifierProvider);

        // Assert
        expect(state.isAddressFormCompleted, isTrue);
        expect(state.currentStep,
            equals(3)); // Debe ir a paso 3 independientemente del paso actual
      });
    });

    group('Reset Functionality', () {
      test('resetSteps should restore initial state', () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);

        // Modificar el estado
        notifier.completeUserForm();
        notifier.completeAddressForm();
        notifier.completeProfileForm();

        // Verificar que el estado cambió
        var state = container.read(formStepNotifierProvider);
        expect(state.isUserFormCompleted, isTrue);
        expect(state.isAddressFormCompleted, isTrue);
        expect(state.isProfileFormCompleted, isTrue);
        expect(state.currentStep, equals(3));

        // Act
        notifier.resetSteps();
        state = container.read(formStepNotifierProvider);

        // Assert
        expect(state.currentStep, equals(1));
        expect(state.totalSteps, equals(3));
        expect(state.stepLabels, equals(['Usuario', 'Dirección', 'Perfil']));
        expect(state.isUserFormCompleted, isFalse);
        expect(state.isAddressFormCompleted, isFalse);
        expect(state.isProfileFormCompleted, isFalse);
      });
    });

    group('Navigation Computed Providers', () {
      test('canGoToNextStep should return true when not on last step', () {
        // Arrange - Estado inicial (paso 1)

        // Act
        final canGoNext = container.read(canGoToNextStepProvider);

        // Assert
        expect(canGoNext, isTrue);
      });

      test('canGoToNextStep should return false when on last step', () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);
        notifier.goToStep(3); // Último paso

        // Act
        final canGoNext = container.read(canGoToNextStepProvider);

        // Assert
        expect(canGoNext, isFalse);
      });

      test('canGoToPreviousStep should return false when on first step', () {
        // Arrange - Estado inicial (paso 1)

        // Act
        final canGoPrevious = container.read(canGoToPreviousStepProvider);

        // Assert
        expect(canGoPrevious, isFalse);
      });

      test('canGoToPreviousStep should return true when not on first step', () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);
        notifier.goToStep(2);

        // Act
        final canGoPrevious = container.read(canGoToPreviousStepProvider);

        // Assert
        expect(canGoPrevious, isTrue);
      });

      test('navigation providers should update correctly as steps change', () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);

        // Paso 1 - Inicial
        expect(container.read(canGoToPreviousStepProvider), isFalse);
        expect(container.read(canGoToNextStepProvider), isTrue);

        // Paso 2 - Intermedio
        notifier.nextStep();
        expect(container.read(canGoToPreviousStepProvider), isTrue);
        expect(container.read(canGoToNextStepProvider), isTrue);

        // Paso 3 - Final
        notifier.nextStep();
        expect(container.read(canGoToPreviousStepProvider), isTrue);
        expect(container.read(canGoToNextStepProvider), isFalse);
      });
    });

    group('Edge Cases and Complex Scenarios', () {
      test('should handle multiple rapid navigation calls', () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);

        // Act - Múltiples llamadas rápidas
        notifier.nextStep();
        notifier.nextStep();
        notifier.nextStep();
        notifier.nextStep(); // Intento de ir más allá del límite

        final state = container.read(formStepNotifierProvider);

        // Assert
        expect(state.currentStep, equals(3)); // No debe pasar del máximo
      });

      test('should handle multiple rapid backward navigation calls', () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);

        // Ir al último paso primero
        notifier.goToStep(3);

        // Act - Múltiples llamadas hacia atrás
        notifier.previousStep();
        notifier.previousStep();
        notifier.previousStep();
        notifier.previousStep(); // Intento de ir más atrás del límite

        final state = container.read(formStepNotifierProvider);

        // Assert
        expect(
            state.currentStep, equals(1)); // No debe ir por debajo del mínimo
      });

      test('should maintain form completion status during navigation', () {
        // Arrange
        final notifier = container.read(formStepNotifierProvider.notifier);

        // Completar formularios
        notifier.completeUserForm();
        notifier.completeProfileForm();

        // Act - Navegar hacia atrás
        notifier.previousStep();

        final state = container.read(formStepNotifierProvider);

        // Assert
        expect(state.currentStep, equals(1));
        expect(state.isUserFormCompleted, isTrue); // Estado se mantiene
        expect(state.isProfileFormCompleted, isTrue); // Estado se mantiene
      });
    });
  });
}
