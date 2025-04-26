import 'package:flutter/material.dart';
import 'package:university_graduate_project/widgets/details_widget/steps_list.dart';
import 'package:university_graduate_project/widgets/details_widget/time_recipe.dart';
import '../../models/recipe_model.dart';
import '../../utilis/color.dart';
import 'descriptin_box.dart';
import 'header.dart';
import 'label_ingredient_button.dart';

class DetailsBody extends StatelessWidget {
  final Recipe recipe;
  const DetailsBody({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Header(recipe: recipe,),
          SizedBox(height: 10,),
          TimeRecipe(recipe: recipe,),
          DescriptinBox(recipe: recipe,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                LabelIngredientButton(recipe: recipe,),
                Text(
                  'Steps to Prepare ${recipe.name}',
                  style: TextStyle(
                    fontFamily: 'SansitaOne',
                    fontSize: 23,
                    color: AuthColorButton,
                  ),
                ),
                const SizedBox(height: 10),
                StepsList(recipe: recipe,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
