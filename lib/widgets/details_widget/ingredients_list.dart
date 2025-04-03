import 'package:flutter/material.dart';
import 'package:university_graduate_project/widgets/details_widget/gradient_item.dart';

import '../../data.dart';

class IngredientsList extends StatefulWidget {
  const IngredientsList({super.key});

  @override
  State<IngredientsList> createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: recipes[0].ingredients!.length,
        itemBuilder: (context, index) {
          return  GradientItem(name: recipes[0].ingredients![index].name, quantity: recipes[0].ingredients![index].quantity,);
        });
  }
}

