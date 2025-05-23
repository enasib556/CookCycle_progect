import 'package:flutter/material.dart';
import 'package:university_graduate_project/utilis/color.dart';

class RecipeImageWidget extends StatelessWidget {
  const RecipeImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 383,
      width: 373,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              'assets/images/bacon-with-boiled-egg--e1629740588775.png',
              height: 383,
              width: 373,
              fit: BoxFit.cover,
            ),
          ),
          // الزر داخل حدود الصورة فعليًا
          Positioned(
            bottom: 30,
            right: 30,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.play_arrow,
                color: AuthColorButton,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
