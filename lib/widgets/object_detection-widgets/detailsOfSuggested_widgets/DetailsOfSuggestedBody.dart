import 'package:flutter/material.dart';
import 'package:university_graduate_project/widgets/object_detection-widgets/detailsOfSuggested_widgets/recipeName.dart';
import '../../details_widget/custom_elevaterd_button.dart';
import '../../general_widgets/custom_appbar_for_objectDe.dart';
import 'Instructions_widget.dart';
import 'RecipeImage_widget.dart';
import 'equipment_widget.dart';
import 'infoGridView_widget.dart';
import 'ingrediant_widget.dart';
import 'nuteration_widget.dart';

class DetailsOfSuggestedBody extends StatelessWidget {
  const DetailsOfSuggestedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const SizedBox(height: 30),
          CustomAppbarForObjectde(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 15),
          // نضعهم داخل Center أو Column بمحاذاة center
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                RecipeName(),
                SizedBox(height: 10),
                RecipeImageWidget(),
                RecipeInfoGridWidget(),
                IngredientsWidget(),
                EquipmentsWidget(),
                InstructionsWidget(),
                NutritionalWidget(),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 250,  // العرض اللي تبيه أقل
                  child: CustomElevatedButton(
                    text: 'Close Recipe',
                    onPress: () {Navigator.pop(context);},
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
