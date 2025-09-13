import '../models/address_form_models.dart';

class AddressFormValidator {
  /// Valida que todos los campos requeridos estén seleccionados
  static bool validateForm(AddressFormState state) {
    return state.selectedCountryId != null &&
        state.selectedDepartmentId != null &&
        state.selectedMunicipalityId != null;
  }

  /// Genera los errores de validación para cada campo
  static Map<String, String?> getValidationErrors(AddressFormState state) {
    return {
      'countryError':
          state.selectedCountryId == null ? 'Selecciona un país' : null,
      'departmentError': state.selectedDepartmentId == null
          ? 'Selecciona un departamento'
          : null,
      'municipalityError': state.selectedMunicipalityId == null
          ? 'Selecciona un municipio'
          : null,
    };
  }
}
