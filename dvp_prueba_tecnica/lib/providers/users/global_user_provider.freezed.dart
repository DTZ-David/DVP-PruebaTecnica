// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_user_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GlobalUserState {
  User? get currentUser => throw _privateConstructorUsedError;
  bool get isCreatingUser => throw _privateConstructorUsedError;
  bool get hasCompletedProfile =>
      throw _privateConstructorUsedError; // ✅ NUEVO: Guardar datos del formulario temporalmente
  String? get tempFirstName => throw _privateConstructorUsedError;
  String? get tempLastName => throw _privateConstructorUsedError;
  DateTime? get tempBirthDate => throw _privateConstructorUsedError;
  bool get hasTemporaryData => throw _privateConstructorUsedError;

  /// Create a copy of GlobalUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GlobalUserStateCopyWith<GlobalUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalUserStateCopyWith<$Res> {
  factory $GlobalUserStateCopyWith(
          GlobalUserState value, $Res Function(GlobalUserState) then) =
      _$GlobalUserStateCopyWithImpl<$Res, GlobalUserState>;
  @useResult
  $Res call(
      {User? currentUser,
      bool isCreatingUser,
      bool hasCompletedProfile,
      String? tempFirstName,
      String? tempLastName,
      DateTime? tempBirthDate,
      bool hasTemporaryData});

  $UserCopyWith<$Res>? get currentUser;
}

