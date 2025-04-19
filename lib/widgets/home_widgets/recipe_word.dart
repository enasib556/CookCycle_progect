import 'package:flutter/material.dart';
import 'package:university_graduate_project/utilis/color.dart';

class Recipeword extends StatelessWidget {
  final String text;
  final double fontSize;
  const Recipeword({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'SansitaOne',
            fontWeight: FontWeight.w500,
            fontSize: fontSize,
            foreground:
                Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth =
                      2.5 // حجم الاستروك
                  ..color = colorTextHome, // لون الحدود الخارجية
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'SansitaOne',
            fontWeight: FontWeight.w500,
            fontSize: fontSize,
            color: Colors.white, // اللون الداخلي
          ),
        ),
      ],
    );
  }
}

