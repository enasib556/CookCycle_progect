import 'dart:io';

import 'package:flutter/material.dart';

class RecipeImageWidget extends StatelessWidget {
  final String imagePath;
  const RecipeImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      width: 373,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child:Image.file(
          File(imagePath),
          width: 364,
          height: 320,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
