import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String labelText;
  const PasswordFormField({
    super.key,
    required this.textEditingController,
    required this.labelText,
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  var _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null && value == "") {
          return "Password cannot be empty";
        }
        return null;
      },
    );
  }
}
