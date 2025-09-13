import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_form_models.freezed.dart';

@freezed
class UserFormState with _$UserFormState {
  const factory UserFormState({
    @Default('') String firstName,
    @Default('') String lastName,
    DateTime? birthDate,
    @Default(false) bool isLoading,
    @Default(false) bool isValid,
    String? firstNameError,
    String? lastNameError,
    String? birthDateError,
    @Default(false) bool firstNameTouched,
    @Default(false) bool lastNameTouched,
    @Default(false) bool birthDateTouched,
  }) = _UserFormState;
}
