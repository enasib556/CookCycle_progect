import 'package:flutter/material.dart';
import 'package:university_graduate_project/widgets/object_detection-widgets/suggested_recipe_widgets/suggested_card.dart';

class SuggestedList extends StatelessWidget {
  const SuggestedList({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return  Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SuggestedCard(
            index: index,
          ),
        );
      },
    );
  }
}
