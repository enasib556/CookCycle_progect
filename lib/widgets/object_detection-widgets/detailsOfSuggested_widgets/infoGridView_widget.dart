import 'package:flutter/material.dart';
import '../../../models/detect_model.dart';
import 'infoBox_widget.dart';

class RecipeInfoGridWidget extends StatelessWidget {
  final RecipesDetect recipe;
  const RecipeInfoGridWidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        mainAxisSpacing: 18,
        crossAxisSpacing: 30,
        childAspectRatio: 1.3,
        children:  [
          InfoBoxWidget(
            icon: Icons.schedule,
            label: "Prep Time",
            value: "${recipe.prepTime}",
          ),
          InfoBoxWidget(
            icon: Icons.timer,
            label: "Cook Time",
            value: "${recipe.cookTime}",
          ),
          InfoBoxWidget(
            icon: Icons.group,
            label: "Servings",
            value: "${recipe.servings}",
          ),
          InfoBoxWidget(
            icon: Icons.restaurant_menu,
            label: "Difficulty",
            value: "${recipe.difficulty}",
          ),
        ],
      ),
    );
  }
}
