import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginViewTwo extends StatefulWidget {
  const LoginViewTwo({super.key});

  @override
  State<LoginViewTwo> createState() => _LoginViewTwoState();
}

class _LoginViewTwoState extends State<LoginViewTwo> {
  String? _userName, _password;
  bool isVisiblePassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(children: [
          Text(AppLocalizations.of(context)!.login),
          const Spacer(),
          TextField(
            onChanged: (value) {
              _userName = value;
            },
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: AppLocalizations.of(context)!.email,
                hintText: AppLocalizations.of(context)!.enter_email),
          ),
          const SizedBox(
            height: 10,
          ),
          //Password Field
          TextField(
            onChanged: (value) {
              _password = value;
            },
            obscureText: isVisiblePassword,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: AppLocalizations.of(context)!.password,
              hintText: AppLocalizations.of(context)!.enter_password,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isVisiblePassword = !isVisiblePassword;
                  });
                },
                icon: Icon(isVisiblePassword
                    ? Icons.visibility
                    : Icons.visibility_off),
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/home");
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
            ),
            child: Text(AppLocalizations.of(context)!.login),
          ),
          const Spacer(),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                style: const TextStyle(color: Colors.grey, fontSize: 16.0),
                children: [
                  TextSpan(text: AppLocalizations.of(context)!.not_registered),
                  const TextSpan(text: "  "),
                  TextSpan(
                      text: AppLocalizations.of(context)!.please_register,
                      style:
                          const TextStyle(color: Colors.blue, fontSize: 16.0)),
                ]),
          )
        ]),
      ),
    );
  }
}
