import 'package:flutter/material.dart';
import 'package:university_graduate_project/widgets/home_widgets/recipe_card.dart';

import '../../data.dart';

class GridViewRecipe extends StatelessWidget {
  const GridViewRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        itemCount: recipesList.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.58,
        ),
        itemBuilder: (context, index) {
          return RecipeCard(recipe: recipesList[index]);
        },
      ),
    );
  }
}

