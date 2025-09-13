import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../models/user_model.dart';
import '../../models/address_model.dart';

part 'users_list_provider.freezed.dart';
part 'users_list_provider.g.dart';

@freezed
class UsersListState with _$UsersListState {
  const factory UsersListState({
    @Default([]) List<User> users,
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default(false) bool isInitialized,
    String? errorMessage,
  }) = _UsersListState;
}

@riverpod
class UsersListNotifier extends _$UsersListNotifier {
  Box? _usersBox;

  @override
  UsersListState build() {
    // No llamar _initHive aquí, se inicializa cuando se necesita
    return const UsersListState();
  }

  Future<void> _ensureInitialized() async {
    if (_usersBox == null || !_usersBox!.isOpen) {
      _usersBox = await Hive.openBox('users_list');
    }
  }

  Future<void> loadUsers() async {
    state = state.copyWith(isLoading: true, hasError: false);

    try {
      await _ensureInitialized();

      final usersData = _usersBox!.values.toList();

      // Debug: mostrar cada elemento
      for (int i = 0; i < usersData.length; i++) {}

      final users = usersData.map((userData) {
        final userMap = Map<String, dynamic>.from(userData);

        final user = _mapToUser(userMap);
        return user;
      }).toList();

      state = state.copyWith(
        users: users,
        isLoading: false,
        isInitialized: true,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: 'Error cargando usuarios: $e',
      );
    }
  }

  User _mapToUser(Map<String, dynamic> userMap) {
    return User(
      id: userMap['id'] as String,
      firstName: userMap['firstName'] as String,
      lastName: userMap['lastName'] as String,
      birthDate:
          DateTime.fromMillisecondsSinceEpoch(userMap['birthDate'] as int),
      createdAt: userMap['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(userMap['createdAt'] as int)
          : null,
      addresses: (userMap['addresses'] as List<dynamic>?)?.map((addr) {
            final addrMap = Map<String, dynamic>.from(addr);
            return Address(
              id: addrMap['id'] as String?,
              countryId: addrMap['countryId'] as String,
              departmentId: addrMap['departmentId'] as String,
              municipalityId: addrMap['municipalityId'] as String,
              countryName: addrMap['countryName'] as String,
              departmentName: addrMap['departmentName'] as String,
              municipalityName: addrMap['municipalityName'] as String,
            );
          }).toList() ??
          [],
    );
  }

  Future<void> addUser(User user) async {
    try {
      await _ensureInitialized();

      final userJson = {
        'id': user.id,
        'firstName': user.firstName,
        'lastName': user.lastName,
        'birthDate': user.birthDate.millisecondsSinceEpoch,
        'createdAt': user.createdAt?.millisecondsSinceEpoch ??
            DateTime.now().millisecondsSinceEpoch,
        'addresses': user.addresses
            .map((addr) => {
                  'id': addr.id,
                  'countryId': addr.countryId,
                  'departmentId': addr.departmentId,
                  'municipalityId': addr.municipalityId,
                  'countryName': addr.countryName,
                  'departmentName': addr.departmentName,
                  'municipalityName': addr.municipalityName,
                })
            .toList(),
      };

      await _usersBox!.put(user.id, userJson);

      await loadUsers(); // Recargar lista
    } catch (e) {
      state = state.copyWith(
        hasError: true,
        errorMessage: 'Error guardando usuario: $e',
      );
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _ensureInitialized();
      await _usersBox!.delete(userId);
      await loadUsers(); // Recargar lista
    } catch (e) {
      state = state.copyWith(
        hasError: true,
        errorMessage: 'Error eliminando usuario: $e',
      );
    }
  }

  Future<void> updateUser(User user) async {
    try {
      await _ensureInitialized();

      final userJson = {
        'id': user.id,
        'firstName': user.firstName,
        'lastName': user.lastName,
        'birthDate': user.birthDate.millisecondsSinceEpoch,
        'createdAt': user.createdAt?.millisecondsSinceEpoch ??
            DateTime.now().millisecondsSinceEpoch,
        'addresses': user.addresses
            .map((addr) => {
                  'id': addr.id,
                  'countryId': addr.countryId,
                  'departmentId': addr.departmentId,
                  'municipalityId': addr.municipalityId,
                  'countryName': addr.countryName,
                  'departmentName': addr.departmentName,
                  'municipalityName': addr.municipalityName,
                })
            .toList(),
      };

      await _usersBox!.put(user.id, userJson);
      await loadUsers(); // Recargar lista
    } catch (e) {
      state = state.copyWith(
        hasError: true,
        errorMessage: 'Error actualizando usuario: $e',
      );
    }
  }

  void clearError() {
    state = state.copyWith(hasError: false, errorMessage: null);
  }
}
