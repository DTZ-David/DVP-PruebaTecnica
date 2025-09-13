import 'package:dvp_prueba_tecnica/utils/user_form_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserFormValidator', () {
    group('validateFirstName', () {
      test('should return null for valid name', () {
        // Act
        final result = UserFormValidator.validateFirstName('Juan Carlos');

        // Assert
        expect(result, null);
      });

      test('should return error for empty name', () {
        // Act
        final result = UserFormValidator.validateFirstName('');

        // Assert
        expect(result, 'El nombre es requerido');
      });

      test('should return error for whitespace only', () {
        // Act
        final result = UserFormValidator.validateFirstName('   ');

        // Assert
        expect(result, 'El nombre es requerido');
      });

      test('should return error for name too short', () {
        // Act
        final result = UserFormValidator.validateFirstName('A');

        // Assert
        expect(result, 'El nombre debe tener al menos 2 caracteres');
      });

      test('should return error for name too long', () {
        // Act
        final result = UserFormValidator.validateFirstName('A' * 51);

        // Assert
        expect(result, 'El nombre no puede exceder 50 caracteres');
      });

      test('should return error for invalid characters', () {
        // Act
        final result = UserFormValidator.validateFirstName('Juan123');

        // Assert
        expect(result, 'Solo se permiten letras y espacios');
      });

      test('should accept accented characters', () {
        // Act
        final result = UserFormValidator.validateFirstName('José María');

        // Assert
        expect(result, null);
      });

      test('should accept ñ character', () {
        // Act
        final result = UserFormValidator.validateFirstName('Niño');

        // Assert
        expect(result, null);
      });
    });

    group('validateLastName', () {
      test('should return null for valid lastname', () {
        // Act
        final result = UserFormValidator.validateLastName('Pérez González');

        // Assert
        expect(result, null);
      });

      test('should return error for empty lastname', () {
        // Act
        final result = UserFormValidator.validateLastName('');

        // Assert
        expect(result, 'El apellido es requerido');
      });

      test('should return error for lastname too short', () {
        // Act
        final result = UserFormValidator.validateLastName('P');

        // Assert
        expect(result, 'El apellido debe tener al menos 2 caracteres');
      });

      test('should return error for invalid characters in lastname', () {
        // Act
        final result = UserFormValidator.validateLastName('Pérez@123');

        // Assert
        expect(result, 'Solo se permiten letras y espacios');
      });
    });

    group('validateBirthDate', () {
      test('should return null for valid birth date', () {
        // Arrange
        final validDate = DateTime(1990, 5, 15);

        // Act
        final result = UserFormValidator.validateBirthDate(validDate);

        // Assert
        expect(result, null);
      });

      test('should return error for null date', () {
        // Act
        final result = UserFormValidator.validateBirthDate(null);

        // Assert
        expect(result, 'La fecha de nacimiento es requerida');
      });

      test('should return error for future date', () {
        // Arrange
        final futureDate = DateTime.now().add(const Duration(days: 1));

        // Act
        final result = UserFormValidator.validateBirthDate(futureDate);

        // Assert
        expect(result, 'La fecha no puede ser en el futuro');
      });

      test('should return error for too old date', () {
        // Arrange
        final tooOldDate = DateTime(1900, 1, 1);

        // Act
        final result = UserFormValidator.validateBirthDate(tooOldDate);

        // Assert
        expect(result, 'La fecha parece incorrecta');
      });

      test('should return error for under age', () {
        // Arrange
        final underAgeDate =
            DateTime.now().subtract(const Duration(days: 365 * 15));

        // Act
        final result = UserFormValidator.validateBirthDate(underAgeDate);

        // Assert
        expect(result, 'Debe ser mayor de 16 años');
      });

      test('should accept exactly 16 years old', () {
        // Arrange
        final sixteenYearsAgo = DateTime(
            DateTime.now().year - 16, DateTime.now().month, DateTime.now().day);

        // Act
        final result = UserFormValidator.validateBirthDate(sixteenYearsAgo);

        // Assert
        expect(result, null);
      });
    });

    group('isFormValid', () {
      test('should return true for all valid inputs', () {
        // Arrange
        const firstName = 'Juan';
        const lastName = 'Pérez';
        final birthDate = DateTime(1990, 5, 15);

        // Act
        final result =
            UserFormValidator.isFormValid(firstName, lastName, birthDate);

        // Assert
        expect(result, true);
      });

      test('should return false for invalid firstName', () {
        // Arrange
        const firstName = '';
        const lastName = 'Pérez';
        final birthDate = DateTime(1990, 5, 15);

        // Act
        final result =
            UserFormValidator.isFormValid(firstName, lastName, birthDate);

        // Assert
        expect(result, false);
      });

      test('should return false for invalid lastName', () {
        // Arrange
        const firstName = 'Juan';
        const lastName = '';
        final birthDate = DateTime(1990, 5, 15);

        // Act
        final result =
            UserFormValidator.isFormValid(firstName, lastName, birthDate);

        // Assert
        expect(result, false);
      });

      test('should return false for null birthDate', () {
        // Arrange
        const firstName = 'Juan';
        const lastName = 'Pérez';

        // Act
        final result = UserFormValidator.isFormValid(firstName, lastName, null);

        // Assert
        expect(result, false);
      });
    });
  });
}
