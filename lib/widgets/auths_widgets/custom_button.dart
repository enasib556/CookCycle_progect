import 'package:flutter/material.dart';
import 'package:university_graduate_project/screens/home_screen.dart';

import '../../utilis/color.dart';

class customButton extends StatelessWidget {
  const customButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
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
