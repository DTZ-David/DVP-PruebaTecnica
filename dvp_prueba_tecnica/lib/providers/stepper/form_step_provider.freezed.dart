// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_step_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FormStepState {
  int get currentStep => throw _privateConstructorUsedError;
  int get totalSteps => throw _privateConstructorUsedError;
  List<String> get stepLabels => throw _privateConstructorUsedError;
  bool get isUserFormCompleted => throw _privateConstructorUsedError;
  bool get isAddressFormCompleted => throw _privateConstructorUsedError;
  bool get isProfileFormCompleted => throw _privateConstructorUsedError;

  /// Create a copy of FormStepState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormStepStateCopyWith<FormStepState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormStepStateCopyWith<$Res> {
  factory $FormStepStateCopyWith(
          FormStepState value, $Res Function(FormStepState) then) =
      _$FormStepStateCopyWithImpl<$Res, FormStepState>;
  @useResult
  $Res call(
      {int currentStep,
      int totalSteps,
      List<String> stepLabels,
      bool isUserFormCompleted,
      bool isAddressFormCompleted,
      bool isProfileFormCompleted});
}

/// @nodoc
class _$FormStepStateCopyWithImpl<$Res, $Val extends FormStepState>
    implements $FormStepStateCopyWith<$Res> {
  _$FormStepStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormStepState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? totalSteps = null,
    Object? stepLabels = null,
    Object? isUserFormCompleted = null,
    Object? isAddressFormCompleted = null,
    Object? isProfileFormCompleted = null,
  }) {
    return _then(_value.copyWith(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      totalSteps: null == totalSteps
          ? _value.totalSteps
          : totalSteps // ignore: cast_nullable_to_non_nullable
              as int,
      stepLabels: null == stepLabels
          ? _value.stepLabels
          : stepLabels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isUserFormCompleted: null == isUserFormCompleted
          ? _value.isUserFormCompleted
          : isUserFormCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddressFormCompleted: null == isAddressFormCompleted
          ? _value.isAddressFormCompleted
          : isAddressFormCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isProfileFormCompleted: null == isProfileFormCompleted
          ? _value.isProfileFormCompleted
          : isProfileFormCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormStepStateImplCopyWith<$Res>
    implements $FormStepStateCopyWith<$Res> {
  factory _$$FormStepStateImplCopyWith(
          _$FormStepStateImpl value, $Res Function(_$FormStepStateImpl) then) =
      __$$FormStepStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentStep,
      int totalSteps,
      List<String> stepLabels,
      bool isUserFormCompleted,
      bool isAddressFormCompleted,
      bool isProfileFormCompleted});
}

/// @nodoc
class __$$FormStepStateImplCopyWithImpl<$Res>
    extends _$FormStepStateCopyWithImpl<$Res, _$FormStepStateImpl>
    implements _$$FormStepStateImplCopyWith<$Res> {
  __$$FormStepStateImplCopyWithImpl(
      _$FormStepStateImpl _value, $Res Function(_$FormStepStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormStepState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? totalSteps = null,
    Object? stepLabels = null,
    Object? isUserFormCompleted = null,
    Object? isAddressFormCompleted = null,
    Object? isProfileFormCompleted = null,
  }) {
    return _then(_$FormStepStateImpl(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      totalSteps: null == totalSteps
          ? _value.totalSteps
          : totalSteps // ignore: cast_nullable_to_non_nullable
              as int,
      stepLabels: null == stepLabels
          ? _value._stepLabels
          : stepLabels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isUserFormCompleted: null == isUserFormCompleted
          ? _value.isUserFormCompleted
          : isUserFormCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddressFormCompleted: null == isAddressFormCompleted
          ? _value.isAddressFormCompleted
          : isAddressFormCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isProfileFormCompleted: null == isProfileFormCompleted
          ? _value.isProfileFormCompleted
          : isProfileFormCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FormStepStateImpl implements _FormStepState {
  const _$FormStepStateImpl(
      {this.currentStep = 1,
      this.totalSteps = 3,
      final List<String> stepLabels = const ['Usuario', 'Dirección', 'Perfil'],
      this.isUserFormCompleted = false,
      this.isAddressFormCompleted = false,
      this.isProfileFormCompleted = false})
      : _stepLabels = stepLabels;

  @override
  @JsonKey()
  final int currentStep;
  @override
  @JsonKey()
  final int totalSteps;
  final List<String> _stepLabels;
  @override
  @JsonKey()
  List<String> get stepLabels {
    if (_stepLabels is EqualUnmodifiableListView) return _stepLabels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stepLabels);
  }

  @override
  @JsonKey()
  final bool isUserFormCompleted;
  @override
  @JsonKey()
  final bool isAddressFormCompleted;
  @override
  @JsonKey()
  final bool isProfileFormCompleted;

  @override
  String toString() {
    return 'FormStepState(currentStep: $currentStep, totalSteps: $totalSteps, stepLabels: $stepLabels, isUserFormCompleted: $isUserFormCompleted, isAddressFormCompleted: $isAddressFormCompleted, isProfileFormCompleted: $isProfileFormCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormStepStateImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.totalSteps, totalSteps) ||
                other.totalSteps == totalSteps) &&
            const DeepCollectionEquality()
                .equals(other._stepLabels, _stepLabels) &&
            (identical(other.isUserFormCompleted, isUserFormCompleted) ||
                other.isUserFormCompleted == isUserFormCompleted) &&
            (identical(other.isAddressFormCompleted, isAddressFormCompleted) ||
                other.isAddressFormCompleted == isAddressFormCompleted) &&
            (identical(other.isProfileFormCompleted, isProfileFormCompleted) ||
                other.isProfileFormCompleted == isProfileFormCompleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentStep,
      totalSteps,
      const DeepCollectionEquality().hash(_stepLabels),
      isUserFormCompleted,
      isAddressFormCompleted,
      isProfileFormCompleted);

  /// Create a copy of FormStepState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormStepStateImplCopyWith<_$FormStepStateImpl> get copyWith =>
      __$$FormStepStateImplCopyWithImpl<_$FormStepStateImpl>(this, _$identity);
}

abstract class _FormStepState implements FormStepState {
  const factory _FormStepState(
      {final int currentStep,
      final int totalSteps,
      final List<String> stepLabels,
      final bool isUserFormCompleted,
      final bool isAddressFormCompleted,
      final bool isProfileFormCompleted}) = _$FormStepStateImpl;

  @override
  int get currentStep;
  @override
  int get totalSteps;
  @override
  List<String> get stepLabels;
  @override
  bool get isUserFormCompleted;
  @override
  bool get isAddressFormCompleted;
  @override
  bool get isProfileFormCompleted;

  /// Create a copy of FormStepState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormStepStateImplCopyWith<_$FormStepStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
