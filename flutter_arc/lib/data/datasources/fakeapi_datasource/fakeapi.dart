import 'package:flutter_arc/core/api_constants.dart';
import 'package:flutter_arc/data/datasources/api_service.dart';
import 'package:flutter_arc/data/models/address_model.dart';
import 'package:flutter_arc/data/models/user_model.dart';

class FakeApi {
  Future<List<UserModel>> getUsers({int quantity = 20}) async {
    var response = await ApiService().getData<dynamic>(
      ApiConstants.usersEndPoint,
    );
    final List<dynamic> dataList = response.data["data"];
    final List<UserModel> users = dataList
        .map((json) => UserModel.fromJson(json))
        .toList();
    return users;
  }

  Future<List<AddressModel>> getAddresses() async {
    var response = await ApiService().getData<dynamic>(
      ApiConstants.addressEndPoint,
    );
    final List<dynamic> dataList = response.data["data"];
    final List<AddressModel> addresses = dataList
        .map((json) => AddressModel.fromJson(json))
        .toList();
    return addresses;
  }
}
