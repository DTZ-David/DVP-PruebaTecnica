import '../../models/user_model.dart';

class UserFormService {
  /// Simula el envío del formulario (guardado en base de datos)
  static Future<User> submitUserForm({
    required String firstName,
    required String lastName,
    required DateTime birthDate,
  }) async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 800));

    return User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      firstName: firstName.trim(),
      lastName: lastName.trim(),
      birthDate: birthDate,
      createdAt: DateTime.now(),
      addresses: [],
    );
  }
}
