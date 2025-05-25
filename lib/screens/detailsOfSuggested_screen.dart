import 'package:flutter/material.dart';
import 'package:university_graduate_project/models/detect_model.dart';

import '../utilis/color.dart';

import '../widgets/object_detection-widgets/detailsOfSuggested_widgets/DetailsOfSuggestedBody.dart';
import '../widgets/general_widgets/custom_appbar_for_objectDe.dart';


class DetailsOfSuggestedScreen extends StatelessWidget {
  final RecipesDetect recipe;
  const DetailsOfSuggestedScreen({super.key,required this.recipe,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsOfSuggestedBody(),);
  }
}
