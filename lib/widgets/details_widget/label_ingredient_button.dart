import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/recipe_model.dart';
import '../../utilis/color.dart';
import 'custom_elevaterd_button.dart';
import 'ingredients_list.dart';

class LabelIngredientButton extends StatefulWidget {
  final Recipe recipe;
  const LabelIngredientButton({super.key, required this.recipe});

  @override
  _LabelIngredientButtonState createState() => _LabelIngredientButtonState();
}

class _LabelIngredientButtonState extends State<LabelIngredientButton> {
  List<bool>? selectedIngredients;

  @override
  void initState() {
    super.initState();
    loadSelectedIngredients();
  }

  Future<void> loadSelectedIngredients() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final ingredients = widget.recipe.ingredients ?? [];

    List<bool> loadedList = List.generate(
      ingredients.length,
          (index) => prefs.getBool('ingredient_${ingredients[index].ingredientId}') ?? false,
    );

    setState(() {
      selectedIngredients = loadedList;
    });
  }

  void updateSelectedIngredients(int index, bool isSelected) async {
    if (selectedIngredients == null || index >= selectedIngredients!.length) return;
    setState(() {
      selectedIngredients![index] = isSelected;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final ingredientId = widget.recipe.ingredients?[index].ingredientId;
    if (ingredientId != null) {
      prefs.setBool('ingredient_$ingredientId', isSelected);
    }
  }

  Future<void> saveSelectedToShoppingList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final ingredients = widget.recipe.ingredients ?? [];

    List<String> existingList = prefs.getStringList('shopping_list') ?? [];

    // Decode the existing list
    List<Ingredient> allIngredients = existingList.map((e) => Ingredient.fromJson(jsonDecode(e))).toList();

    // حذف المكونات اللي لها نفس recipeId + ingredientId (لضمان ما فيش تكرار)
    for (var ing in ingredients) {
      allIngredients.removeWhere((i) =>
      i.recipeId == widget.recipe.recipeId && i.ingredientId == ing.ingredientId);
    }

    // إضافة المكونات المختارة
    for (int i = 0; i < ingredients.length; i++) {
      if (selectedIngredients![i]) {
        Ingredient ing = ingredients[i];
        ing.recipeId = widget.recipe.recipeId;
        allIngredients.add(ing);
      }
    }
    // حفظ القائمة مرة تانية
    List<String> updatedList = allIngredients.map((i) => jsonEncode(i.toJson())).toList();
    await prefs.setStringList('shopping_list', updatedList);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ingredients added to cart!')),
    );
  }


  @override
  Widget build(BuildContext context) {
    if (selectedIngredients == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final selectedCount = {...selectedIngredients!.asMap().entries.where((e) => e.value).map((e) => e.key)}.length-1;

    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Main Ingredients for ${widget.recipe.name}',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              color: AuthColorButton,
            ),
          ),
          IngredientsList(
            recipe: widget.recipe,
            onSelectionChanged: updateSelectedIngredients,
            selectedIngredients: selectedIngredients!,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 66,
            child: CustomElevatedButton(
              text: 'Add To Shopping List',
              onPress: () {
                if (selectedCount == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please, choose ingredients first!')),
                  );
                } else {
                  saveSelectedToShoppingList();
                }
              },
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  if (selectedCount > 0)
                    Positioned(
                      right: 0,
                      top: -10,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF8844A),
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        child: Center(
                          child: Text(
                            '$selectedCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
