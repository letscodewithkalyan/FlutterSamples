import 'package:flutter_pages/entities/basemodel.dart';

class UserEntity extends BaseModel {
  String name;
  String accessToken;
  String email;
  String renewalToken;
  String type;
  int id;
  UserEntity(this.name, this.accessToken, this.email, this.renewalToken,
      this.type, this.id);

  factory UserEntity.fromJson(Map<String, dynamic> responseData) {
    return UserEntity(
        responseData['name'] ?? "",
        responseData['access_token'] ?? "",
        responseData['email'],
        responseData['renewal_token'],
        responseData['type'],
        responseData['id']);
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
