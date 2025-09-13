import 'package:flutter_test/flutter_test.dart';
import 'package:dvp_prueba_tecnica/services/user_form_service.dart';

void main() {
  group('UserFormService', () {
    group('submitUserForm', () {
      test('should return User with correct data when valid input provided',
          () async {
        // Arrange
        const firstName = 'Juan';
        const lastName = 'Pérez';
        final birthDate = DateTime(1990, 5, 15);

        // Act
        final result = await UserFormService.submitUserForm(
          firstName: firstName,
          lastName: lastName,
          birthDate: birthDate,
        );

        // Assert
        expect(result.firstName, equals(firstName));
        expect(result.lastName, equals(lastName));
        expect(result.birthDate, equals(birthDate));
        expect(result.id, isNotNull);
        expect(result.id, isNotEmpty);
        expect(result.addresses, isEmpty);
      });

      test('should trim whitespace from first and last names', () async {
        // Arrange
        const firstName = '  María  ';
        const lastName = '  González  ';
        final birthDate = DateTime(1985, 12, 25);

        // Act
        final result = await UserFormService.submitUserForm(
          firstName: firstName,
          lastName: lastName,
          birthDate: birthDate,
        );

        // Assert
        expect(result.firstName, equals('María'));
        expect(result.lastName, equals('González'));
      });

      test('should generate unique IDs for different submissions', () async {
        // Arrange
        const firstName = 'Carlos';
        const lastName = 'Rodríguez';
        final birthDate = DateTime(1988, 3, 10);

        // Act
        final result1 = await UserFormService.submitUserForm(
          firstName: firstName,
          lastName: lastName,
          birthDate: birthDate,
        );

        // Pequeño delay para asegurar IDs diferentes
        await Future.delayed(const Duration(milliseconds: 10));

        final result2 = await UserFormService.submitUserForm(
          firstName: firstName,
          lastName: lastName,
          birthDate: birthDate,
        );

        // Assert
        expect(result1.id, isNot(equals(result2.id)));
      });

      test('should handle empty strings after trimming', () async {
        // Arrange
        const firstName = '   ';
        const lastName = '   ';
        final birthDate = DateTime(1995, 7, 20);

        // Act
        final result = await UserFormService.submitUserForm(
          firstName: firstName,
          lastName: lastName,
          birthDate: birthDate,
        );

        // Assert
        expect(result.firstName, isEmpty);
        expect(result.lastName, isEmpty);
        expect(result.birthDate, equals(birthDate));
      });

      test('should handle special characters in names', () async {
        // Arrange
        const firstName = 'José María';
        const lastName = 'López-García';
        final birthDate = DateTime(1992, 11, 8);

        // Act
        final result = await UserFormService.submitUserForm(
          firstName: firstName,
          lastName: lastName,
          birthDate: birthDate,
        );

        // Assert
        expect(result.firstName, equals(firstName));
        expect(result.lastName, equals(lastName));
      });

      test('should take approximately 800ms to complete', () async {
        // Arrange
        const firstName = 'Ana';
        const lastName = 'Martín';
        final birthDate = DateTime(1987, 4, 12);
        final stopwatch = Stopwatch()..start();

        // Act
        await UserFormService.submitUserForm(
          firstName: firstName,
          lastName: lastName,
          birthDate: birthDate,
        );

        // Assert
        stopwatch.stop();
        final elapsedMs = stopwatch.elapsedMilliseconds;

        // Permitir un margen de error de ±100ms
        expect(elapsedMs, greaterThanOrEqualTo(700));
        expect(elapsedMs, lessThanOrEqualTo(900));
      });

      test('should handle future birth dates', () async {
        // Arrange
        const firstName = 'Futuro';
        const lastName = 'Usuario';
        final futureBirthDate = DateTime.now().add(const Duration(days: 365));

        // Act
        final result = await UserFormService.submitUserForm(
          firstName: firstName,
          lastName: lastName,
          birthDate: futureBirthDate,
        );

        // Assert
        expect(result.birthDate, equals(futureBirthDate));
      });

      test('should handle very old birth dates', () async {
        // Arrange
        const firstName = 'Muy';
        const lastName = 'Antiguo';
        final oldBirthDate = DateTime(1900, 1, 1);

        // Act
        final result = await UserFormService.submitUserForm(
          firstName: firstName,
          lastName: lastName,
          birthDate: oldBirthDate,
        );

        // Assert
        expect(result.birthDate, equals(oldBirthDate));
      });
    });
  });
}
