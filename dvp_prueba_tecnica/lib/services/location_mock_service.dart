import '../models/address_form_models.dart';

class LocationMockService {
  static const Duration _mockDelay = Duration(milliseconds: 300);

  /// Obtiene todos los países disponibles
  static Future<List<Country>> getCountries() async {
    await Future.delayed(_mockDelay);

    return const [
      Country(id: '1', name: 'Colombia'),
      Country(id: '2', name: 'México'),
      Country(id: '3', name: 'Argentina'),
      Country(id: '4', name: 'Brasil'),
      Country(id: '5', name: 'Chile'),
      Country(id: '6', name: 'Perú'),
      Country(id: '7', name: 'España'),
      Country(id: '8', name: 'Estados Unidos'),
    ];
  }

  /// Obtiene departamentos/estados según el país seleccionado
  static Future<List<Department>> getDepartmentsByCountry(
      String countryId) async {
    await Future.delayed(_mockDelay);

    switch (countryId) {
      case '1': // Colombia
        return const [
          Department(id: '1-1', name: 'Cesar', countryId: '1'),
          Department(id: '1-2', name: 'Magdalena', countryId: '1'),
          Department(id: '1-3', name: 'La Guajira', countryId: '1'),
          Department(id: '1-4', name: 'Atlántico', countryId: '1'),
          Department(id: '1-5', name: 'Bolívar', countryId: '1'),
          Department(id: '1-6', name: 'Córdoba', countryId: '1'),
          Department(id: '1-7', name: 'Sucre', countryId: '1'),
          Department(id: '1-8', name: 'Antioquia', countryId: '1'),
          Department(id: '1-9', name: 'Cundinamarca', countryId: '1'),
          Department(id: '1-10', name: 'Valle del Cauca', countryId: '1'),
        ];

      case '2': // México
        return const [
          Department(id: '2-1', name: 'Ciudad de México', countryId: '2'),
          Department(id: '2-2', name: 'Jalisco', countryId: '2'),
          Department(id: '2-3', name: 'Nuevo León', countryId: '2'),
          Department(id: '2-4', name: 'Yucatán', countryId: '2'),
          Department(id: '2-5', name: 'Quintana Roo', countryId: '2'),
          Department(id: '2-6', name: 'Veracruz', countryId: '2'),
        ];

      case '3': // Argentina
        return const [
          Department(id: '3-1', name: 'Buenos Aires', countryId: '3'),
          Department(id: '3-2', name: 'Córdoba', countryId: '3'),
          Department(id: '3-3', name: 'Santa Fe', countryId: '3'),
          Department(id: '3-4', name: 'Mendoza', countryId: '3'),
          Department(id: '3-5', name: 'Tucumán', countryId: '3'),
        ];

      case '4': // Brasil
        return const [
          Department(id: '4-1', name: 'São Paulo', countryId: '4'),
          Department(id: '4-2', name: 'Rio de Janeiro', countryId: '4'),
          Department(id: '4-3', name: 'Minas Gerais', countryId: '4'),
          Department(id: '4-4', name: 'Bahía', countryId: '4'),
        ];

      case '5': // Chile
        return const [
          Department(id: '5-1', name: 'Región Metropolitana', countryId: '5'),
          Department(id: '5-2', name: 'Valparaíso', countryId: '5'),
          Department(id: '5-3', name: 'Biobío', countryId: '5'),
          Department(id: '5-4', name: 'Araucanía', countryId: '5'),
        ];

      case '6': // Perú
        return const [
          Department(id: '6-1', name: 'Lima', countryId: '6'),
          Department(id: '6-2', name: 'Arequipa', countryId: '6'),
          Department(id: '6-3', name: 'Cusco', countryId: '6'),
          Department(id: '6-4', name: 'La Libertad', countryId: '6'),
        ];

      case '7': // España
        return const [
          Department(id: '7-1', name: 'Madrid', countryId: '7'),
          Department(id: '7-2', name: 'Barcelona', countryId: '7'),
          Department(id: '7-3', name: 'Valencia', countryId: '7'),
          Department(id: '7-4', name: 'Sevilla', countryId: '7'),
        ];

      case '8': // Estados Unidos
        return const [
          Department(id: '8-1', name: 'California', countryId: '8'),
          Department(id: '8-2', name: 'Texas', countryId: '8'),
          Department(id: '8-3', name: 'Florida', countryId: '8'),
          Department(id: '8-4', name: 'New York', countryId: '8'),
        ];

      default:
        return [
          Department(
              id: '$countryId-1',
              name: 'Departamento Ejemplo 1',
              countryId: countryId),
          Department(
              id: '$countryId-2',
              name: 'Departamento Ejemplo 2',
              countryId: countryId),
        ];
    }
  }

