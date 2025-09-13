// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      id: json['id'] as String?,
      countryId: json['countryId'] as String,
      departmentId: json['departmentId'] as String,
      municipalityId: json['municipalityId'] as String,
      countryName: json['countryName'] as String,
      departmentName: json['departmentName'] as String,
      municipalityName: json['municipalityName'] as String,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'countryId': instance.countryId,
      'departmentId': instance.departmentId,
      'municipalityId': instance.municipalityId,
      'countryName': instance.countryName,
      'departmentName': instance.departmentName,
      'municipalityName': instance.municipalityName,
    };
