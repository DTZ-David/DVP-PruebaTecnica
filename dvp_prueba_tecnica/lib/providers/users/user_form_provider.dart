// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../models/user_form_models.dart';
import '../../models/user_model.dart';
import '../../services/user_form_service.dart';
import '../../services/user_storage_service.dart';
import 'global_user_provider.dart';
import 'user_form_state_manager.dart';

part 'user_form_provider.g.dart';

@riverpod
class UserFormNotifier extends _$UserFormNotifier {
  late UserStorageService _storageService;

  @override
  UserFormState build() {
    _initializeStorage();
    return _loadInitialState();
  }

  /// Inicializa el servicio de almacenamiento
  Future<void> _initializeStorage() async {
    state = UserFormStateManager.setLoading(state, true);
    _storageService = UserStorageService();
    await _storageService.initialize();
    state = UserFormStateManager.setLoading(state, false);
  }

  /// Carga el estado inicial desde datos temporales si existen
  UserFormState _loadInitialState() {
    final globalState = ref.read(globalUserNotifierProvider);
    if (globalState.hasTemporaryData) {
      final tempData =
          ref.read(globalUserNotifierProvider.notifier).getTemporaryData();
      return UserFormStateManager.fromTemporaryData(
        tempData.firstName,
        tempData.lastName,
        tempData.birthDate,
      );
    }
    return const UserFormState();
  }

  /// Actualiza el nombre
  void updateFirstName(String value) {
    state = UserFormStateManager.updateFirstName(state, value);
  }

  /// Actualiza el apellido
  void updateLastName(String value) {
    state = UserFormStateManager.updateLastName(state, value);
  }

  /// Actualiza la fecha de nacimiento
  void updateBirthDate(DateTime? value) {
    state = UserFormStateManager.updateBirthDate(state, value);
  }

  /// Guarda datos temporalmente en el provider global
  void saveTemporaryData() {
    if (UserFormStateManager.hasDataToSaveTemporarily(state)) {
      ref.read(globalUserNotifierProvider.notifier).saveTemporaryFormData(
            firstName: state.firstName,
            lastName: state.lastName,
            birthDate: state.birthDate ?? DateTime.now(),
          );
    }
  }

  /// Envía el formulario
  Future<User?> submitForm() async {
    if (!state.isValid) return null;

    state = UserFormStateManager.setLoading(state, true);

    try {
      final user = await UserFormService.submitUserForm(
        firstName: state.firstName,
        lastName: state.lastName,
        birthDate: state.birthDate!,
      );

      // Guardar en estado global
      ref.read(globalUserNotifierProvider.notifier).setUser(user);

      // Guardar en almacenamiento local
      await _storageService.saveUser(user);

      state = UserFormStateManager.setLoading(state, false);
      return user;
    } catch (e) {
      state = UserFormStateManager.setLoading(state, false);
      return null;
    }
  }

  /// Resetea el formulario
  void reset() {
    state = UserFormStateManager.reset();
  }
}
