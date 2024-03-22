
import 'package:music_player/datasources/api_constants.dart';
import 'package:music_player/datasources/api_service.dart';

import '../models/user.dart';

class AuthRepository{
  Future<User> doLogin() async{
    var response = await APIService().get(APIConstants.LoginUrl);

    return User(firstName: "Kalyan", lastName: "Pidugu");
  }
}