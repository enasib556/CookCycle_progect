import 'package:flutter/material.dart';
import 'package:university_graduate_project/utilis/color.dart';
import 'package:university_graduate_project/widgets/details_widget/details_body.dart';

import '../models/recipe_model.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key,required this.recipe});
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,
      body: DetailsBody(recipe: recipe,)
    );
  }
}
