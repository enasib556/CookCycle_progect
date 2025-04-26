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
  List<Ingredients> shoppingList = [];

  @override
  void initState() {
    super.initState();
    loadShoppingList();
  }

  Future<void> loadShoppingList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? selectedJsonList = prefs.getStringList('shopping_list');

    if (selectedJsonList != null) {
      List<Ingredients> loadedList = selectedJsonList.map((jsonString) {
        return Ingredients.fromJson(json.decode(jsonString));
      }).toList();

      setState(() {
        shoppingList = loadedList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (shoppingList.isEmpty) {
      return const Center(child: Text('لا يوجد مكونات مضافة بعد'));
    }

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: shoppingList.length,
      itemBuilder: (context, index) {
        return CartItem(
          ingredient: shoppingList[index],
        );
      },
    );
  }
}
