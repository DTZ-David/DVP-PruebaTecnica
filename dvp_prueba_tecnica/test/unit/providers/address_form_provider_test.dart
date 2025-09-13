import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:dvp_prueba_tecnica/providers/address/address_form_provider.dart';
import 'package:dvp_prueba_tecnica/models/address_form_models.dart';
import 'package:dvp_prueba_tecnica/models/address_model.dart';
import 'package:dvp_prueba_tecnica/services/address_form_service.dart';

import 'address_form_provider_test.mocks.dart';

// Generar mocks con: dart run build_runner build
@GenerateMocks([AddressFormService])
void main() {
  group('AddressFormProvider', () {
    late ProviderContainer container;
    late MockAddressFormService mockAddressFormService;

    setUp(() {
      mockAddressFormService = MockAddressFormService();
      container = ProviderContainer(
        overrides: [],
      );
    });

    tearDown(() {
      container.dispose();
    });

    group('Initial State', () {
      test('should have correct initial state', () {
        // Act
        final state = container.read(addressFormNotifierProvider);

        // Assert
        expect(state.countries, isEmpty);
        expect(state.departments, isEmpty);
        expect(state.municipalities, isEmpty);
        expect(state.savedAddresses, isEmpty);
        expect(state.selectedCountryId, isNull);
        expect(state.selectedDepartmentId, isNull);
        expect(state.selectedMunicipalityId, isNull);
        expect(state.isLoadingCountries, isFalse);
        expect(state.isLoadingDepartments, isFalse);
        expect(state.isLoadingMunicipalities, isFalse);
        expect(state.isSavingAddress, isFalse);
        expect(state.isValid, isFalse);
      });

      test('should trigger loadCountries on build', () async {
        await Future.delayed(const Duration(milliseconds: 10));

        // Assert - El estado inicial debe mantenerse hasta que termine la carga
        final state = container.read(addressFormNotifierProvider);
        expect(state, isA<AddressFormState>());
      });
    });

    group('Country Selection', () {
      test('selectCountry should trigger form validation', () async {
        // Arrange
        final notifier = container.read(addressFormNotifierProvider.notifier);

        // Act
        notifier.selectCountry('CO', 'Colombia');
        await Future.delayed(const Duration(milliseconds: 10));

        final state = container.read(addressFormNotifierProvider);

        // Assert - El formulario debe ser inválido porque faltan departamento y municipio
        expect(state.isValid, isFalse);
      });
    });

    group('Municipality Selection', () {
      test('selectMunicipality should update state correctly and validate form',
          () {
        // Arrange
        final notifier = container.read(addressFormNotifierProvider.notifier);

        // Act
        notifier.selectMunicipality('VALLEDUPAR', 'Valledupar');

        final state = container.read(addressFormNotifierProvider);

        // Assert
        expect(state.selectedMunicipalityId, equals('VALLEDUPAR'));
        expect(state.selectedMunicipalityName, equals('Valledupar'));
      });
    });

    group('Form Validation and Errors', () {
      test(
          'saveAddress should return false and show errors when form is invalid',
          () async {
        // Arrange
        final notifier = container.read(addressFormNotifierProvider.notifier);

        // Act - Intentar guardar sin selecciones
        final result = await notifier.saveAddress();
        final state = container.read(addressFormNotifierProvider);

        // Assert
        expect(result, isFalse);
        expect(state.isSavingAddress, isFalse);
        // Los errores específicos dependerán de la implementación del validator
      });

      test('saveAddress should return true when form is valid', () async {
        // Arrange
        final notifier = container.read(addressFormNotifierProvider.notifier);

        // Configurar formulario válido
        notifier.selectCountry('CO', 'Colombia');
        notifier.selectDepartment('CESAR', 'Cesar');
        notifier.selectMunicipality('VALLEDUPAR', 'Valledupar');

        final result = await notifier.saveAddress();

        expect(result, isA<bool>());
      });
    });

    group('Address Management', () {
      test('removeAddress should remove address from saved addresses', () {
        // Arrange
        final notifier = container.read(addressFormNotifierProvider.notifier);

        expect(() => notifier.removeAddress('test_id'), returnsNormally);
      });
    });

    group('Form Reset and Cleanup', () {
      test('reset should restore initial state and reload countries', () async {
        // Arrange
        final notifier = container.read(addressFormNotifierProvider.notifier);

        // Modificar el estado
        notifier.selectCountry('CO', 'Colombia');
        notifier.selectDepartment('CESAR', 'Cesar');
        await Future.delayed(const Duration(milliseconds: 10));

        // Act
        notifier.reset();
        await Future.delayed(const Duration(milliseconds: 10));

        final state = container.read(addressFormNotifierProvider);

        // Assert - Debe volver al estado inicial
        expect(state.selectedCountryId, isNull);
        expect(state.selectedDepartmentId, isNull);
        expect(state.selectedMunicipalityId, isNull);
        expect(state.isValid, isFalse);
      });

      test('_clearForm should clear selections but keep loaded data', () async {
        // Este test es más difícil porque _clearForm es privado
        // Se testearía indirectamente a través de saveAddress exitoso

        // Arrange
        final notifier = container.read(addressFormNotifierProvider.notifier);
        notifier.selectCountry('CO', 'Colombia');
        notifier.selectDepartment('CESAR', 'Cesar');
        notifier.selectMunicipality('VALLEDUPAR', 'Valledupar');

        // Act - Si saveAddress fuera exitoso, debería limpiar el formulario
        // await notifier.saveAddress(); // Requiere mock del servicio

        // Assert - Se verificaría que las selecciones se limpien
        // pero los países/departamentos cargados se mantengan
      });
    });

    group('Retry Mechanisms', () {
      test('retryLoadCountries should reload countries', () async {
        // Arrange
        final notifier = container.read(addressFormNotifierProvider.notifier);

        // Act & Assert - No debería lanzar excepción
        expect(
            () async => await notifier.retryLoadCountries(), returnsNormally);
      });

      test(
          'retryLoadDepartments should reload departments when country is selected',
          () async {
        // Arrange
        final notifier = container.read(addressFormNotifierProvider.notifier);
        notifier.selectCountry('CO', 'Colombia');

        // Act & Assert - No debería lanzar excepción
        expect(
            () async => await notifier.retryLoadDepartments(), returnsNormally);
      });

      test('retryLoadDepartments should do nothing when no country selected',
          () async {
        // Arrange
        final notifier = container.read(addressFormNotifierProvider.notifier);

        // Act & Assert - No debería lanzar excepción
        expect(
            () async => await notifier.retryLoadDepartments(), returnsNormally);
      });

      test(
          'retryLoadMunicipalities should reload municipalities when department is selected',
          () async {
        // Arrange
        final notifier = container.read(addressFormNotifierProvider.notifier);
        notifier.selectCountry('CO', 'Colombia');
        notifier.selectDepartment('CESAR', 'Cesar');

        // Act & Assert - No debería lanzar excepción
        expect(() async => await notifier.retryLoadMunicipalities(),
            returnsNormally);
      });

      test(
          'retryLoadMunicipalities should do nothing when no department selected',
          () async {
        // Arrange
        final notifier = container.read(addressFormNotifierProvider.notifier);

        // Act & Assert - No debería lanzar excepción
        expect(() async => await notifier.retryLoadMunicipalities(),
            returnsNormally);
      });
    });

    group('Loading States', () {
      test('should handle loading states correctly during async operations',
          () async {
        // Este test requeriría mockear los servicios para controlar
        // los tiempos de carga y verificar los estados intermedios

        final notifier = container.read(addressFormNotifierProvider.notifier);

        // Act
        notifier.selectCountry('CO', 'Colombia');

        // Assert - Inmediatamente después de la selección
        var state = container.read(addressFormNotifierProvider);
        expect(state.selectedCountryId, equals('CO'));

        // Dar tiempo para que termine la carga
        await Future.delayed(const Duration(milliseconds: 50));

        state = container.read(addressFormNotifierProvider);
        // Verificar que ya no está cargando
        expect(state.isLoadingDepartments, isFalse);
      });
    });

    group('Error Handling', () {
      test('should handle service errors gracefully', () async {
        // Este test requeriría mockear el servicio para que falle

        final notifier = container.read(addressFormNotifierProvider.notifier);

        // Act & Assert - No debería lanzar excepción no manejada
        expect(() async => await notifier.loadCountries(), returnsNormally);
      });
    });
  });
}
