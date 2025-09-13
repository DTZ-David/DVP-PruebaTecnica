import '../../models/address_form_models.dart';
import '../../services/address_form_service.dart';

class AddressFormLoadingHelper {
  /// Maneja la carga de países con estados de loading y error
  static Future<AddressFormState> loadCountries(
    AddressFormState currentState,
  ) async {
    var state = currentState.copyWith(
      isLoadingCountries: true,
      countryError: null,
    );

    try {
      final countries = await AddressFormService.loadCountries();
      return state.copyWith(
        countries: countries,
        isLoadingCountries: false,
      );
    } catch (e) {
      return state.copyWith(
        isLoadingCountries: false,
        countryError: 'Error al cargar países: ${e.toString()}',
      );
    }
  }

  /// Maneja la carga de departamentos con estados de loading y error
  static Future<AddressFormState> loadDepartments(
    AddressFormState currentState,
    String countryId,
  ) async {
    var state = currentState.copyWith(
      isLoadingDepartments: true,
      departmentError: null,
    );

    try {
      final departments = await AddressFormService.loadDepartments(countryId);
      return state.copyWith(
        departments: departments,
        isLoadingDepartments: false,
      );
    } catch (e) {
      return state.copyWith(
        isLoadingDepartments: false,
        departmentError: 'Error al cargar departamentos: ${e.toString()}',
      );
    }
  }

  /// Maneja la carga de municipios con estados de loading y error
  static Future<AddressFormState> loadMunicipalities(
    AddressFormState currentState,
    String departmentId,
  ) async {
    var state = currentState.copyWith(
      isLoadingMunicipalities: true,
      municipalityError: null,
    );

    try {
      final municipalities =
          await AddressFormService.loadMunicipalities(departmentId);
      return state.copyWith(
        municipalities: municipalities,
        isLoadingMunicipalities: false,
      );
    } catch (e) {
      return state.copyWith(
        isLoadingMunicipalities: false,
        municipalityError: 'Error al cargar municipios: ${e.toString()}',
      );
    }
  }
}
