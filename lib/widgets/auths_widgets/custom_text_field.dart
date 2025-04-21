import 'package:flutter/material.dart';
import '../../utilis/color.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: darkGreen, // اللون الرمادي
            fontSize: 16,
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          validator: validator ?? (input) {
            if (input?.isEmpty ?? true) {
              return '$label must not be empty';
            }
            return null;
          },
          obscureText: isPassword,
          onChanged: (value) {
            print('$label: $value'); // 👈 يطبع القيمة وقت ما المستخدم يكتب
          },
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Color(0xff6E7370).withOpacity(0.81)),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: Color(0xff6E7370)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: Color(0xffBEC0BF)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: Color(0xffA8BBB3), width: 2),
            ),
            suffixIcon: isPassword
                ? Icon(Icons.visibility_off, color: Color(0xffBEC0BF))
                : null,
          ),
        ),
      ],
    );
  }
}
