// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_form_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddressFormState {
// Datos seleccionados
  String? get selectedCountryId => throw _privateConstructorUsedError;
  String? get selectedDepartmentId => throw _privateConstructorUsedError;
  String? get selectedMunicipalityId => throw _privateConstructorUsedError;
  String? get selectedCountryName => throw _privateConstructorUsedError;
  String? get selectedDepartmentName => throw _privateConstructorUsedError;
  String? get selectedMunicipalityName =>
      throw _privateConstructorUsedError; // Listas de opciones
  List<Country> get countries => throw _privateConstructorUsedError;
  List<Department> get departments => throw _privateConstructorUsedError;
  List<Municipality> get municipalities =>
      throw _privateConstructorUsedError; // Estados de carga
  bool get isLoadingCountries => throw _privateConstructorUsedError;
  bool get isLoadingDepartments => throw _privateConstructorUsedError;
  bool get isLoadingMunicipalities => throw _privateConstructorUsedError;
  bool get isSavingAddress =>
      throw _privateConstructorUsedError; // Lista de direcciones guardadas
  List<Address> get savedAddresses =>
      throw _privateConstructorUsedError; // Validación
  bool get isValid => throw _privateConstructorUsedError;
  String? get countryError => throw _privateConstructorUsedError;
  String? get departmentError => throw _privateConstructorUsedError;
  String? get municipalityError => throw _privateConstructorUsedError;

  /// Create a copy of AddressFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressFormStateCopyWith<AddressFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressFormStateCopyWith<$Res> {
  factory $AddressFormStateCopyWith(
          AddressFormState value, $Res Function(AddressFormState) then) =
      _$AddressFormStateCopyWithImpl<$Res, AddressFormState>;
  @useResult
  $Res call(
      {String? selectedCountryId,
      String? selectedDepartmentId,
      String? selectedMunicipalityId,
      String? selectedCountryName,
      String? selectedDepartmentName,
      String? selectedMunicipalityName,
      List<Country> countries,
      List<Department> departments,
      List<Municipality> municipalities,
      bool isLoadingCountries,
      bool isLoadingDepartments,
      bool isLoadingMunicipalities,
      bool isSavingAddress,
      List<Address> savedAddresses,
      bool isValid,
      String? countryError,
      String? departmentError,
      String? municipalityError});
}

