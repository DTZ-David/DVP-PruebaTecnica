import 'package:dvp_prueba_tecnica/models/address_form_models.dart';
import 'package:dvp_prueba_tecnica/models/address_model.dart';
import 'package:dvp_prueba_tecnica/services/address_form_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddressFormService', () {
    group('loadCountries', () {
      test('should return list of countries', () async {
        // Act
        final result = await AddressFormService.loadCountries();

        // Assert
        expect(result, isA<List<Country>>());
        expect(result, isNotEmpty);
        // Verificar que cada país tenga id y name
        for (final country in result) {
          expect(country.id, isNotNull);
          expect(country.name, isNotNull);
          expect(country.id, isNotEmpty);
          expect(country.name, isNotEmpty);
        }
      });

      test('should return consistent data on multiple calls', () async {
        // Act
        final result1 = await AddressFormService.loadCountries();
        final result2 = await AddressFormService.loadCountries();

        // Assert
        expect(result1.length, equals(result2.length));
      });
    });

    group('saveAddress', () {
      test('should create and return new address', () async {
        // Arrange
        const countryId = '1';
        const departmentId = '1';
        const municipalityId = '1';
        const countryName = 'Colombia';
        const departmentName = 'Cundinamarca';
        const municipalityName = 'Bogotá';

        // Act
        final result = await AddressFormService.saveAddress(
          countryId: countryId,
          departmentId: departmentId,
          municipalityId: municipalityId,
          countryName: countryName,
          departmentName: departmentName,
          municipalityName: municipalityName,
        );

        // Assert
        expect(result, isA<Address>());
        expect(result.countryId, countryId);
        expect(result.departmentId, departmentId);
        expect(result.municipalityId, municipalityId);
        expect(result.countryName, countryName);
        expect(result.departmentName, departmentName);
        expect(result.municipalityName, municipalityName);
        expect(result.id, isNotNull);
        expect(result.id, isNotEmpty);
      });

      test('should have unique IDs for different addresses', () async {
        // Act
        final address1 = await AddressFormService.saveAddress(
          countryId: '1',
          departmentId: '1',
          municipalityId: '1',
          countryName: 'Colombia',
          departmentName: 'Cundinamarca',
          municipalityName: 'Bogotá',
        );

        // Wait a bit to ensure different timestamps
        await Future.delayed(const Duration(milliseconds: 10));

        final address2 = await AddressFormService.saveAddress(
          countryId: '2',
          departmentId: '2',
          municipalityId: '2',
          countryName: 'México',
          departmentName: 'CDMX',
          municipalityName: 'Ciudad de México',
        );

        // Assert
        expect(address1.id, isNot(equals(address2.id)));
      });

      test('should simulate network delay', () async {
        // Arrange
        final stopwatch = Stopwatch()..start();

        // Act
        await AddressFormService.saveAddress(
          countryId: '1',
          departmentId: '1',
          municipalityId: '1',
          countryName: 'Colombia',
          departmentName: 'Cundinamarca',
          municipalityName: 'Bogotá',
        );

        // Assert
        stopwatch.stop();
        expect(stopwatch.elapsedMilliseconds,
            greaterThanOrEqualTo(750)); // Un poco menos para evitar flakiness
      });

      test('should preserve all input data', () async {
        // Arrange
        const testData = {
          'countryId': 'test_country_id',
          'departmentId': 'test_department_id',
          'municipalityId': 'test_municipality_id',
          'countryName': 'Test Country',
          'departmentName': 'Test Department',
          'municipalityName': 'Test Municipality',
        };

        // Act
        final result = await AddressFormService.saveAddress(
          countryId: testData['countryId']!,
          departmentId: testData['departmentId']!,
          municipalityId: testData['municipalityId']!,
          countryName: testData['countryName']!,
          departmentName: testData['departmentName']!,
          municipalityName: testData['municipalityName']!,
        );

        // Assert
        expect(result.countryId, testData['countryId']);
        expect(result.departmentId, testData['departmentId']);
        expect(result.municipalityId, testData['municipalityId']);
        expect(result.countryName, testData['countryName']);
        expect(result.departmentName, testData['departmentName']);
        expect(result.municipalityName, testData['municipalityName']);
      });
    });

    group('Integration tests', () {
      test('should work with real data flow', () async {
        // Act - Simular flujo completo
        final countries = await AddressFormService.loadCountries();
        expect(countries, isNotEmpty);

        final departments =
            await AddressFormService.loadDepartments(countries.first.id);
        expect(departments, isNotEmpty);

        final municipalities =
            await AddressFormService.loadMunicipalities(departments.first.id);
        expect(municipalities, isNotEmpty);

        // Crear dirección con datos reales
        final address = await AddressFormService.saveAddress(
          countryId: countries.first.id,
          departmentId: departments.first.id,
          municipalityId: municipalities.first.id,
          countryName: countries.first.name,
          departmentName: departments.first.name,
          municipalityName: municipalities.first.name,
        );

        // Assert
        expect(address.countryId, countries.first.id);
        expect(address.departmentId, departments.first.id);
        expect(address.municipalityId, municipalities.first.id);
      });
    });
  });
}
