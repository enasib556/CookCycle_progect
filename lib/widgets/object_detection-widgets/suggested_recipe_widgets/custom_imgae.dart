import 'dart:io';

import 'package:flutter/material.dart';

class CustomImgae extends StatelessWidget {
  final String imagePath;
  const CustomImgae({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.file(
            File(imagePath),
            width: 364,
            height: 320,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 25,),
        Container(width: 264,height: 6
          ,decoration: BoxDecoration(
            color: Color(0xffFB9E6A),
            borderRadius: BorderRadius.circular(6),
          ) ,)
      ],
    );
  }
}
