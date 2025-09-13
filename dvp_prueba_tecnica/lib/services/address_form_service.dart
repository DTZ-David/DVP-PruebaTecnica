import '../../models/address_model.dart';
import '../../services/location_mock_service.dart';
import '../models/address_form_models.dart';

class AddressFormService {
  /// Carga los países disponibles desde el servicio mock
  static Future<List<Country>> loadCountries() async {
    return await LocationMockService.getCountries();
  }

  /// Carga departamentos según el país seleccionado
  static Future<List<Department>> loadDepartments(String countryId) async {
    return await LocationMockService.getDepartmentsByCountry(countryId);
  }

  /// Carga municipios según el departamento seleccionado
  static Future<List<Municipality>> loadMunicipalities(
      String departmentId) async {
    return await LocationMockService.getMunicipalitiesByDepartment(
        departmentId);
  }

  /// Simula el guardado de una dirección
  static Future<Address> saveAddress({
    required String countryId,
    required String departmentId,
    required String municipalityId,
    required String countryName,
    required String departmentName,
    required String municipalityName,
  }) async {
    // Simular guardado en base de datos
    await Future.delayed(const Duration(milliseconds: 800));

    return Address(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      countryId: countryId,
      departmentId: departmentId,
      municipalityId: municipalityId,
      countryName: countryName,
      departmentName: departmentName,
      municipalityName: municipalityName,
    );
  }
}
