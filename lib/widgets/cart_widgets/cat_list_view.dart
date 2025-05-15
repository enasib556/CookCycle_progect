import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/recipe_model.dart'; // تأكد انه بيحتوي على Ingredients class
import 'cart_item.dart';

class CatListView extends StatefulWidget {
  const CatListView({super.key});

  @override
  State<CatListView> createState() => _CatListViewState();
}

class _CatListViewState extends State<CatListView> {
  List<Ingredient> shoppingList = [];

  @override
  void initState() {
    super.initState();
    loadShoppingList();
  }

  Future<void> loadShoppingList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? selectedJsonList = prefs.getStringList('shopping_list');

    if (selectedJsonList != null) {
      List<Ingredient> loadedList = selectedJsonList.map((jsonString) {
        return Ingredient.fromJson(json.decode(jsonString));
      }).toList();

      setState(() {
        shoppingList = loadedList;
      });
    }
  }

  Future<void> deleteIngredient(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? selectedJsonList = prefs.getStringList('shopping_list') ?? [];

    // حذف المكون من القائمة
    selectedJsonList.removeAt(index);

    // حفظ القائمة المحدثة في SharedPreferences
    await prefs.setStringList('shopping_list', selectedJsonList);

    // تحديث الواجهة بعد الحذف
    setState(() {
      shoppingList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (shoppingList.isEmpty) {
      return const Center(child: Text('No added ingredients yet'));
    }

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: shoppingList.length,
      itemBuilder: (context, index) {
        return CartItem(
          ingredient: shoppingList[index],
          loadShoppingList: loadShoppingList,  // تمرير الدالة هنا
           // إضافة حدث الحذف
        );
      },
    );
  }
}
