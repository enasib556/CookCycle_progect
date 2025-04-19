import 'package:flutter/material.dart';
import 'package:university_graduate_project/models/recipe_model.dart';

import '../../data.dart';
import '../../utilis/color.dart';
import '../home_widgets/recipe_word.dart';

class Header extends StatelessWidget {
  final Recipe recipe;
  const Header({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(recipe.imageUrl!, width: double.infinity, height: 459, fit: BoxFit.cover),
        Positioned(
          top: 50, // Adjust the top position as per your requirement
          left: 10, // Adjust the left position as per your requirement
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: primaryColor),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 12,
          child: Recipeword(text: recipes[0].name, fontSize: 26),
        ),
      ],
    );
  }
}