  /// Obtiene municipios/ciudades según el departamento seleccionado
  static Future<List<Municipality>> getMunicipalitiesByDepartment(
      String departmentId) async {
    await Future.delayed(_mockDelay);

    switch (departmentId) {
      // Colombia - Cesar
      case '1-1':
        return const [
          Municipality(id: '1-1-1', name: 'Valledupar', departmentId: '1-1'),
          Municipality(id: '1-1-2', name: 'Aguachica', departmentId: '1-1'),
          Municipality(id: '1-1-3', name: 'Codazzi', departmentId: '1-1'),
          Municipality(id: '1-1-4', name: 'La Paz', departmentId: '1-1'),
          Municipality(id: '1-1-5', name: 'San Diego', departmentId: '1-1'),
          Municipality(id: '1-1-6', name: 'Chiriguaná', departmentId: '1-1'),
          Municipality(id: '1-1-7', name: 'Curumaní', departmentId: '1-1'),
          Municipality(id: '1-1-8', name: 'El Paso', departmentId: '1-1'),
        ];

      // Colombia - Magdalena
      case '1-2':
        return const [
          Municipality(id: '1-2-1', name: 'Santa Marta', departmentId: '1-2'),
          Municipality(id: '1-2-2', name: 'Ciénaga', departmentId: '1-2'),
          Municipality(id: '1-2-3', name: 'Fundación', departmentId: '1-2'),
          Municipality(id: '1-2-4', name: 'El Banco', departmentId: '1-2'),
        ];

      // Colombia - La Guajira
      case '1-3':
        return const [
          Municipality(id: '1-3-1', name: 'Riohacha', departmentId: '1-3'),
          Municipality(id: '1-3-2', name: 'Maicao', departmentId: '1-3'),
          Municipality(id: '1-3-3', name: 'Uribia', departmentId: '1-3'),
          Municipality(id: '1-3-4', name: 'Fonseca', departmentId: '1-3'),
        ];

      // Colombia - Atlántico
      case '1-4':
        return const [
          Municipality(id: '1-4-1', name: 'Barranquilla', departmentId: '1-4'),
          Municipality(id: '1-4-2', name: 'Soledad', departmentId: '1-4'),
          Municipality(id: '1-4-3', name: 'Malambo', departmentId: '1-4'),
          Municipality(id: '1-4-4', name: 'Sabanagrande', departmentId: '1-4'),
        ];

      // México - Ciudad de México
      case '2-1':
        return const [
          Municipality(id: '2-1-1', name: 'Benito Juárez', departmentId: '2-1'),
          Municipality(id: '2-1-2', name: 'Coyoacán', departmentId: '2-1'),
          Municipality(
              id: '2-1-3', name: 'Miguel Hidalgo', departmentId: '2-1'),
          Municipality(id: '2-1-4', name: 'Tlalpan', departmentId: '2-1'),
        ];

      // México - Jalisco
      case '2-2':
        return const [
          Municipality(id: '2-2-1', name: 'Guadalajara', departmentId: '2-2'),
          Municipality(id: '2-2-2', name: 'Zapopan', departmentId: '2-2'),
          Municipality(id: '2-2-3', name: 'Tlaquepaque', departmentId: '2-2'),
          Municipality(id: '2-2-4', name: 'Tonalá', departmentId: '2-2'),
        ];

      // Argentina - Buenos Aires
      case '3-1':
        return const [
          Municipality(id: '3-1-1', name: 'La Plata', departmentId: '3-1'),
          Municipality(id: '3-1-2', name: 'Mar del Plata', departmentId: '3-1'),
          Municipality(id: '3-1-3', name: 'Bahía Blanca', departmentId: '3-1'),
          Municipality(id: '3-1-4', name: 'Tandil', departmentId: '3-1'),
        ];

      // España - Madrid
      case '7-1':
        return const [
          Municipality(
              id: '7-1-1', name: 'Madrid Capital', departmentId: '7-1'),
          Municipality(
              id: '7-1-2', name: 'Alcalá de Henares', departmentId: '7-1'),
          Municipality(id: '7-1-3', name: 'Getafe', departmentId: '7-1'),
          Municipality(id: '7-1-4', name: 'Leganés', departmentId: '7-1'),
        ];

      // Estados Unidos - California
      case '8-1':
        return const [
          Municipality(id: '8-1-1', name: 'Los Angeles', departmentId: '8-1'),
          Municipality(id: '8-1-2', name: 'San Francisco', departmentId: '8-1'),
          Municipality(id: '8-1-3', name: 'San Diego', departmentId: '8-1'),
          Municipality(id: '8-1-4', name: 'Sacramento', departmentId: '8-1'),
        ];

      default:
        // Generar municipios por defecto para departamentos no definidos
        return [
          Municipality(
              id: '$departmentId-1',
              name: 'Ciudad Principal',
              departmentId: departmentId),
          Municipality(
              id: '$departmentId-2',
              name: 'Ciudad Secundaria',
              departmentId: departmentId),
          Municipality(
              id: '$departmentId-3',
              name: 'Ciudad Tercera',
              departmentId: departmentId),
        ];
    }
  }

  /// Simula errores de red ocasionales (opcional para testing)
  static Future<T> simulateNetworkCall<T>(Future<T> Function() call,
      {double errorRate = 0.0}) async {
    if (errorRate > 0 &&
        (DateTime.now().millisecondsSinceEpoch % 100) < (errorRate * 100)) {
      await Future.delayed(const Duration(seconds: 2));
      throw Exception('Error simulado de red');
    }

    return await call();
  }
}
