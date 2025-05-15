import 'dart:convert';
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

    // إذا لم تكن هناك بيانات مخزنة، نقوم بتعيين كل العناصر كـ false
    List<bool> loadedList = List.generate(
      ingredients.length,
          (index) => prefs.getBool('ingredient_${ingredients[index].ingredientId}') ?? false,
    );

    // تعيين القيمة بعد تحميل البيانات من SharedPreferences
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

    // Remove ingredients with same recipeId to avoid duplicates
    allIngredients.removeWhere((i) => i.recipeId == widget.recipe.recipeId);

    // Add new selected ingredients
    for (int i = 0; i < ingredients.length; i++) {
      if (selectedIngredients![i]) {
        Ingredient ing = ingredients[i];
        ing.recipeId = widget.recipe.recipeId;
        allIngredients.add(ing);
      }
    }

    // Convert back to JSON and save
    List<String> updatedList = allIngredients.map((i) => jsonEncode(i.toJson())).toList();
    await prefs.setStringList('shopping_list', updatedList);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ingredients added to cart!')),
    );

    // بعد إضافة المكونات إلى السلة، نرجع للقائمة الرئيسية مع التحديث
     // هنا نرسل النتيجة
  }


  @override
  Widget build(BuildContext context) {
    if (selectedIngredients == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // حساب عدد العناصر المختارة
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
              text: 'Add To Shopping List ${selectedCount > 0 ? '($selectedCount)' : ''}',  // عرض عدد العناصر المختارة
              onPress: () {
                if (selectedCount == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please, choose ingredients first!')),
                  );
                } else {
                  saveSelectedToShoppingList();
                }
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