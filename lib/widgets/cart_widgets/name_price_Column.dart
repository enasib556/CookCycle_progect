import 'package:flutter/material.dart';

import '../../models/recipe_model.dart';

class NamePriceColumn extends StatelessWidget {
  final Ingredient ingredient;

  const NamePriceColumn({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ingredient.name ?? '',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ingredient.quantity ?? '',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}