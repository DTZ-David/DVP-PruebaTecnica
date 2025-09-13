// ignore_for_file: implicit_call_tearoffs

import 'package:dvp_prueba_tecnica/atomic_design/atoms/primary_button.dart';
import 'package:dvp_prueba_tecnica/models/address_form_models.dart';
import 'package:dvp_prueba_tecnica/ui/widgets/address/address_action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Mock para el callback
class MockCallback extends Mock {
  void call();
}

void main() {
  group('AddressActionButtons', () {
    late MockCallback mockOnAddAnother;
    late MockCallback mockOnSaveAndContinueAction;
    late MockCallback mockOnAddressAdded;
    late MockCallback mockOnSaveAndContinue;

    setUp(() {
      mockOnAddAnother = MockCallback();
      mockOnSaveAndContinueAction = MockCallback();
      mockOnAddressAdded = MockCallback();
      mockOnSaveAndContinue = MockCallback();
    });

    Widget createWidget(AddressFormState addressState) {
      return MaterialApp(
        home: Scaffold(
          body: AddressActionButtons(
            addressState: addressState,
            onAddAnother: mockOnAddAnother,
            onSaveAndContinueAction: mockOnSaveAndContinueAction,
            onAddressAdded: mockOnAddressAdded,
            onSaveAndContinue: mockOnSaveAndContinue,
          ),
        ),
      );
    }

    testWidgets('renderiza correctamente con estado válido',
        (WidgetTester tester) async {
      // Arrange
      const addressState = AddressFormState(
        isValid: true,
        isSavingAddress: false,
        savedAddresses: [],
      );

      // Act
      await tester.pumpWidget(createWidget(addressState));

      // Assert
      expect(find.text('Agregar otra dirección'), findsOneWidget);
      expect(find.text('Guardar dirección y continuar'), findsOneWidget);
      expect(find.byType(PrimaryButton), findsNWidgets(2));
    });

    testWidgets('muestra "Guardando..." cuando está guardando',
        (WidgetTester tester) async {
      // Arrange
      const addressState = AddressFormState(
        isValid: true,
        isSavingAddress: true,
        savedAddresses: [],
      );

      // Act
      await tester.pumpWidget(createWidget(addressState));

      // Assert
      expect(find.text('Guardando...'), findsNWidgets(2)); // Ambos botones

      // Verifica que los botones estén deshabilitados
      final addAnotherButton = tester.widget<PrimaryButton>(
        find.byType(PrimaryButton).first,
      );
      final continueButton = tester.widget<PrimaryButton>(
        find.byType(PrimaryButton).last,
      );

      expect(addAnotherButton.isDisabled, true);
      expect(continueButton.isDisabled, true);
      expect(addAnotherButton.isLoading, true);
      expect(continueButton.isLoading, true);
    });

    testWidgets('muestra "Continuar" cuando hay direcciones guardadas',
        (WidgetTester tester) async {
      const addressState = AddressFormState(
        isValid: false,
        isSavingAddress: false,
      );

      // Act
      await tester.pumpWidget(createWidget(addressState));

      // Assert
      expect(find.text('Continuar'), findsOneWidget);
    });

    testWidgets('botones deshabilitados cuando el estado no es válido',
        (WidgetTester tester) async {
      // Arrange
      const addressState = AddressFormState(
        isValid: false,
        isSavingAddress: false,
        savedAddresses: [],
      );

      // Act
      await tester.pumpWidget(createWidget(addressState));

      // Assert
      final addAnotherButton = tester.widget<PrimaryButton>(
        find.byType(PrimaryButton).first,
      );
      final continueButton = tester.widget<PrimaryButton>(
        find.byType(PrimaryButton).last,
      );

      expect(addAnotherButton.isDisabled, true);
      expect(continueButton.isDisabled, true);
    });

    testWidgets('ejecuta callback cuando se toca "Agregar otra dirección"',
        (WidgetTester tester) async {
      // Arrange
      const addressState = AddressFormState(
        isValid: true,
        isSavingAddress: false,
        savedAddresses: [],
      );

      await tester.pumpWidget(createWidget(addressState));

      // Act
      await tester.tap(find.text('Agregar otra dirección'));
      await tester.pump();

      // Assert
      verify(mockOnAddAnother()).called(1);
    });

    testWidgets('ejecuta callback cuando se toca botón de continuar',
        (WidgetTester tester) async {
      // Arrange
      const addressState = AddressFormState(
        isValid: true,
        isSavingAddress: false,
        savedAddresses: [],
      );

      await tester.pumpWidget(createWidget(addressState));

      // Act
      await tester.tap(find.text('Guardar dirección y continuar'));
      await tester.pump();

      // Assert
      verify(mockOnSaveAndContinueAction()).called(1);
    });

    testWidgets('no ejecuta callbacks cuando los botones están deshabilitados',
        (WidgetTester tester) async {
      // Arrange
      const addressState = AddressFormState(
        isValid: false,
        isSavingAddress: false,
        savedAddresses: [],
      );

      await tester.pumpWidget(createWidget(addressState));

      // Act - Intenta tocar los botones (pero están deshabilitados)
      await tester.tap(find.text('Agregar otra dirección'));
      await tester.tap(find.text('Guardar dirección y continuar'));
      await tester.pump();

      // Assert - Los callbacks no deberían haberse ejecutado
      verifyNever(mockOnAddAnother());
      verifyNever(mockOnSaveAndContinueAction());
    });
  });
}
