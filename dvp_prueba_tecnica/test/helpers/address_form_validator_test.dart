import 'package:dvp_prueba_tecnica/models/address_form_models.dart';
import 'package:dvp_prueba_tecnica/utils/address_form_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddressFormValidator', () {
    group('validateForm', () {
      test('should return true when all fields are selected', () {
        // Arrange
        const state = AddressFormState(
          selectedCountryId: 'country1',
          selectedDepartmentId: 'dept1',
          selectedMunicipalityId: 'muni1',
        );

        // Act
        final result = AddressFormValidator.validateForm(state);

        // Assert
        expect(result, true);
      });

      test('should return false when country is not selected', () {
        // Arrange
        const state = AddressFormState(
          selectedCountryId: null,
          selectedDepartmentId: 'dept1',
          selectedMunicipalityId: 'muni1',
        );

        // Act
        final result = AddressFormValidator.validateForm(state);

        // Assert
        expect(result, false);
      });

      test('should return false when department is not selected', () {
        // Arrange
        const state = AddressFormState(
          selectedCountryId: 'country1',
          selectedDepartmentId: null,
          selectedMunicipalityId: 'muni1',
        );

        // Act
        final result = AddressFormValidator.validateForm(state);

        // Assert
        expect(result, false);
      });

      test('should return false when municipality is not selected', () {
        // Arrange
        const state = AddressFormState(
          selectedCountryId: 'country1',
          selectedDepartmentId: 'dept1',
          selectedMunicipalityId: null,
        );

        // Act
        final result = AddressFormValidator.validateForm(state);

        // Assert
        expect(result, false);
      });

      test('should return false when no fields are selected', () {
        // Arrange
        const state = AddressFormState();

        // Act
        final result = AddressFormValidator.validateForm(state);

        // Assert
        expect(result, false);
      });
    });

    group('getValidationErrors', () {
      test('should return no errors when all fields are selected', () {
        // Arrange
        const state = AddressFormState(
          selectedCountryId: 'country1',
          selectedDepartmentId: 'dept1',
          selectedMunicipalityId: 'muni1',
        );

        // Act
        final errors = AddressFormValidator.getValidationErrors(state);

        // Assert
        expect(errors['countryError'], null);
        expect(errors['departmentError'], null);
        expect(errors['municipalityError'], null);
      });

      test('should return country error when country is not selected', () {
        // Arrange
        const state = AddressFormState(
          selectedCountryId: null,
          selectedDepartmentId: 'dept1',
          selectedMunicipalityId: 'muni1',
        );

        // Act
        final errors = AddressFormValidator.getValidationErrors(state);

        // Assert
        expect(errors['countryError'], 'Selecciona un país');
        expect(errors['departmentError'], null);
        expect(errors['municipalityError'], null);
      });

      test('should return all errors when no fields are selected', () {
        // Arrange
        const state = AddressFormState();

        // Act
        final errors = AddressFormValidator.getValidationErrors(state);

        // Assert
        expect(errors['countryError'], 'Selecciona un país');
        expect(errors['departmentError'], 'Selecciona un departamento');
        expect(errors['municipalityError'], 'Selecciona un municipio');
      });
    });
  });
}
