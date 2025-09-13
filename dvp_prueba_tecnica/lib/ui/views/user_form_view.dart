import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../atomic_design/atoms/app_text.dart';
import '../../atomic_design/atoms/primary_button.dart';
import '../../atomic_design/atoms/text_field.dart';
import '../../atomic_design/protons/colors.dart';
import '../../atomic_design/protons/spacing.dart';
import '../../models/user_model.dart';
import '../../providers/users/global_user_provider.dart';
import '../../providers/users/user_form_provider.dart';
import '../widgets/userForm/date_picker_widget.dart';

class UserFormView extends ConsumerStatefulWidget {
  final VoidCallback? onFormSubmitted;

  const UserFormView({
    super.key,
    this.onFormSubmitted,
  });

  @override
  ConsumerState<UserFormView> createState() => _UserFormViewState();
}

class _UserFormViewState extends ConsumerState<UserFormView> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  bool _hasInitializedControllers = false;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _initializeControllersWithUserData(
      User user, UserFormNotifier formNotifier) {
    if (_hasInitializedControllers) return;

    _firstNameController.text = user.firstName;
    _lastNameController.text = user.lastName;

    // Inicializar el estado del formulario con los datos del usuario
    formNotifier.updateFirstName(user.firstName);
    formNotifier.updateLastName(user.lastName);
    formNotifier.updateBirthDate(user.birthDate);

    _hasInitializedControllers = true;
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(userFormNotifierProvider);
    final formNotifier = ref.read(userFormNotifierProvider.notifier);

    // ✅ NUEVO: Cargar datos del usuario existente
    final globalUserState = ref.watch(globalUserNotifierProvider);
    if (globalUserState.currentUser != null && !_hasInitializedControllers) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _initializeControllersWithUserData(
            globalUserState.currentUser!, formNotifier);
      });
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            boxShadow: [
              BoxShadow(
                color: AppColors.neutral900.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title - ✅ Cambiar título si ya hay usuario
              AppText.heading3(globalUserState.currentUser != null
                  ? 'Editar Información Personal'
                  : 'Información Personal'),
              const AppText.caption(
                'Completa tus datos básicos para continuar',
                color: AppColors.neutral500,
              ),

              const SizedBox(height: AppSpacing.lg),

              // First Name Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextField(
                    labelText: 'Nombre',
                    hintText: 'Ingresa tu nombre',
                    controller: _firstNameController,
                    keyboardType: TextInputType.name,
                    onChanged: formNotifier.updateFirstName,
                    errorText: formState.firstNameTouched
                        ? formState.firstNameError
                        : null,
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.md),

              // Last Name Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextField(
                    labelText: 'Apellido',
                    hintText: 'Ingresa tu apellido',
                    controller: _lastNameController,
                    keyboardType: TextInputType.name,
                    onChanged: formNotifier.updateLastName,
                    errorText: formState.lastNameTouched
                        ? formState.lastNameError
                        : null,
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.md),

              // Birth Date Field
              DatePickerField(
                labelText: 'Fecha de Nacimiento',
                hintText: 'Selecciona tu fecha de nacimiento',
                selectedDate: formState.birthDate,
                onDateSelected: formNotifier.updateBirthDate,
                errorText: formState.birthDateTouched
                    ? formState.birthDateError
                    : null,
              ),

              const SizedBox(height: AppSpacing.xl),

              // Submit Button
              PrimaryButton(
                text: formState.isLoading ? 'Cargando...' : 'Continuar',
                variant: ButtonVariant.filled,
                onPressed: formState.isValid && !formState.isLoading
                    ? () async {
                        // ✅ Si ya existe usuario, actualizar. Si no, crear nuevo
                        if (globalUserState.currentUser != null) {
                          // Actualizar usuario existente
                          ref
                              .read(globalUserNotifierProvider.notifier)
                              .updateUserBasicInfo(
                                firstName: formState.firstName.trim(),
                                lastName: formState.lastName.trim(),
                                birthDate: formState.birthDate,
                              );
                          if (widget.onFormSubmitted != null) {
                            widget.onFormSubmitted!();
                          }
                        } else {
                          // Crear nuevo usuario
                          final user = await formNotifier.submitForm();
                          if (user != null && widget.onFormSubmitted != null) {
                            widget.onFormSubmitted!();
                          }
                        }
                      }
                    : null,
                isLoading: formState.isLoading,
                isDisabled: !formState.isValid,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
