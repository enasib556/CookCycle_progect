import 'package:flutter/material.dart';
import 'package:university_graduate_project/models/detect_model.dart';
import '../widgets/object_detection-widgets/detailsOfSuggested_widgets/DetailsOfSuggestedBody.dart';


class DetailsOfSuggestedScreen extends StatelessWidget {
  final RecipesDetect recipe;
  final String imagePath;

  const DetailsOfSuggestedScreen({super.key,required this.recipe, required this.imagePath,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsOfSuggestedBody(recipe: recipe,imagePath: imagePath,),);
  }
}
