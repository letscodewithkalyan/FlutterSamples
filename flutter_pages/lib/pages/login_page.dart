import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle linkStyle = const TextStyle(color: Colors.blue);
  TextStyle defaultStyle = const TextStyle(color: Colors.grey, fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
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
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "UserName"),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
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
                        onPressed: () {},
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
