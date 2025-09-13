import '../../models/address_form_models.dart';
import '../../models/address_model.dart';

class AddressFormStateManager {
  /// Actualiza el estado cuando se selecciona un país
  static AddressFormState selectCountry(
    AddressFormState currentState,
    String countryId,
    String countryName,
  ) {
    return currentState.copyWith(
      selectedCountryId: countryId,
      selectedCountryName: countryName,
      selectedDepartmentId: null,
      selectedMunicipalityId: null,
      selectedDepartmentName: null,
      selectedMunicipalityName: null,
      departments: [],
      municipalities: [],
      countryError: null,
      departmentError: null,
      municipalityError: null,
    );
  }

  /// Actualiza el estado cuando se selecciona un departamento
  static AddressFormState selectDepartment(
    AddressFormState currentState,
    String departmentId,
    String departmentName,
  ) {
    return currentState.copyWith(
      selectedDepartmentId: departmentId,
      selectedDepartmentName: departmentName,
      selectedMunicipalityId: null,
      selectedMunicipalityName: null,
      municipalities: [],
      departmentError: null,
      municipalityError: null,
    );
  }

  /// Actualiza el estado cuando se selecciona un municipio
  static AddressFormState selectMunicipality(
    AddressFormState currentState,
    String municipalityId,
    String municipalityName,
  ) {
    return currentState.copyWith(
      selectedMunicipalityId: municipalityId,
      selectedMunicipalityName: municipalityName,
      municipalityError: null,
    );
  }

  /// Limpia el formulario manteniendo los países cargados
  static AddressFormState clearForm(AddressFormState currentState) {
    return currentState.copyWith(
      selectedCountryId: null,
      selectedDepartmentId: null,
      selectedMunicipalityId: null,
      selectedCountryName: null,
      selectedDepartmentName: null,
      selectedMunicipalityName: null,
      departments: [],
      municipalities: [],
      isValid: false,
      countryError: null,
      departmentError: null,
      municipalityError: null,
    );
  }

  /// Agrega una nueva dirección a las direcciones guardadas
  static AddressFormState addSavedAddress(
    AddressFormState currentState,
    Address newAddress,
  ) {
    final updatedAddresses = [...currentState.savedAddresses, newAddress];
    return currentState.copyWith(
      savedAddresses: updatedAddresses,
      isSavingAddress: false,
    );
  }

  /// Elimina una dirección de las direcciones guardadas
  static AddressFormState removeSavedAddress(
    AddressFormState currentState,
    String addressId,
  ) {
    final updatedAddresses = currentState.savedAddresses
        .where((address) => address.id != addressId)
        .toList();
    return currentState.copyWith(savedAddresses: updatedAddresses);
  }
}