/// @nodoc
class _$GlobalUserStateCopyWithImpl<$Res, $Val extends GlobalUserState>
    implements $GlobalUserStateCopyWith<$Res> {
  _$GlobalUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GlobalUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentUser = freezed,
    Object? isCreatingUser = null,
    Object? hasCompletedProfile = null,
    Object? tempFirstName = freezed,
    Object? tempLastName = freezed,
    Object? tempBirthDate = freezed,
    Object? hasTemporaryData = null,
  }) {
    return _then(_value.copyWith(
      currentUser: freezed == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as User?,
      isCreatingUser: null == isCreatingUser
          ? _value.isCreatingUser
          : isCreatingUser // ignore: cast_nullable_to_non_nullable
              as bool,
      hasCompletedProfile: null == hasCompletedProfile
          ? _value.hasCompletedProfile
          : hasCompletedProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      tempFirstName: freezed == tempFirstName
          ? _value.tempFirstName
          : tempFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      tempLastName: freezed == tempLastName
          ? _value.tempLastName
          : tempLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      tempBirthDate: freezed == tempBirthDate
          ? _value.tempBirthDate
          : tempBirthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasTemporaryData: null == hasTemporaryData
          ? _value.hasTemporaryData
          : hasTemporaryData // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of GlobalUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get currentUser {
    if (_value.currentUser == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.currentUser!, (value) {
      return _then(_value.copyWith(currentUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GlobalUserStateImplCopyWith<$Res>
    implements $GlobalUserStateCopyWith<$Res> {
  factory _$$GlobalUserStateImplCopyWith(_$GlobalUserStateImpl value,
          $Res Function(_$GlobalUserStateImpl) then) =
      __$$GlobalUserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User? currentUser,
      bool isCreatingUser,
      bool hasCompletedProfile,
      String? tempFirstName,
      String? tempLastName,
      DateTime? tempBirthDate,
      bool hasTemporaryData});

  @override
  $UserCopyWith<$Res>? get currentUser;
}

/// @nodoc
class __$$GlobalUserStateImplCopyWithImpl<$Res>
    extends _$GlobalUserStateCopyWithImpl<$Res, _$GlobalUserStateImpl>
    implements _$$GlobalUserStateImplCopyWith<$Res> {
  __$$GlobalUserStateImplCopyWithImpl(
      _$GlobalUserStateImpl _value, $Res Function(_$GlobalUserStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GlobalUserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentUser = freezed,
    Object? isCreatingUser = null,
    Object? hasCompletedProfile = null,
    Object? tempFirstName = freezed,
    Object? tempLastName = freezed,
    Object? tempBirthDate = freezed,
    Object? hasTemporaryData = null,
  }) {
    return _then(_$GlobalUserStateImpl(
      currentUser: freezed == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as User?,
      isCreatingUser: null == isCreatingUser
          ? _value.isCreatingUser
          : isCreatingUser // ignore: cast_nullable_to_non_nullable
              as bool,
      hasCompletedProfile: null == hasCompletedProfile
          ? _value.hasCompletedProfile
          : hasCompletedProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      tempFirstName: freezed == tempFirstName
          ? _value.tempFirstName
          : tempFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      tempLastName: freezed == tempLastName
          ? _value.tempLastName
          : tempLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      tempBirthDate: freezed == tempBirthDate
          ? _value.tempBirthDate
          : tempBirthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasTemporaryData: null == hasTemporaryData
          ? _value.hasTemporaryData
          : hasTemporaryData // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GlobalUserStateImpl implements _GlobalUserState {
  const _$GlobalUserStateImpl(
      {this.currentUser,
      this.isCreatingUser = false,
      this.hasCompletedProfile = false,
      this.tempFirstName,
      this.tempLastName,
      this.tempBirthDate,
      this.hasTemporaryData = false});

  @override
  final User? currentUser;
  @override
  @JsonKey()
  final bool isCreatingUser;
  @override
  @JsonKey()
  final bool hasCompletedProfile;
// ✅ NUEVO: Guardar datos del formulario temporalmente
  @override
  final String? tempFirstName;
  @override
  final String? tempLastName;
  @override
  final DateTime? tempBirthDate;
  @override
  @JsonKey()
  final bool hasTemporaryData;

  @override
  String toString() {
    return 'GlobalUserState(currentUser: $currentUser, isCreatingUser: $isCreatingUser, hasCompletedProfile: $hasCompletedProfile, tempFirstName: $tempFirstName, tempLastName: $tempLastName, tempBirthDate: $tempBirthDate, hasTemporaryData: $hasTemporaryData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalUserStateImpl &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.isCreatingUser, isCreatingUser) ||
                other.isCreatingUser == isCreatingUser) &&
            (identical(other.hasCompletedProfile, hasCompletedProfile) ||
                other.hasCompletedProfile == hasCompletedProfile) &&
            (identical(other.tempFirstName, tempFirstName) ||
                other.tempFirstName == tempFirstName) &&
            (identical(other.tempLastName, tempLastName) ||
                other.tempLastName == tempLastName) &&
            (identical(other.tempBirthDate, tempBirthDate) ||
                other.tempBirthDate == tempBirthDate) &&
            (identical(other.hasTemporaryData, hasTemporaryData) ||
                other.hasTemporaryData == hasTemporaryData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentUser,
      isCreatingUser,
      hasCompletedProfile,
      tempFirstName,
      tempLastName,
      tempBirthDate,
      hasTemporaryData);

  /// Create a copy of GlobalUserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalUserStateImplCopyWith<_$GlobalUserStateImpl> get copyWith =>
      __$$GlobalUserStateImplCopyWithImpl<_$GlobalUserStateImpl>(
          this, _$identity);
}

abstract class _GlobalUserState implements GlobalUserState {
  const factory _GlobalUserState(
      {final User? currentUser,
      final bool isCreatingUser,
      final bool hasCompletedProfile,
      final String? tempFirstName,
      final String? tempLastName,
      final DateTime? tempBirthDate,
      final bool hasTemporaryData}) = _$GlobalUserStateImpl;

  @override
  User? get currentUser;
  @override
  bool get isCreatingUser;
  @override
  bool
      get hasCompletedProfile; // ✅ NUEVO: Guardar datos del formulario temporalmente
  @override
  String? get tempFirstName;
  @override
  String? get tempLastName;
  @override
  DateTime? get tempBirthDate;
  @override
  bool get hasTemporaryData;

  /// Create a copy of GlobalUserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GlobalUserStateImplCopyWith<_$GlobalUserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