/// @nodoc
class _$AddressFormStateCopyWithImpl<$Res, $Val extends AddressFormState>
    implements $AddressFormStateCopyWith<$Res> {
  _$AddressFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCountryId = freezed,
    Object? selectedDepartmentId = freezed,
    Object? selectedMunicipalityId = freezed,
    Object? selectedCountryName = freezed,
    Object? selectedDepartmentName = freezed,
    Object? selectedMunicipalityName = freezed,
    Object? countries = null,
    Object? departments = null,
    Object? municipalities = null,
    Object? isLoadingCountries = null,
    Object? isLoadingDepartments = null,
    Object? isLoadingMunicipalities = null,
    Object? isSavingAddress = null,
    Object? savedAddresses = null,
    Object? isValid = null,
    Object? countryError = freezed,
    Object? departmentError = freezed,
    Object? municipalityError = freezed,
  }) {
    return _then(_value.copyWith(
      selectedCountryId: freezed == selectedCountryId
          ? _value.selectedCountryId
          : selectedCountryId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDepartmentId: freezed == selectedDepartmentId
          ? _value.selectedDepartmentId
          : selectedDepartmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedMunicipalityId: freezed == selectedMunicipalityId
          ? _value.selectedMunicipalityId
          : selectedMunicipalityId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCountryName: freezed == selectedCountryName
          ? _value.selectedCountryName
          : selectedCountryName // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDepartmentName: freezed == selectedDepartmentName
          ? _value.selectedDepartmentName
          : selectedDepartmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedMunicipalityName: freezed == selectedMunicipalityName
          ? _value.selectedMunicipalityName
          : selectedMunicipalityName // ignore: cast_nullable_to_non_nullable
              as String?,
      countries: null == countries
          ? _value.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<Country>,
      departments: null == departments
          ? _value.departments
          : departments // ignore: cast_nullable_to_non_nullable
              as List<Department>,
      municipalities: null == municipalities
          ? _value.municipalities
          : municipalities // ignore: cast_nullable_to_non_nullable
              as List<Municipality>,
      isLoadingCountries: null == isLoadingCountries
          ? _value.isLoadingCountries
          : isLoadingCountries // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingDepartments: null == isLoadingDepartments
          ? _value.isLoadingDepartments
          : isLoadingDepartments // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMunicipalities: null == isLoadingMunicipalities
          ? _value.isLoadingMunicipalities
          : isLoadingMunicipalities // ignore: cast_nullable_to_non_nullable
              as bool,
      isSavingAddress: null == isSavingAddress
          ? _value.isSavingAddress
          : isSavingAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      savedAddresses: null == savedAddresses
          ? _value.savedAddresses
          : savedAddresses // ignore: cast_nullable_to_non_nullable
              as List<Address>,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      countryError: freezed == countryError
          ? _value.countryError
          : countryError // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentError: freezed == departmentError
          ? _value.departmentError
          : departmentError // ignore: cast_nullable_to_non_nullable
              as String?,
      municipalityError: freezed == municipalityError
          ? _value.municipalityError
          : municipalityError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressFormStateImplCopyWith<$Res>
    implements $AddressFormStateCopyWith<$Res> {
  factory _$$AddressFormStateImplCopyWith(_$AddressFormStateImpl value,
          $Res Function(_$AddressFormStateImpl) then) =
      __$$AddressFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? selectedCountryId,
      String? selectedDepartmentId,
      String? selectedMunicipalityId,
      String? selectedCountryName,
      String? selectedDepartmentName,
      String? selectedMunicipalityName,
      List<Country> countries,
      List<Department> departments,
      List<Municipality> municipalities,
      bool isLoadingCountries,
      bool isLoadingDepartments,
      bool isLoadingMunicipalities,
      bool isSavingAddress,
      List<Address> savedAddresses,
      bool isValid,
      String? countryError,
      String? departmentError,
      String? municipalityError});
}

/// @nodoc
class __$$AddressFormStateImplCopyWithImpl<$Res>
    extends _$AddressFormStateCopyWithImpl<$Res, _$AddressFormStateImpl>
    implements _$$AddressFormStateImplCopyWith<$Res> {
  __$$AddressFormStateImplCopyWithImpl(_$AddressFormStateImpl _value,
      $Res Function(_$AddressFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddressFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCountryId = freezed,
    Object? selectedDepartmentId = freezed,
    Object? selectedMunicipalityId = freezed,
    Object? selectedCountryName = freezed,
    Object? selectedDepartmentName = freezed,
    Object? selectedMunicipalityName = freezed,
    Object? countries = null,
    Object? departments = null,
    Object? municipalities = null,
    Object? isLoadingCountries = null,
    Object? isLoadingDepartments = null,
    Object? isLoadingMunicipalities = null,
    Object? isSavingAddress = null,
    Object? savedAddresses = null,
    Object? isValid = null,
    Object? countryError = freezed,
    Object? departmentError = freezed,
    Object? municipalityError = freezed,
  }) {
    return _then(_$AddressFormStateImpl(
      selectedCountryId: freezed == selectedCountryId
          ? _value.selectedCountryId
          : selectedCountryId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDepartmentId: freezed == selectedDepartmentId
          ? _value.selectedDepartmentId
          : selectedDepartmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedMunicipalityId: freezed == selectedMunicipalityId
          ? _value.selectedMunicipalityId
          : selectedMunicipalityId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCountryName: freezed == selectedCountryName
          ? _value.selectedCountryName
          : selectedCountryName // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedDepartmentName: freezed == selectedDepartmentName
          ? _value.selectedDepartmentName
          : selectedDepartmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedMunicipalityName: freezed == selectedMunicipalityName
          ? _value.selectedMunicipalityName
          : selectedMunicipalityName // ignore: cast_nullable_to_non_nullable
              as String?,
      countries: null == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<Country>,
      departments: null == departments
          ? _value._departments
          : departments // ignore: cast_nullable_to_non_nullable
              as List<Department>,
      municipalities: null == municipalities
          ? _value._municipalities
          : municipalities // ignore: cast_nullable_to_non_nullable
              as List<Municipality>,
      isLoadingCountries: null == isLoadingCountries
          ? _value.isLoadingCountries
          : isLoadingCountries // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingDepartments: null == isLoadingDepartments
          ? _value.isLoadingDepartments
          : isLoadingDepartments // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMunicipalities: null == isLoadingMunicipalities
          ? _value.isLoadingMunicipalities
          : isLoadingMunicipalities // ignore: cast_nullable_to_non_nullable
              as bool,
      isSavingAddress: null == isSavingAddress
          ? _value.isSavingAddress
          : isSavingAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      savedAddresses: null == savedAddresses
          ? _value._savedAddresses
          : savedAddresses // ignore: cast_nullable_to_non_nullable
              as List<Address>,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      countryError: freezed == countryError
          ? _value.countryError
          : countryError // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentError: freezed == departmentError
          ? _value.departmentError
          : departmentError // ignore: cast_nullable_to_non_nullable
              as String?,
      municipalityError: freezed == municipalityError
          ? _value.municipalityError
          : municipalityError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddressFormStateImpl implements _AddressFormState {
  const _$AddressFormStateImpl(
      {this.selectedCountryId,
      this.selectedDepartmentId,
      this.selectedMunicipalityId,
      this.selectedCountryName,
      this.selectedDepartmentName,
      this.selectedMunicipalityName,
      final List<Country> countries = const [],
      final List<Department> departments = const [],
      final List<Municipality> municipalities = const [],
      this.isLoadingCountries = false,
      this.isLoadingDepartments = false,
      this.isLoadingMunicipalities = false,
      this.isSavingAddress = false,
      final List<Address> savedAddresses = const [],
      this.isValid = false,
      this.countryError,
      this.departmentError,
      this.municipalityError})
      : _countries = countries,
        _departments = departments,
        _municipalities = municipalities,
        _savedAddresses = savedAddresses;

// Datos seleccionados
  @override
  final String? selectedCountryId;
  @override
  final String? selectedDepartmentId;
  @override
  final String? selectedMunicipalityId;
  @override
  final String? selectedCountryName;
  @override
  final String? selectedDepartmentName;
  @override
  final String? selectedMunicipalityName;
// Listas de opciones
  final List<Country> _countries;
// Listas de opciones
  @override
  @JsonKey()
  List<Country> get countries {
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  final List<Department> _departments;
  @override
  @JsonKey()
  List<Department> get departments {
    if (_departments is EqualUnmodifiableListView) return _departments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_departments);
  }

  final List<Municipality> _municipalities;
  @override
  @JsonKey()
  List<Municipality> get municipalities {
    if (_municipalities is EqualUnmodifiableListView) return _municipalities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_municipalities);
  }

// Estados de carga
  @override
  @JsonKey()
  final bool isLoadingCountries;
  @override
  @JsonKey()
  final bool isLoadingDepartments;
  @override
  @JsonKey()
  final bool isLoadingMunicipalities;
  @override
  @JsonKey()
  final bool isSavingAddress;
// Lista de direcciones guardadas
  final List<Address> _savedAddresses;
// Lista de direcciones guardadas
  @override
  @JsonKey()
  List<Address> get savedAddresses {
    if (_savedAddresses is EqualUnmodifiableListView) return _savedAddresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedAddresses);
  }

// Validación
  @override
  @JsonKey()
  final bool isValid;
  @override
  final String? countryError;
  @override
  final String? departmentError;
  @override
  final String? municipalityError;

  @override
  String toString() {
    return 'AddressFormState(selectedCountryId: $selectedCountryId, selectedDepartmentId: $selectedDepartmentId, selectedMunicipalityId: $selectedMunicipalityId, selectedCountryName: $selectedCountryName, selectedDepartmentName: $selectedDepartmentName, selectedMunicipalityName: $selectedMunicipalityName, countries: $countries, departments: $departments, municipalities: $municipalities, isLoadingCountries: $isLoadingCountries, isLoadingDepartments: $isLoadingDepartments, isLoadingMunicipalities: $isLoadingMunicipalities, isSavingAddress: $isSavingAddress, savedAddresses: $savedAddresses, isValid: $isValid, countryError: $countryError, departmentError: $departmentError, municipalityError: $municipalityError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressFormStateImpl &&
            (identical(other.selectedCountryId, selectedCountryId) ||
                other.selectedCountryId == selectedCountryId) &&
            (identical(other.selectedDepartmentId, selectedDepartmentId) ||
                other.selectedDepartmentId == selectedDepartmentId) &&
            (identical(other.selectedMunicipalityId, selectedMunicipalityId) ||
                other.selectedMunicipalityId == selectedMunicipalityId) &&
            (identical(other.selectedCountryName, selectedCountryName) ||
                other.selectedCountryName == selectedCountryName) &&
            (identical(other.selectedDepartmentName, selectedDepartmentName) ||
                other.selectedDepartmentName == selectedDepartmentName) &&
            (identical(
                    other.selectedMunicipalityName, selectedMunicipalityName) ||
                other.selectedMunicipalityName == selectedMunicipalityName) &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries) &&
            const DeepCollectionEquality()
                .equals(other._departments, _departments) &&
            const DeepCollectionEquality()
                .equals(other._municipalities, _municipalities) &&
            (identical(other.isLoadingCountries, isLoadingCountries) ||
                other.isLoadingCountries == isLoadingCountries) &&
            (identical(other.isLoadingDepartments, isLoadingDepartments) ||
                other.isLoadingDepartments == isLoadingDepartments) &&
            (identical(
                    other.isLoadingMunicipalities, isLoadingMunicipalities) ||
                other.isLoadingMunicipalities == isLoadingMunicipalities) &&
            (identical(other.isSavingAddress, isSavingAddress) ||
                other.isSavingAddress == isSavingAddress) &&
            const DeepCollectionEquality()
                .equals(other._savedAddresses, _savedAddresses) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.countryError, countryError) ||
                other.countryError == countryError) &&
            (identical(other.departmentError, departmentError) ||
                other.departmentError == departmentError) &&
            (identical(other.municipalityError, municipalityError) ||
                other.municipalityError == municipalityError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedCountryId,
      selectedDepartmentId,
      selectedMunicipalityId,
      selectedCountryName,
      selectedDepartmentName,
      selectedMunicipalityName,
      const DeepCollectionEquality().hash(_countries),
      const DeepCollectionEquality().hash(_departments),
      const DeepCollectionEquality().hash(_municipalities),
      isLoadingCountries,
      isLoadingDepartments,
      isLoadingMunicipalities,
      isSavingAddress,
      const DeepCollectionEquality().hash(_savedAddresses),
      isValid,
      countryError,
      departmentError,
      municipalityError);

  /// Create a copy of AddressFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressFormStateImplCopyWith<_$AddressFormStateImpl> get copyWith =>
      __$$AddressFormStateImplCopyWithImpl<_$AddressFormStateImpl>(
          this, _$identity);
}

abstract class _AddressFormState implements AddressFormState {
  const factory _AddressFormState(
      {final String? selectedCountryId,
      final String? selectedDepartmentId,
      final String? selectedMunicipalityId,
      final String? selectedCountryName,
      final String? selectedDepartmentName,
      final String? selectedMunicipalityName,
      final List<Country> countries,
      final List<Department> departments,
      final List<Municipality> municipalities,
      final bool isLoadingCountries,
      final bool isLoadingDepartments,
      final bool isLoadingMunicipalities,
      final bool isSavingAddress,
      final List<Address> savedAddresses,
      final bool isValid,
      final String? countryError,
      final String? departmentError,
      final String? municipalityError}) = _$AddressFormStateImpl;

// Datos seleccionados
  @override
  String? get selectedCountryId;
  @override
  String? get selectedDepartmentId;
  @override
  String? get selectedMunicipalityId;
  @override
  String? get selectedCountryName;
  @override
  String? get selectedDepartmentName;
  @override
  String? get selectedMunicipalityName; // Listas de opciones
  @override
  List<Country> get countries;
  @override
  List<Department> get departments;
  @override
  List<Municipality> get municipalities; // Estados de carga
  @override
  bool get isLoadingCountries;
  @override
  bool get isLoadingDepartments;
  @override
  bool get isLoadingMunicipalities;
  @override
  bool get isSavingAddress; // Lista de direcciones guardadas
  @override
  List<Address> get savedAddresses; // Validación
  @override
  bool get isValid;
  @override
  String? get countryError;
  @override
  String? get departmentError;
  @override
  String? get municipalityError;

  /// Create a copy of AddressFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressFormStateImplCopyWith<_$AddressFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Country {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res, Country>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res, $Val extends Country>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryImplCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$$CountryImplCopyWith(
          _$CountryImpl value, $Res Function(_$CountryImpl) then) =
      __$$CountryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$CountryImplCopyWithImpl<$Res>
    extends _$CountryCopyWithImpl<$Res, _$CountryImpl>
    implements _$$CountryImplCopyWith<$Res> {
  __$$CountryImplCopyWithImpl(
      _$CountryImpl _value, $Res Function(_$CountryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$CountryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CountryImpl implements _Country {
  const _$CountryImpl({required this.id, required this.name});

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'Country(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      __$$CountryImplCopyWithImpl<_$CountryImpl>(this, _$identity);
}

abstract class _Country implements Country {
  const factory _Country(
      {required final String id, required final String name}) = _$CountryImpl;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of Country
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountryImplCopyWith<_$CountryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Department {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get countryId => throw _privateConstructorUsedError;

  /// Create a copy of Department
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DepartmentCopyWith<Department> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepartmentCopyWith<$Res> {
  factory $DepartmentCopyWith(
          Department value, $Res Function(Department) then) =
      _$DepartmentCopyWithImpl<$Res, Department>;
  @useResult
  $Res call({String id, String name, String countryId});
}

/// @nodoc
class _$DepartmentCopyWithImpl<$Res, $Val extends Department>
    implements $DepartmentCopyWith<$Res> {
  _$DepartmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Department
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? countryId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      countryId: null == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DepartmentImplCopyWith<$Res>
    implements $DepartmentCopyWith<$Res> {
  factory _$$DepartmentImplCopyWith(
          _$DepartmentImpl value, $Res Function(_$DepartmentImpl) then) =
      __$$DepartmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String countryId});
}

/// @nodoc
class __$$DepartmentImplCopyWithImpl<$Res>
    extends _$DepartmentCopyWithImpl<$Res, _$DepartmentImpl>
    implements _$$DepartmentImplCopyWith<$Res> {
  __$$DepartmentImplCopyWithImpl(
      _$DepartmentImpl _value, $Res Function(_$DepartmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Department
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? countryId = null,
  }) {
    return _then(_$DepartmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      countryId: null == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DepartmentImpl implements _Department {
  const _$DepartmentImpl(
      {required this.id, required this.name, required this.countryId});

  @override
  final String id;
  @override
  final String name;
  @override
  final String countryId;

  @override
  String toString() {
    return 'Department(id: $id, name: $name, countryId: $countryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepartmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, countryId);

  /// Create a copy of Department
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DepartmentImplCopyWith<_$DepartmentImpl> get copyWith =>
      __$$DepartmentImplCopyWithImpl<_$DepartmentImpl>(this, _$identity);
}

abstract class _Department implements Department {
  const factory _Department(
      {required final String id,
      required final String name,
      required final String countryId}) = _$DepartmentImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get countryId;

  /// Create a copy of Department
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DepartmentImplCopyWith<_$DepartmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Municipality {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get departmentId => throw _privateConstructorUsedError;

  /// Create a copy of Municipality
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MunicipalityCopyWith<Municipality> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MunicipalityCopyWith<$Res> {
  factory $MunicipalityCopyWith(
          Municipality value, $Res Function(Municipality) then) =
      _$MunicipalityCopyWithImpl<$Res, Municipality>;
  @useResult
  $Res call({String id, String name, String departmentId});
}

/// @nodoc
class _$MunicipalityCopyWithImpl<$Res, $Val extends Municipality>
    implements $MunicipalityCopyWith<$Res> {
  _$MunicipalityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Municipality
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? departmentId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MunicipalityImplCopyWith<$Res>
    implements $MunicipalityCopyWith<$Res> {
  factory _$$MunicipalityImplCopyWith(
          _$MunicipalityImpl value, $Res Function(_$MunicipalityImpl) then) =
      __$$MunicipalityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String departmentId});
}

/// @nodoc
class __$$MunicipalityImplCopyWithImpl<$Res>
    extends _$MunicipalityCopyWithImpl<$Res, _$MunicipalityImpl>
    implements _$$MunicipalityImplCopyWith<$Res> {
  __$$MunicipalityImplCopyWithImpl(
      _$MunicipalityImpl _value, $Res Function(_$MunicipalityImpl) _then)
      : super(_value, _then);

  /// Create a copy of Municipality
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? departmentId = null,
  }) {
    return _then(_$MunicipalityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MunicipalityImpl implements _Municipality {
  const _$MunicipalityImpl(
      {required this.id, required this.name, required this.departmentId});

  @override
  final String id;
  @override
  final String name;
  @override
  final String departmentId;

  @override
  String toString() {
    return 'Municipality(id: $id, name: $name, departmentId: $departmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MunicipalityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, departmentId);

  /// Create a copy of Municipality
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MunicipalityImplCopyWith<_$MunicipalityImpl> get copyWith =>
      __$$MunicipalityImplCopyWithImpl<_$MunicipalityImpl>(this, _$identity);
}

abstract class _Municipality implements Municipality {
  const factory _Municipality(
      {required final String id,
      required final String name,
      required final String departmentId}) = _$MunicipalityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get departmentId;

  /// Create a copy of Municipality
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MunicipalityImplCopyWith<_$MunicipalityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
