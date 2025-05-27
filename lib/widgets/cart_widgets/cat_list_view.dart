import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/recipe_model.dart'; // تأكد انه يحتوي على Ingredient class
import 'cart_item.dart';

class CatListView extends StatefulWidget {
  final Function(double)? onSubtotalChanged;

  const CatListView({Key? key, this.onSubtotalChanged}) : super(key: key);

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

      // حساب المجموع وإرساله
      _calculateSubtotal();
    }
  }

  Future<void> saveShoppingList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonList = shoppingList.map((ing) => json.encode(ing.toJson())).toList();
    await prefs.setStringList('shopping_list', jsonList);
  }

  Future<void> deleteIngredient(int index) async {
    setState(() {
      shoppingList.removeAt(index);
    });
    await saveShoppingList();
    _calculateSubtotal();
  }

  // يتم استدعاؤها عند تحديث الكمية من CartItem
  void updateIngredientQuantity(int index, int newQuantity) {
    setState(() {
      shoppingList[index].quantity = newQuantity.toString();
    });
    saveShoppingList();
    _calculateSubtotal();
  }

  void _calculateSubtotal() {
    double subtotal = 0;
    for (var ingredient in shoppingList) {
      double unitPrice = double.tryParse(
        ingredient.price?.replaceAll(RegExp(r'[^\d.]'), '') ?? '0',
      ) ??
          0;
      int quantity = int.tryParse(ingredient.quantity ?? '1') ?? 1;
      subtotal += unitPrice * quantity;
    }

    // إبلاغ الـ parent عن التغير
    if (widget.onSubtotalChanged != null) {
      widget.onSubtotalChanged!(subtotal);
    }
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
          loadShoppingList: loadShoppingList,
          onQuantityChanged: (newQuantity) {
            updateIngredientQuantity(index, newQuantity);
          },
          onDelete: () {
            deleteIngredient(index);
          },
        );
      },
    );
  }}