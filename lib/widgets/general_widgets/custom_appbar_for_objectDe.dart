import 'dart:ffi';

import 'package:flutter/material.dart';
import '../../screens/home_screen.dart';
import '../../utilis/assets.dart';
import '../../utilis/color.dart';

class CustomAppbarForObjectde extends StatelessWidget {
  final Function() onPressed;
  const CustomAppbarForObjectde({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios, color: newColor),
          onPressed:onPressed
        ),
        Image.asset(
          AppImages.camCook,
          width: 150,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
