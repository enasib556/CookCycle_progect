import 'package:flutter/material.dart';
import 'package:university_graduate_project/widgets/details_widget/gradient_item.dart';

import '../../data.dart';
import '../../models/recipe_model.dart';

class IngredientsList extends StatefulWidget {
  final Recipe recipe;
  const IngredientsList({super.key,required this.recipe});

  @override
  State<IngredientsList> createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.recipe.ingredients!.length,
        itemBuilder: (context, index) {
          return  GradientItem(ingredients: widget.recipe.ingredients![index],);
        });
  }
}

