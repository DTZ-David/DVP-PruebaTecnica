// ignore_for_file: empty_catches

import 'package:hive_flutter/hive_flutter.dart';
import '../../models/address_model.dart';
import '../../models/user_model.dart';

class UserStorageService {
  static const String _boxName = 'users_list';
  static const String _userKey = 'current_user';

  late Box _userBox;

  /// Inicializa Hive y abre la caja de usuarios
  Future<void> initialize() async {
    try {
      _userBox = await Hive.openBox(_boxName);
    } catch (e) {
      // Log error if needed
    }
  }

  /// Guarda usuario en Hive (como JSON)
  Future<void> saveUser(User user) async {
    try {
      final userJson = _userToJson(user);
      await _userBox.put(_userKey, userJson);
    } catch (e) {
      // Log error if needed
    }
  }

  /// Carga usuario desde Hive
  User? loadUser() {
    try {
      final userJson = _userBox.get(_userKey) as Map<dynamic, dynamic>?;
      if (userJson == null) return null;
      return _userFromJson(userJson);
    } catch (e) {
      return null;
    }
  }

  /// Convierte User a Map para guardar en Hive
  Map<String, dynamic> _userToJson(User user) {
    return {
      'id': user.id,
      'firstName': user.firstName,
      'lastName': user.lastName,
      'birthDate': user.birthDate.millisecondsSinceEpoch,
      'addresses': user.addresses.map((addr) => _addressToJson(addr)).toList(),
    };
  }

  /// Convierte Map a User desde Hive
  User _userFromJson(Map<dynamic, dynamic> json) {
    return User(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      birthDate: DateTime.fromMillisecondsSinceEpoch(json['birthDate'] as int),
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
      addresses: _addressesFromJson(json['addresses']),
    );
  }

  /// Convierte Address a Map
  Map<String, dynamic> _addressToJson(Address address) {
    return {
      'id': address.id,
      'countryId': address.countryId,
      'departmentId': address.departmentId,
      'municipalityId': address.municipalityId,
      'countryName': address.countryName,
      'departmentName': address.departmentName,
      'municipalityName': address.municipalityName,
    };
  }

  /// Convierte List de Maps a List de Address
  List<Address> _addressesFromJson(dynamic addressesJson) {
    if (addressesJson == null) return [];

    return (addressesJson as List<dynamic>)
        .map((addr) => Address(
              id: addr['id'] as String?,
              countryId: addr['countryId'] as String,
              departmentId: addr['departmentId'] as String,
              municipalityId: addr['municipalityId'] as String,
              countryName: addr['countryName'] as String,
              departmentName: addr['departmentName'] as String,
              municipalityName: addr['municipalityName'] as String,
            ))
        .toList();
  }
}
