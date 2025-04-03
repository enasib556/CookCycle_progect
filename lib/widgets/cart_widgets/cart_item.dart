import 'package:flutter/material.dart';
import 'package:university_graduate_project/widgets/cart_widgets/quanitity_counter.dart';
import '../../models/recipeModel.dart';
import 'name_price_Column.dart';

class CartItem extends StatelessWidget {
  final IngredientModel recipe ;
  const CartItem({super.key,required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 135,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  recipe.image!,
                  width: 98,
                  height: 113,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            NamePriceColumn(recipe: recipe,),
            QuanitityCounter(),
            SizedBox(width: 17),

          ],
        ),
      ),
    );
  }
}