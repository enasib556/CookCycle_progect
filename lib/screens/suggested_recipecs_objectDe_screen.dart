import 'package:flutter/material.dart';

import '../widgets/object_detection-widgets/suggested_recipe_widgets/suggested_recipe_body.dart';

class SuggestedRecipecsObjectdeScreen extends StatelessWidget {
  final String imagePath;
  const SuggestedRecipecsObjectdeScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SuggestedRecipeBody(imagePath: imagePath,),
    );
  }
}
