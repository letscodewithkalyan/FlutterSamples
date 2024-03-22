import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:music_player/viewmodels/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var _userNameController = TextEditingController();
  var _passwordController = TextEditingController();
  LoginViewModel viewModel = LoginViewModel();

  TextStyle linkStyle = const TextStyle(color: Colors.blue, fontSize: 16.0);
  TextStyle defaultStyle = const TextStyle(color: Colors.grey, fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 30),
        child: Column(
          children: [
            Text("Login"),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _userNameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        hintText: "Enter Email"),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        hintText: "Enter Password"),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.doLogin(_userNameController.text,
                            _passwordController.text, context);
                      },
                      child: Text("Login")),
                ],
              ),
            ),
            RichText(
              text: TextSpan(style: defaultStyle, children: [
                TextSpan(text: "If not registered"),
                TextSpan(
                    text: " Please Register",
                    style: linkStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, "/register");
                      })
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
