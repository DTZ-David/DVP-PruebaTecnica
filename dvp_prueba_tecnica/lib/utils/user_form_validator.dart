// ignore_for_file: curly_braces_in_flow_control_structures

class UserFormValidator {
  /// Valida el nombre
  static String? validateFirstName(String value) {
    if (value.trim().isEmpty) return 'El nombre es requerido';
    if (value.trim().length < 2)
      return 'El nombre debe tener al menos 2 caracteres';
    if (value.trim().length > 50)
      return 'El nombre no puede exceder 50 caracteres';
    if (!RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$').hasMatch(value.trim())) {
      return 'Solo se permiten letras y espacios';
    }
    return null;
  }

  /// Valida el apellido
  static String? validateLastName(String value) {
    if (value.trim().isEmpty) return 'El apellido es requerido';
    if (value.trim().length < 2)
      return 'El apellido debe tener al menos 2 caracteres';
    if (value.trim().length > 50)
      return 'El apellido no puede exceder 50 caracteres';
    if (!RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$').hasMatch(value.trim())) {
      return 'Solo se permiten letras y espacios';
    }
    return null;
  }

  /// Valida la fecha de nacimiento
  static String? validateBirthDate(DateTime? value) {
    if (value == null) return 'La fecha de nacimiento es requerida';

    final now = DateTime.now();
    final age = now.year - value.year;

    if (value.isAfter(now)) {
      return 'La fecha no puede ser en el futuro';
    }

    if (age > 120) {
      return 'La fecha parece incorrecta';
    }

    if (age < 16) {
      return 'Debe ser mayor de 16 años';
    }

    return null;
  }

  /// Valida que el formulario completo sea válido
  static bool isFormValid(
      String firstName, String lastName, DateTime? birthDate) {
    return firstName.trim().isNotEmpty &&
        lastName.trim().isNotEmpty &&
        birthDate != null &&
        validateFirstName(firstName) == null &&
        validateLastName(lastName) == null &&
        validateBirthDate(birthDate) == null;
  }
}
