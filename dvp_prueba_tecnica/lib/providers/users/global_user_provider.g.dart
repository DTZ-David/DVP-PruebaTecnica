// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$hasUserDataHash() => r'b2161318c1977966dd909902ceb7b3e6de55736b';

/// Provider para verificar si el usuario tiene datos
///
/// Copied from [hasUserData].
@ProviderFor(hasUserData)
final hasUserDataProvider = AutoDisposeProvider<bool>.internal(
  hasUserData,
  name: r'hasUserDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$hasUserDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HasUserDataRef = AutoDisposeProviderRef<bool>;
String _$userFullNameHash() => r'07f63e29979b9179cbb5d2e62c166eb1b51f0c1d';

/// Provider para obtener el nombre completo del usuario
///
/// Copied from [userFullName].
@ProviderFor(userFullName)
final userFullNameProvider = AutoDisposeProvider<String>.internal(
  userFullName,
  name: r'userFullNameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userFullNameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserFullNameRef = AutoDisposeProviderRef<String>;
String _$userAgeHash() => r'6f71bdcebe03b52f720db5e0d905e7e57c5addd1';

/// Provider para obtener la edad del usuario
///
/// Copied from [userAge].
@ProviderFor(userAge)
final userAgeProvider = AutoDisposeProvider<int>.internal(
  userAge,
  name: r'userAgeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userAgeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserAgeRef = AutoDisposeProviderRef<int>;
String _$globalUserNotifierHash() =>
    r'f92da4d67b0b460f806b9ce41dd0af93c5354e47';

/// See also [GlobalUserNotifier].
@ProviderFor(GlobalUserNotifier)
final globalUserNotifierProvider =
    AutoDisposeNotifierProvider<GlobalUserNotifier, GlobalUserState>.internal(
  GlobalUserNotifier.new,
  name: r'globalUserNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$globalUserNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GlobalUserNotifier = AutoDisposeNotifier<GlobalUserState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
