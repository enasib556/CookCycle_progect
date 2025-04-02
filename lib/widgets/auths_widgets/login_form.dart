import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        key: ValueKey('login'),
        crossAxisAlignment: CrossAxisAlignment.center, // مركزية العناصر
        children: [
          customTextField(label: "Email", hint: "enter your email..."),
          SizedBox(height: 10),
          customTextField(
              label: "Password", hint: "enter your password...", isPassword: true),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text("Forgot Password?", style: TextStyle(color: Colors.grey)),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: customButton(text: "Log in"),
          ),
        ],
      ),
    );
  }
}