import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../models/address_form_models.dart';
import '../../services/address_form_service.dart';
import '../../utils/address_form_validator.dart';
import 'address_form_state_manager.dart';
import 'address_form_loading_helper.dart';

part 'address_form_provider.g.dart';

@riverpod
class AddressFormNotifier extends _$AddressFormNotifier {
  @override
  AddressFormState build() {
    const initialState = AddressFormState();
    Future.microtask(() => loadCountries());
    return initialState;
  }

  /// Carga los países disponibles
  Future<void> loadCountries() async {
    state = await AddressFormLoadingHelper.loadCountries(state);
  }

  /// Selecciona un país y carga sus departamentos
  void selectCountry(String countryId, String countryName) {
    state =
        AddressFormStateManager.selectCountry(state, countryId, countryName);
    _loadDepartments(countryId);
    _validateForm();
  }

  /// Carga departamentos según el país seleccionado
  Future<void> _loadDepartments(String countryId) async {
    state = await AddressFormLoadingHelper.loadDepartments(state, countryId);
  }

  /// Selecciona un departamento y carga sus municipios
  void selectDepartment(String departmentId, String departmentName) {
    state = AddressFormStateManager.selectDepartment(
        state, departmentId, departmentName);
    _loadMunicipalities(departmentId);
    _validateForm();
  }

  /// Carga municipios según el departamento seleccionado
  Future<void> _loadMunicipalities(String departmentId) async {
    state =
        await AddressFormLoadingHelper.loadMunicipalities(state, departmentId);
  }

  /// Selecciona un municipio
  void selectMunicipality(String municipalityId, String municipalityName) {
    state = AddressFormStateManager.selectMunicipality(
        state, municipalityId, municipalityName);
    _validateForm();
  }

  /// Valida que todos los campos requeridos estén seleccionados
  void _validateForm() {
    final isValid = AddressFormValidator.validateForm(state);
    state = state.copyWith(isValid: isValid);
  }

  /// Guarda la dirección actual
  Future<bool> saveAddress() async {
    if (!state.isValid) {
      final errors = AddressFormValidator.getValidationErrors(state);
      state = state.copyWith(
        countryError: errors['countryError'],
        departmentError: errors['departmentError'],
        municipalityError: errors['municipalityError'],
      );
      return false;
    }

    state = state.copyWith(isSavingAddress: true);

    try {
      final newAddress = await AddressFormService.saveAddress(
        countryId: state.selectedCountryId!,
        departmentId: state.selectedDepartmentId!,
        municipalityId: state.selectedMunicipalityId!,
        countryName: state.selectedCountryName!,
        departmentName: state.selectedDepartmentName!,
        municipalityName: state.selectedMunicipalityName!,
      );

      state = AddressFormStateManager.addSavedAddress(state, newAddress);
      _clearForm();
      return true;
    } catch (e) {
      state = state.copyWith(
        isSavingAddress: false,
        countryError: 'Error al guardar dirección: ${e.toString()}',
      );
      return false;
    }
  }

  /// Limpia el formulario manteniendo los países cargados
  void _clearForm() {
    state = AddressFormStateManager.clearForm(state);
  }

  /// Elimina una dirección guardada
  void removeAddress(String addressId) {
    state = AddressFormStateManager.removeSavedAddress(state, addressId);
  }

  /// Reinicia completamente el estado del formulario
  void reset() {
    state = const AddressFormState();
    loadCountries();
  }

  /// Reintenta cargar datos en caso de error
  Future<void> retryLoadCountries() => loadCountries();

  Future<void> retryLoadDepartments() async {
    if (state.selectedCountryId != null) {
      await _loadDepartments(state.selectedCountryId!);
    }
  }

  Future<void> retryLoadMunicipalities() async {
    if (state.selectedDepartmentId != null) {
      await _loadMunicipalities(state.selectedDepartmentId!);
    }
  }
}
