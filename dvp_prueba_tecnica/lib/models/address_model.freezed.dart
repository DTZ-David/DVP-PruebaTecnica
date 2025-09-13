// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  String? get id => throw _privateConstructorUsedError;
  String get countryId => throw _privateConstructorUsedError;
  String get departmentId => throw _privateConstructorUsedError;
  String get municipalityId => throw _privateConstructorUsedError;
  String get countryName => throw _privateConstructorUsedError;
  String get departmentName => throw _privateConstructorUsedError;
  String get municipalityName => throw _privateConstructorUsedError;

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {String? id,
      String countryId,
      String departmentId,
      String municipalityId,
      String countryName,
      String departmentName,
      String municipalityName});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? countryId = null,
    Object? departmentId = null,
    Object? municipalityId = null,
    Object? countryName = null,
    Object? departmentName = null,
    Object? municipalityName = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: null == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String,
      municipalityId: null == municipalityId
          ? _value.municipalityId
          : municipalityId // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      departmentName: null == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String,
      municipalityName: null == municipalityName
          ? _value.municipalityName
          : municipalityName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
          _$AddressImpl value, $Res Function(_$AddressImpl) then) =
      __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String countryId,
      String departmentId,
      String municipalityId,
      String countryName,
      String departmentName,
      String municipalityName});
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
      _$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? countryId = null,
    Object? departmentId = null,
    Object? municipalityId = null,
    Object? countryName = null,
    Object? departmentName = null,
    Object? municipalityName = null,
  }) {
    return _then(_$AddressImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: null == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String,
      municipalityId: null == municipalityId
          ? _value.municipalityId
          : municipalityId // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      departmentName: null == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String,
      municipalityName: null == municipalityName
          ? _value.municipalityName
          : municipalityName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl implements _Address {
  const _$AddressImpl(
      {this.id,
      required this.countryId,
      required this.departmentId,
      required this.municipalityId,
      required this.countryName,
      required this.departmentName,
      required this.municipalityName});

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  final String? id;
  @override
  final String countryId;
  @override
  final String departmentId;
  @override
  final String municipalityId;
  @override
  final String countryName;
  @override
  final String departmentName;
  @override
  final String municipalityName;

  @override
  String toString() {
    return 'Address(id: $id, countryId: $countryId, departmentId: $departmentId, municipalityId: $municipalityId, countryName: $countryName, departmentName: $departmentName, municipalityName: $municipalityName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.municipalityId, municipalityId) ||
                other.municipalityId == municipalityId) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.municipalityName, municipalityName) ||
                other.municipalityName == municipalityName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, countryId, departmentId,
      municipalityId, countryName, departmentName, municipalityName);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  const factory _Address(
      {final String? id,
      required final String countryId,
      required final String departmentId,
      required final String municipalityId,
      required final String countryName,
      required final String departmentName,
      required final String municipalityName}) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  String? get id;
  @override
  String get countryId;
  @override
  String get departmentId;
  @override
  String get municipalityId;
  @override
  String get countryName;
  @override
  String get departmentName;
  @override
  String get municipalityName;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
