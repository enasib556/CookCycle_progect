import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/recipe_model.dart';
import 'gradient_item.dart';

class IngredientsList extends StatefulWidget {
  final Recipe recipe;
  final Function(int, bool) onSelectionChanged;
  final List<bool> selectedIngredients;

  const IngredientsList({
    super.key,
    required this.recipe,
    required this.onSelectionChanged,
    required this.selectedIngredients,
  });

  @override
  State<IngredientsList> createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  late List<Ingredient> ingredients;

  @override
  void initState() {
    super.initState();
    ingredients = widget.recipe.ingredients ?? [];
    assert(
    ingredients.length == widget.selectedIngredients.length,
    '❌ ingredients.length لا يساوي selectedIngredients.length',
    );
  }

  void toggleSelection(int index) async {
    setState(() {
      ingredients[index].isSelected = !ingredients[index].isSelected;
      widget.onSelectionChanged(index, ingredients[index].isSelected);

      if (index < widget.selectedIngredients.length) {
        widget.selectedIngredients[index] = ingredients[index].isSelected;
      }
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final ingredientId = widget.recipe.ingredients?[index].ingredientId;
    if (ingredientId != null) {
      prefs.setBool('ingredient_$ingredientId', ingredients[index].isSelected);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: ingredients.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => toggleSelection(index),
              child: GradientItem(
                index: index,
                ingredients: ingredients[index],
                onSelectionChanged: widget.onSelectionChanged,
              ),
            );
          },
        ),
      ],
    );
  }
}
