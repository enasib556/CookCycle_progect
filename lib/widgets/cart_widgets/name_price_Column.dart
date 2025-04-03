import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data.dart';
import '../../models/recipeModel.dart';
import '../../utilis/color.dart';
import '../home_widgets/recipe_word.dart';
import 'custom_container.dart';

class NamePriceColumn extends StatelessWidget {
  final IngredientModel recipe ;
  double sumPrice = 0;
   NamePriceColumn({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Recipeword(
              text: recipe.name,
              fontSize: 17,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Price: \$${recipe.price}',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black.withOpacity(0.36),
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
          Row(
            children: [
              CustomContainer(
                width: 35,
                height: 35,
                child: Icon(
                  Icons.favorite,
                  size: 24,
                  color: colorIconCart,
                ),
              ),
              SizedBox(width: 20),
              CustomContainer(
                width: 35,
                height: 35,
                child: SvgPicture.asset(
                  'assets/icons/delete.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

