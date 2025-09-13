// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UsersListState {
  List<User> get users => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get isInitialized => throw _privateConstructorUsedError; // ✅ NUEVO
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of UsersListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsersListStateCopyWith<UsersListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersListStateCopyWith<$Res> {
  factory $UsersListStateCopyWith(
          UsersListState value, $Res Function(UsersListState) then) =
      _$UsersListStateCopyWithImpl<$Res, UsersListState>;
  @useResult
  $Res call(
      {List<User> users,
      bool isLoading,
      bool hasError,
      bool isInitialized,
      String? errorMessage});
}

/// @nodoc
class _$UsersListStateCopyWithImpl<$Res, $Val extends UsersListState>
    implements $UsersListStateCopyWith<$Res> {
  _$UsersListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsersListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? isLoading = null,
    Object? hasError = null,
    Object? isInitialized = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsersListStateImplCopyWith<$Res>
    implements $UsersListStateCopyWith<$Res> {
  factory _$$UsersListStateImplCopyWith(_$UsersListStateImpl value,
          $Res Function(_$UsersListStateImpl) then) =
      __$$UsersListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<User> users,
      bool isLoading,
      bool hasError,
      bool isInitialized,
      String? errorMessage});
}

/// @nodoc
class __$$UsersListStateImplCopyWithImpl<$Res>
    extends _$UsersListStateCopyWithImpl<$Res, _$UsersListStateImpl>
    implements _$$UsersListStateImplCopyWith<$Res> {
  __$$UsersListStateImplCopyWithImpl(
      _$UsersListStateImpl _value, $Res Function(_$UsersListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UsersListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? isLoading = null,
    Object? hasError = null,
    Object? isInitialized = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$UsersListStateImpl(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UsersListStateImpl implements _UsersListState {
  const _$UsersListStateImpl(
      {final List<User> users = const [],
      this.isLoading = false,
      this.hasError = false,
      this.isInitialized = false,
      this.errorMessage})
      : _users = users;

  final List<User> _users;
  @override
  @JsonKey()
  List<User> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final bool isInitialized;
// ✅ NUEVO
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'UsersListState(users: $users, isLoading: $isLoading, hasError: $hasError, isInitialized: $isInitialized, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersListStateImpl &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_users),
      isLoading,
      hasError,
      isInitialized,
      errorMessage);

  /// Create a copy of UsersListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersListStateImplCopyWith<_$UsersListStateImpl> get copyWith =>
      __$$UsersListStateImplCopyWithImpl<_$UsersListStateImpl>(
          this, _$identity);
}

abstract class _UsersListState implements UsersListState {
  const factory _UsersListState(
      {final List<User> users,
      final bool isLoading,
      final bool hasError,
      final bool isInitialized,
      final String? errorMessage}) = _$UsersListStateImpl;

  @override
  List<User> get users;
  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  bool get isInitialized; // ✅ NUEVO
  @override
  String? get errorMessage;

  /// Create a copy of UsersListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsersListStateImplCopyWith<_$UsersListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
