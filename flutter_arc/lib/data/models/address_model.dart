import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  final int? id;
  final String? street;
  final String? streetName;
  final String? buildingNumber;
  final String? city;
  final String? zipcode;
  final String? country;
  final String? countryCode;
  final double? latitude;
  final double? longitude;

  const AddressModel({
    required this.id,
    required this.street,
    required this.streetName,
    required this.buildingNumber,
    required this.city,
    required this.zipcode,
    required this.country,
    required this.countryCode,
    required this.latitude,
    required this.longitude,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}

@JsonSerializable()
class AddressesResponse {
  final String status;
  final int code;
  final int total;
  final List<AddressModel> data;

  const AddressesResponse({
    required this.status,
    required this.code,
    required this.total,
    required this.data,
  });

  factory AddressesResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressesResponseFromJson(json);
}
