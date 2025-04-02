import 'package:flutter/material.dart';
import 'package:university_graduate_project/screens/home_screen.dart';

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
        width: 150,
        height: 45,
        decoration: BoxDecoration(
          color: Color(0xffA8BBB3),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}