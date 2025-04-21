import 'package:flutter/material.dart';

import '../../data.dart';
import '../../models/recipe_model.dart';
import '../../utilis/color.dart';

class TimeRecipe extends StatelessWidget {
  final Recipe recipe;
  const TimeRecipe({super.key,required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.access_time_outlined, color: AuthColorButton, size: 31),
          const SizedBox(width: 5),
          Text(
            '${recipe.duration} ',
            style: TextStyle(
              fontFamily: 'SansitaOne',
              fontSize: 18,
              color: AuthColorButton,
            ),
          ),
        ],
      ),
    );
  }
}

