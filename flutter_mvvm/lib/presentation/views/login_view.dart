import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm/presentation/viewmodels/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<LoginViewmodel>(context);
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 10,
          children: [
            TextField(
              onChanged: (value) => vm.userName = value,
              decoration: InputDecoration(
                labelText: "UserName",
                border: OutlineInputBorder(),
              ),
            ),
            Focus(
              onFocusChange: (value) {
                if (!value) {
                  vm.checkPasswordValidation();
                }
              },
              child: TextField(
                obscureText: true,
                onChanged: (value) => vm.password = value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  error: Text(vm.passwordError ?? ""),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
