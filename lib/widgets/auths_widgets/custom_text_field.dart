import 'package:flutter/material.dart';

Widget customTextField({
  required String label,
  required String hint,
  bool isPassword = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xffA8BBB3), // اللون الرمادي
          fontSize: 15,
        ),
      ),
      SizedBox(height: 5),
      TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Color(0xffA8BBB3)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
              vertical: 14, horizontal: 16), // تحسين التباعد
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Color(0xffA8BBB3)), // اللون الرمادي
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
                color: Color(0xffA8BBB3)), // اللون الرمادي عند عدم التركيز
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
                color: Color(0xffA8BBB3),
                width: 2), // اللون الرمادي عند التركيز
          ),
          suffixIcon: isPassword
              ? Icon(Icons.visibility_off, color: Color(0xffA8BBB3))
              : null,
        ),
      ),
    ],
  );
}