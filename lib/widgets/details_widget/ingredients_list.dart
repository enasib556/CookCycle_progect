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
  late List<Ingredients> ingredients;

  @override
  void initState() {
    super.initState();
    ingredients = widget.recipe.ingredients ?? [];

    // تأكيد أن الأطوال متطابقة لتفادي المشاكل
    assert(
    ingredients.length == widget.selectedIngredients.length,
    '❌ ingredients.length لا يساوي selectedIngredients.length',
    );
  }

  // حفظ المكونات المحددة في SharedPreferences
  void saveSelectedIngredients() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Ingredients> selected = ingredients.where((i) => i.isSelected).toList();
    List<String> selectedJsonList = selected.map((i) => jsonEncode(i.toJson())).toList();
    await prefs.setStringList('selected_ingredients', selectedJsonList);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ingredients saved successfully!')),
    );
  }

  // تبديل اختيار المكون
  void toggleSelection(int index) {
    setState(() {
      ingredients[index].isSelected = !ingredients[index].isSelected;
      widget.onSelectionChanged(index, ingredients[index].isSelected);

      // تحقق من أن index داخل النطاق
      if (index < widget.selectedIngredients.length) {
        widget.selectedIngredients[index] = ingredients[index].isSelected;
      } else {
        debugPrint(
          "⚠️ index $index خارج حدود selectedIngredients (${widget.selectedIngredients.length})",
        );
      }
    });
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
