import '../../models/user_form_models.dart';
import '../../utils/user_form_validator.dart';

class UserFormStateManager {
  /// Actualiza el estado cuando cambia el nombre
  static UserFormState updateFirstName(
      UserFormState currentState, String value) {
    return currentState.copyWith(
      firstName: value,
      firstNameError: UserFormValidator.validateFirstName(value),
      firstNameTouched: true,
      isValid: _calculateIsValid(
        value,
        currentState.lastName,
        currentState.birthDate,
      ),
    );
  }

  /// Actualiza el estado cuando cambia el apellido
  static UserFormState updateLastName(
      UserFormState currentState, String value) {
    return currentState.copyWith(
      lastName: value,
      lastNameError: UserFormValidator.validateLastName(value),
      lastNameTouched: true,
      isValid: _calculateIsValid(
        currentState.firstName,
        value,
        currentState.birthDate,
      ),
    );
  }

  /// Actualiza el estado cuando cambia la fecha de nacimiento
  static UserFormState updateBirthDate(
      UserFormState currentState, DateTime? value) {
    return currentState.copyWith(
      birthDate: value,
      birthDateError: UserFormValidator.validateBirthDate(value),
      birthDateTouched: true,
      isValid: _calculateIsValid(
        currentState.firstName,
        currentState.lastName,
        value,
      ),
    );
  }

  /// Crea un estado a partir de datos temporales
  static UserFormState fromTemporaryData(
    String firstName,
    String lastName,
    DateTime? birthDate,
  ) {
    return UserFormState(
      firstName: firstName,
      lastName: lastName,
      birthDate: birthDate,
      firstNameTouched: firstName.isNotEmpty,
      lastNameTouched: lastName.isNotEmpty,
      birthDateTouched: birthDate != null,
      isValid: UserFormValidator.isFormValid(firstName, lastName, birthDate),
    );
  }

  /// Actualiza el estado de loading
  static UserFormState setLoading(UserFormState currentState, bool isLoading) {
    return currentState.copyWith(isLoading: isLoading);
  }

  /// Resetea el formulario al estado inicial
  static UserFormState reset() {
    return const UserFormState();
  }

  /// Calcula si el formulario es válido
  static bool _calculateIsValid(
      String firstName, String lastName, DateTime? birthDate) {
    return UserFormValidator.isFormValid(firstName, lastName, birthDate);
  }

  /// Verifica si hay datos para guardar temporalmente
  static bool hasDataToSaveTemporarily(UserFormState state) {
    return state.firstName.trim().isNotEmpty ||
        state.lastName.trim().isNotEmpty ||
        state.birthDate != null;
  }
}
