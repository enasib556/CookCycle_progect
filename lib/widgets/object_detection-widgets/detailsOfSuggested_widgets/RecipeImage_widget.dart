import 'package:flutter/material.dart';
import 'package:university_graduate_project/utilis/color.dart';

class RecipeImageWidget extends StatelessWidget {
  const RecipeImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      width: 373,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/images/bacon-with-boiled-egg--e1629740588775.png',
          height: 383,
          width: 373,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
