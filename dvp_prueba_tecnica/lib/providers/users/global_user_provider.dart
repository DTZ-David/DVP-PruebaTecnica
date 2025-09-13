import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../models/user_model.dart';
import '../../models/address_model.dart';

part 'global_user_provider.freezed.dart';
part 'global_user_provider.g.dart';

@freezed
class GlobalUserState with _$GlobalUserState {
  const factory GlobalUserState({
    User? currentUser,
    @Default(false) bool isCreatingUser,
    @Default(false) bool hasCompletedProfile,
    // ✅ NUEVO: Guardar datos del formulario temporalmente
    String? tempFirstName,
    String? tempLastName,
    DateTime? tempBirthDate,
    @Default(false) bool hasTemporaryData,
  }) = _GlobalUserState;
}

@riverpod
class GlobalUserNotifier extends _$GlobalUserNotifier {
  @override
  GlobalUserState build() {
    return const GlobalUserState();
  }

  /// ✅ NUEVO: Guarda los datos del formulario temporalmente (sin crear usuario aún)
  void saveTemporaryFormData({
    required String firstName,
    required String lastName,
    required DateTime birthDate,
  }) {
    state = state.copyWith(
      tempFirstName: firstName,
      tempLastName: lastName,
      tempBirthDate: birthDate,
      hasTemporaryData: true,
    );
  }

  /// ✅ NUEVO: Obtiene los datos temporales para rellenar el formulario
  ({String firstName, String lastName, DateTime? birthDate})
      getTemporaryData() {
    return (
      firstName: state.tempFirstName ?? '',
      lastName: state.tempLastName ?? '',
      birthDate: state.tempBirthDate,
    );
  }

  /// Establece el usuario actual después de completar el formulario básico
  void setUser(User user) {
    state = state.copyWith(
      currentUser: user,
      isCreatingUser: false,
      // ✅ LIMPIAR datos temporales después de crear el usuario
      tempFirstName: null,
      tempLastName: null,
      tempBirthDate: null,
      hasTemporaryData: false,
    );
  }

  /// Agrega una dirección al usuario actual
  void addAddressToUser(Address address) {
    if (state.currentUser == null) return;

    final updatedAddresses = [...state.currentUser!.addresses, address];
    final updatedUser =
        state.currentUser!.copyWith(addresses: updatedAddresses);

    state = state.copyWith(currentUser: updatedUser);
  }

  /// Elimina una dirección del usuario actual
  void removeAddressFromUser(String addressId) {
    if (state.currentUser == null) return;

    final updatedAddresses = state.currentUser!.addresses
        .where((address) => address.id != addressId)
        .toList();
    final updatedUser =
        state.currentUser!.copyWith(addresses: updatedAddresses);

    state = state.copyWith(currentUser: updatedUser);
  }

  /// Actualiza las direcciones completas del usuario
  void updateUserAddresses(List<Address> addresses) {
    if (state.currentUser == null) return;

    final updatedUser = state.currentUser!.copyWith(addresses: addresses);
    state = state.copyWith(currentUser: updatedUser);
  }

  /// Marca el perfil como completado
  void markProfileAsCompleted() {
    state = state.copyWith(hasCompletedProfile: true);
  }

  /// Reinicia el estado del usuario
  void resetUser() {
    state = const GlobalUserState();
  }

  /// Actualiza información básica del usuario
  void updateUserBasicInfo({
    String? firstName,
    String? lastName,
    DateTime? birthDate,
  }) {
    if (state.currentUser == null) return;

    final updatedUser = state.currentUser!.copyWith(
      firstName: firstName ?? state.currentUser!.firstName,
      lastName: lastName ?? state.currentUser!.lastName,
      birthDate: birthDate ?? state.currentUser!.birthDate,
    );

    state = state.copyWith(currentUser: updatedUser);
  }
}

/// Provider para verificar si el usuario tiene datos
@riverpod
bool hasUserData(Ref ref) {
  final userState = ref.watch(globalUserNotifierProvider);
  return userState.currentUser != null;
}

/// Provider para obtener el nombre completo del usuario
@riverpod
String userFullName(Ref ref) {
  final userState = ref.watch(globalUserNotifierProvider);
  if (userState.currentUser == null) return '';

  return '${userState.currentUser!.firstName} ${userState.currentUser!.lastName}';
}

/// Provider para obtener la edad del usuario
@riverpod
int userAge(Ref ref) {
  final userState = ref.watch(globalUserNotifierProvider);
  if (userState.currentUser == null) return 0;

  final now = DateTime.now();
  final birthDate = userState.currentUser!.birthDate;
  int age = now.year - birthDate.year;

  if (now.month < birthDate.month ||
      (now.month == birthDate.month && now.day < birthDate.day)) {
    age--;
  }

  return age;
}
