import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String firstname;
  final String lastname;
  final String email;
  final String? phone;
  final String? birthday;
  final String? gender;
  final String? image;

  const UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.birthday,
    required this.gender,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
