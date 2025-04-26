import 'package:flutter/material.dart';

import '../../data.dart';
import '../../models/recipe_model.dart';
import '../../utilis/color.dart';

class DescriptinBox extends StatelessWidget {
  final Recipe recipe;
  const DescriptinBox({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          width: 317,
          height: 62,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: primaryColor)),
          child: Center(
            child: Text(
              recipe.smallDisc!,
              style: TextStyle(
                fontSize: 22,
                color: Color(0xFF6E7370).withOpacity(0.7),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
