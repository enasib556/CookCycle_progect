import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        key: ValueKey('signup'),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customTextField(
              label: "Email or Username", hint: "enter your email..."),
          SizedBox(height: 10),
          customTextField(
              label: "Password",
              hint: "enter your password...",
              isPassword: true),
          SizedBox(height: 10),
          customTextField(
              label: "Confirm Password",
              hint: "enter your password...",
              isPassword: true),
          SizedBox(height: 20),
          Center(
            child: customButton(text: "Sign up"),
          ),
        ],
      ),
    );
  }
}