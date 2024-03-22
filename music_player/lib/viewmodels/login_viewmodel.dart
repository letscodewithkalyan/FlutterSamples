import 'package:flutter/cupertino.dart';
import 'package:music_player/repository/auth_repository.dart';
import 'package:music_player/views/widgets/global_dialog.dart';
import 'package:music_player/views/widgets/loading_overlay.dart';

class LoginViewModel extends ChangeNotifier {
  final _authRepository = AuthRepository();
  Future doLogin(String userName, String password, BuildContext context) async {
    LoadingOverlay.of(context).show();
    if (userName.isEmpty) {
      GlobalDialog.showAlertDialog("Please fill UserName");
    } else if (password.isEmpty) {
      GlobalDialog.showAlertDialog("Please fill the Password");
    } else {
      await _authRepository.doLogin();
    }
    LoadingOverlay.of(context).hide();
  }
}
