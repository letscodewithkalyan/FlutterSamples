import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pages/entities/user_entity.dart';
import 'package:flutter_pages/utils/app_url.dart';
import 'package:http/http.dart';

enum AuthStatus {
  NotLoggedIn,
  NotRegisteredIn,
  LoggedIn,
  Registered,
  Authenticating,
  Registerting,
  LoggedOut,
}

class AuthProvider extends ChangeNotifier {
  AuthStatus _loggenInStatus = AuthStatus.NotLoggedIn;

  Future<Map<String, dynamic>> login(String email, String password) async {
    Map<String, dynamic> loginData = {
      'user': {'email': email, 'password': password}
    };
    _loggenInStatus = AuthStatus.Authenticating;
    notifyListeners();

    var response = await post(Uri.parse(AppUrl.Login),
        body: json.encode(loginData),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      var user = UserEntity.fromJson(responseData['data']);
      _loggenInStatus = AuthStatus.LoggedIn;
      notifyListeners();
      return {'status': true, 'message': 'Success', 'user': user};
    } else {
      _loggenInStatus = AuthStatus.NotLoggedIn;
      notifyListeners();
      return {'status': false, 'message': json.decode(response.body)['error']};
    }
  }
}
