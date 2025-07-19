import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  final String? title;
  final String? description;
  final String? url;
  ImageModel({
    required this.title,
    required this.description,
    required this.url,
  });
  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}

@JsonSerializable()
class ImageResponse {
  final String? status;
  final int? code;
  final int? total;
  final List<ImageModel>? data;
  const ImageResponse({
    required this.status,
    required this.code,
    required this.total,
    required this.data,
  });
  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);
}
