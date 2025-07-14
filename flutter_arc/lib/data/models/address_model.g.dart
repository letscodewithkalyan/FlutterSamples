// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
  id: (json['id'] as num?)?.toInt(),
  street: json['street'] as String?,
  streetName: json['streetName'] as String?,
  buildingNumber: json['buildingNumber'] as String?,
  city: json['city'] as String?,
  zipcode: json['zipcode'] as String?,
  country: json['country'] as String?,
  countryCode: json['countryCode'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
);

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'street': instance.street,
      'streetName': instance.streetName,
      'buildingNumber': instance.buildingNumber,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'country': instance.country,
      'countryCode': instance.countryCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

AddressesResponse _$AddressesResponseFromJson(Map<String, dynamic> json) =>
    AddressesResponse(
      status: json['status'] as String,
      code: (json['code'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressesResponseToJson(AddressesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'total': instance.total,
      'data': instance.data,
    };
