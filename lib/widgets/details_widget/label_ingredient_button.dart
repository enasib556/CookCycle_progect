import 'package:flutter/material.dart';
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
          (index) =>
      prefs.getBool('ingredient_${ingredients[index].ingredientId}') ?? false,
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

  @override
  Widget build(BuildContext context) {
    if (selectedIngredients == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final selectedCount = selectedIngredients!.where((e) => e).length;

    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Main Ingredients for Classic Caesar Chicken',
            style: TextStyle(
              fontFamily: 'SansitaOne',
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
            width: MediaQuery.of(context).size.width * 0.8,
            height: 66,
            child: CustomElevatedButton(
              text: 'Add TO Shopping List ${selectedCount > 0 ? '($selectedCount)' : ''}',
              onPress: () {
                if (selectedIngredients!.length !=
                    (widget.recipe.ingredients?.length ?? 0)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('حدث خطأ في تزامن البيانات. برجاء المحاولة لاحقاً.'),
                    ),
                  );
                  return;
                }
                // هنا تضيف المكونات المحددة إلى القائمة
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
