import 'package:flutter/material.dart';
import 'package:university_graduate_project/models/recipe_model.dart';
import 'package:university_graduate_project/widgets/details_widget/step_item.dart';

class StepsList extends StatelessWidget {
  final Recipe recipe;
  const StepsList({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: recipe.steps!.length,
      itemBuilder: (context, index) {
        return StepItem(index: index, step: recipe.steps![index],totalSteps: recipe.steps!.length,);
      },
    );
  }
}
