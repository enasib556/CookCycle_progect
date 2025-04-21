import 'package:flutter/material.dart';
import 'package:university_graduate_project/screens/home_screen.dart';

import '../../utilis/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // التعامل مع onTap هنا
      child: Container(
        width: 180,
        height: 50,
        decoration: BoxDecoration(
          color: AuthColorButton,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'SansitaOne',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
