import 'package:flutter/material.dart';
import 'package:flutter_pages/entities/user_entity.dart';
import 'package:flutter_pages/providers/auth_provider.dart';
import 'package:flutter_pages/widgets/loading_overlay.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle linkStyle = const TextStyle(color: Colors.blue);
  TextStyle defaultStyle = const TextStyle(color: Colors.grey, fontSize: 20.0);
  String? _username, _password;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);
    doLogin() {
      LoadingOverlayWidget.of(context).show();
      final Future<Map<String, dynamic>> successfulMessage =
          auth.login(_username ?? "", _password ?? "");

      successfulMessage.then((response) {
        LoadingOverlayWidget.of(context).hide();
        if (response['status']) {
          UserEntity user = response['user'];
          Navigator.pushReplacementNamed(context, '/dashboard');
        } else {
          var snackBar = SnackBar(content: Text("Failed Login"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pushReplacementNamed(context, '/dashboard');
        }
      });
    }

    var loading = const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Authenticating ... Please wait")
      ],
    );

    return Scaffold(
      body: Column(children: [
        Expanded(
            flex: 2,
            child: Container(
              color: Colors.blueAccent,
            )),
        Expanded(
            flex: 3,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Welcome to Flutter",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                    const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Create screens with ease",
                          style: TextStyle(fontSize: 18),
                        )),
                    TextFormField(
                      onSaved: (newValue) => _username = newValue,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "UserName"),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      onSaved: (value) => _password = value,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Password"),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {}, child: Text("Forgot Password?")),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size.fromHeight(
                              50), // fromHeight use double.infinity as width and 40 is the height
                        ),
                        onPressed: () {
                          doLogin();
                        },
                        child: const Text("Login",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18))),
                    const SizedBox(height: 10),
                    Align(
                        alignment: Alignment.topRight,
                        child: RichText(
                            text: TextSpan(style: defaultStyle, children: [
                          const TextSpan(text: "New to flutter?"),
                          TextSpan(text: "Signup", style: linkStyle)
                        ])))
                  ],
                )))
      ]),
    );
  }
}
