import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    String? id,
    required String countryId,
    required String departmentId,
    required String municipalityId,
    required String countryName,
    required String departmentName,
    required String municipalityName,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
