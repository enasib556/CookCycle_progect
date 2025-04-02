import 'package:flutter/material.dart';

import '../../utilis/color.dart';
import 'custom_elevaterd_button.dart';
import 'ingredients_list.dart';

class LabelIngredientButton extends StatelessWidget {
  const LabelIngredientButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Main Ingredients for Classic Caesar Chicken',
          style: TextStyle(
            fontFamily: 'SansitaOne',
            fontSize: 23,
            color: primaryColor,
          ),
        ),
        IngredientsList(),
        const SizedBox(height: 10),
        CustomElevaterdButton(text: 'Add TO Shopping List',icon:Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
          size: 30,
        ),),
        const SizedBox(height: 30),
      ],
    );
  }
}
