import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dvp_prueba_tecnica/providers/users/global_user_provider.dart';
import 'package:dvp_prueba_tecnica/models/user_model.dart';
import 'package:dvp_prueba_tecnica/models/address_model.dart';

void main() {
  group('GlobalUserProvider', () {
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
        final state = container.read(globalUserNotifierProvider);

        // Assert
        expect(state.currentUser, isNull);
        expect(state.isCreatingUser, isFalse);
        expect(state.hasCompletedProfile, isFalse);
        expect(state.tempFirstName, isNull);
        expect(state.tempLastName, isNull);
        expect(state.tempBirthDate, isNull);
        expect(state.hasTemporaryData, isFalse);
      });
    });

    group('Temporary Data Management', () {
      test('saveTemporaryFormData should save data correctly', () {
        // Arrange
        final notifier = container.read(globalUserNotifierProvider.notifier);
        const firstName = 'Juan';
        const lastName = 'Pérez';
        final birthDate = DateTime(1990, 5, 15);

        // Act
        notifier.saveTemporaryFormData(
          firstName: firstName,
          lastName: lastName,
          birthDate: birthDate,
        );

        final state = container.read(globalUserNotifierProvider);

        // Assert
        expect(state.tempFirstName, equals(firstName));
        expect(state.tempLastName, equals(lastName));
        expect(state.tempBirthDate, equals(birthDate));
        expect(state.hasTemporaryData, isTrue);
      });

      test('getTemporaryData should return saved temporary data', () {
        // Arrange
        final notifier = container.read(globalUserNotifierProvider.notifier);
        const firstName = 'María';
        const lastName = 'García';
        final birthDate = DateTime(1985, 3, 20);

        notifier.saveTemporaryFormData(
          firstName: firstName,
          lastName: lastName,
          birthDate: birthDate,
        );

        // Act
        final tempData = notifier.getTemporaryData();

        // Assert
        expect(tempData.firstName, equals(firstName));
        expect(tempData.lastName, equals(lastName));
        expect(tempData.birthDate, equals(birthDate));
      });

      test('getTemporaryData should return empty data when no temp data exists',
          () {
        // Arrange
        final notifier = container.read(globalUserNotifierProvider.notifier);

        // Act
        final tempData = notifier.getTemporaryData();

        // Assert
        expect(tempData.firstName, isEmpty);
        expect(tempData.lastName, isEmpty);
        expect(tempData.birthDate, isNull);
      });
    });

    group('User Management', () {
      test('setUser should set current user and clear temporary data', () {
        // Arrange
        final notifier = container.read(globalUserNotifierProvider.notifier);
        final user = User(
          id: '123',
          firstName: 'Carlos',
          lastName: 'Rodríguez',
          birthDate: DateTime(1992, 8, 10),
          createdAt: DateTime.now(),
          addresses: [],
        );

        // Primero guardamos datos temporales
        notifier.saveTemporaryFormData(
          firstName: 'Temp',
          lastName: 'Data',
          birthDate: DateTime(2000, 1, 1),
        );

        // Act
        notifier.setUser(user);
        final state = container.read(globalUserNotifierProvider);

        // Assert
        expect(state.currentUser, equals(user));
        expect(state.isCreatingUser, isFalse);
        expect(state.tempFirstName, isNull);
        expect(state.tempLastName, isNull);
        expect(state.tempBirthDate, isNull);
        expect(state.hasTemporaryData, isFalse);
      });

      test('resetUser should reset state to initial values', () {
        // Arrange
        final notifier = container.read(globalUserNotifierProvider.notifier);
        final user = User(
          id: '456',
          firstName: 'Ana',
          lastName: 'López',
          birthDate: DateTime(1988, 12, 5),
          createdAt: DateTime.now(),
          addresses: [],
        );

        // Configurar estado con datos
        notifier.setUser(user);
        notifier.markProfileAsCompleted();

        // Act
        notifier.resetUser();
        final state = container.read(globalUserNotifierProvider);

        // Assert
        expect(state.currentUser, isNull);
        expect(state.isCreatingUser, isFalse);
        expect(state.hasCompletedProfile, isFalse);
        expect(state.tempFirstName, isNull);
        expect(state.tempLastName, isNull);
        expect(state.tempBirthDate, isNull);
        expect(state.hasTemporaryData, isFalse);
      });

      test('updateUserBasicInfo should update user information', () {
        // Arrange
        final notifier = container.read(globalUserNotifierProvider.notifier);
        final user = User(
          id: '789',
          firstName: 'Original',
          lastName: 'Name',
          birthDate: DateTime(1990, 1, 1),
          createdAt: DateTime.now(),
          addresses: [],
        );

        notifier.setUser(user);

        // Act
        notifier.updateUserBasicInfo(
          firstName: 'Updated',
          lastName: 'LastName',
          birthDate: DateTime(1995, 6, 15),
        );

        final state = container.read(globalUserNotifierProvider);

        // Assert
        expect(state.currentUser!.firstName, equals('Updated'));
        expect(state.currentUser!.lastName, equals('LastName'));
        expect(state.currentUser!.birthDate, equals(DateTime(1995, 6, 15)));
        expect(state.currentUser!.id, equals('789')); // ID no debe cambiar
      });

      test('updateUserBasicInfo should do nothing when no current user', () {
        // Arrange
        final notifier = container.read(globalUserNotifierProvider.notifier);

        // Act
        notifier.updateUserBasicInfo(
          firstName: 'Test',
          lastName: 'User',
        );

        final state = container.read(globalUserNotifierProvider);

        // Assert
        expect(state.currentUser, isNull);
      });

      test('markProfileAsCompleted should set hasCompletedProfile to true', () {
        // Arrange
        final notifier = container.read(globalUserNotifierProvider.notifier);

        // Act
        notifier.markProfileAsCompleted();
        final state = container.read(globalUserNotifierProvider);

        // Assert
        expect(state.hasCompletedProfile, isTrue);
      });
    });

    group('Address Management', () {
      late User userWithAddresses;

      setUp(() {
        userWithAddresses = User(
          id: 'user_with_addr',
          firstName: 'Usuario',
          lastName: 'ConDirecciones',
          birthDate: DateTime(1985, 5, 20),
          createdAt: DateTime.now(),
          addresses: [
            const Address(
              id: 'addr1',
              countryId: 'CO',
              departmentId: 'CESAR',
              municipalityId: 'VALLEDUPAR',
              countryName: 'Colombia',
              departmentName: 'Cesar',
              municipalityName: 'Valledupar',
            ),
          ],
        );
      });

      test('addAddressToUser should add address to current user', () {
        // Arrange
        final notifier = container.read(globalUserNotifierProvider.notifier);
        notifier.setUser(userWithAddresses);

        const newAddress = Address(
          id: 'addr2',
          countryId: 'CO',
          departmentId: 'ANTIOQUIA',
          municipalityId: 'MEDELLIN',
          countryName: 'Colombia',
          departmentName: 'Antioquia',
          municipalityName: 'Medellín',
        );

        // Act
        notifier.addAddressToUser(newAddress);
        final state = container.read(globalUserNotifierProvider);

        // Assert
        expect(state.currentUser!.addresses, hasLength(2));
        expect(state.currentUser!.addresses.last.id, equals('addr2'));
        expect(state.currentUser!.addresses.last.municipalityName,
            equals('Medellín'));
      });

      test('addAddressToUser should do nothing when no current user', () {
        // Arrange
        final notifier = container.read(globalUserNotifierProvider.notifier);
        const address = Address(
          id: 'addr_test',
          countryId: 'CO',
          departmentId: 'TEST',
          municipalityId: 'TEST',
          countryName: 'Test Country',
          departmentName: 'Test Department',
          municipalityName: 'Test Municipality',
        );

        // Act
        notifier.addAddressToUser(address);
        final state = container.read(globalUserNotifierProvider);

        // Assert
        expect(state.currentUser, isNull);
      });

      test('removeAddressFromUser should remove address by id', () {
        // Arrange
        final notifier = container.read(globalUserNotifierProvider.notifier);
        notifier.setUser(userWithAddresses);

        // Act
        notifier.removeAddressFromUser('addr1');
        final state = container.read(globalUserNotifierProvider);

        // Assert
        expect(state.currentUser!.addresses, isEmpty);
      });

      test(
          'removeAddressFromUser should do nothing for non-existent address id',
          () {
        // Arrange
        final notifier = container.read(globalUserNotifierProvider.notifier);
        notifier.setUser(userWithAddresses);

        // Act
        notifier.removeAddressFromUser('non_existent_id');
        final state = container.read(globalUserNotifierProvider);

        // Assert
        expect(state.currentUser!.addresses, hasLength(1));
        expect(state.currentUser!.addresses.first.id, equals('addr1'));
      });

      test('updateUserAddresses should replace all addresses', () {
        // Arrange
        final notifier = container.read(globalUserNotifierProvider.notifier);
        notifier.setUser(userWithAddresses);

        final newAddresses = [
          const Address(
            id: 'new_addr1',
            countryId: 'CO',
            departmentId: 'BOYACA',
            municipalityId: 'TUNJA',
            countryName: 'Colombia',
            departmentName: 'Boyacá',
            municipalityName: 'Tunja',
          ),
          const Address(
            id: 'new_addr2',
            countryId: 'CO',
            departmentId: 'VALLE',
            municipalityId: 'CALI',
            countryName: 'Colombia',
            departmentName: 'Valle del Cauca',
            municipalityName: 'Cali',
          ),
        ];

        // Act
        notifier.updateUserAddresses(newAddresses);
        final state = container.read(globalUserNotifierProvider);

        // Assert
        expect(state.currentUser!.addresses, hasLength(2));
        expect(state.currentUser!.addresses[0].id, equals('new_addr1'));
        expect(state.currentUser!.addresses[1].id, equals('new_addr2'));
        expect(
            state.currentUser!.addresses[1].municipalityName, equals('Cali'));
      });
    });

    group('Computed Providers', () {
      test('hasUserData should return true when user exists', () {
        // Arrange
        final notifier = container.read(globalUserNotifierProvider.notifier);
        final user = User(
          id: '123',
          firstName: 'Test',
          lastName: 'User',
          birthDate: DateTime(1990, 1, 1),
          createdAt: DateTime.now(),
          addresses: [],
        );

        notifier.setUser(user);

        // Act
        final hasData = container.read(hasUserDataProvider);

        // Assert
        expect(hasData, isTrue);
      });

      test('hasUserData should return false when no user exists', () {
        // Act
        final hasData = container.read(hasUserDataProvider);

        // Assert
        expect(hasData, isFalse);
      });

      test('userFullName should return correct full name', () {
        // Arrange
        final notifier = container.read(globalUserNotifierProvider.notifier);
        final user = User(
          id: '456',
          firstName: 'Juan Carlos',
          lastName: 'Pérez López',
          birthDate: DateTime(1985, 3, 15),
          createdAt: DateTime.now(),
          addresses: [],
        );

        notifier.setUser(user);

        // Act
        final fullName = container.read(userFullNameProvider);

        // Assert
        expect(fullName, equals('Juan Carlos Pérez López'));
      });

      test('userFullName should return empty string when no user', () {
        // Act
        final fullName = container.read(userFullNameProvider);

        // Assert
        expect(fullName, isEmpty);
      });

      test('userAge should calculate correct age', () {
        // Arrange
        final notifier = container.read(globalUserNotifierProvider.notifier);
        final now = DateTime.now();
        final birthDate =
            DateTime(now.year - 25, now.month, now.day); // 25 años exactos

        final user = User(
          id: '789',
          firstName: 'Age',
          lastName: 'Test',
          birthDate: birthDate,
          createdAt: DateTime.now(),
          addresses: [],
        );

        notifier.setUser(user);

        // Act
        final age = container.read(userAgeProvider);

        // Assert
        expect(age, equals(25));
      });

      test('userAge should handle birthday not yet reached this year', () {
        // Arrange
        final notifier = container.read(globalUserNotifierProvider.notifier);
        final now = DateTime.now();
        final birthDate = DateTime(
            now.year - 30, now.month + 1, now.day); // Cumpleaños el próximo mes

        final user = User(
          id: 'future_birthday',
          firstName: 'Future',
          lastName: 'Birthday',
          birthDate: birthDate,
          createdAt: DateTime.now(),
          addresses: [],
        );

        notifier.setUser(user);

        // Act
        final age = container.read(userAgeProvider);

        // Assert
        expect(age, equals(29)); // Aún no cumplió 30
      });

      test('userAge should return 0 when no user', () {
        // Act
        final age = container.read(userAgeProvider);

        // Assert
        expect(age, equals(0));
      });
    });
  });
}
