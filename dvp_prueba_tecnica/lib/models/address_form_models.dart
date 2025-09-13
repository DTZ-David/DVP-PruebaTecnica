import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/address_model.dart';

part 'address_form_models.freezed.dart';

@freezed
class AddressFormState with _$AddressFormState {
  const factory AddressFormState({
    // Datos seleccionados
    String? selectedCountryId,
    String? selectedDepartmentId,
    String? selectedMunicipalityId,
    String? selectedCountryName,
    String? selectedDepartmentName,
    String? selectedMunicipalityName,

    // Listas de opciones
    @Default([]) List<Country> countries,
    @Default([]) List<Department> departments,
    @Default([]) List<Municipality> municipalities,

    // Estados de carga
    @Default(false) bool isLoadingCountries,
    @Default(false) bool isLoadingDepartments,
    @Default(false) bool isLoadingMunicipalities,
    @Default(false) bool isSavingAddress,

    // Lista de direcciones guardadas
    @Default([]) List<Address> savedAddresses,

    // Validación
    @Default(false) bool isValid,
    String? countryError,
    String? departmentError,
    String? municipalityError,
  }) = _AddressFormState;
}

// Modelos para los dropdowns
@freezed
class Country with _$Country {
  const factory Country({
    required String id,
    required String name,
  }) = _Country;
}

@freezed
class Department with _$Department {
  const factory Department({
    required String id,
    required String name,
    required String countryId,
  }) = _Department;
}

@freezed
class Municipality with _$Municipality {
  const factory Municipality({
    required String id,
    required String name,
    required String departmentId,
  }) = _Municipality;
}
