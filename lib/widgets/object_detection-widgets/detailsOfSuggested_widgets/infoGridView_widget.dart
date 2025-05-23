import 'package:flutter/material.dart';
import 'infoBox_widget.dart';

class RecipeInfoGridWidget extends StatelessWidget {
  const RecipeInfoGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      mainAxisSpacing: 18,
      crossAxisSpacing: 30,
      childAspectRatio: 1.3,
      children: const [
        InfoBoxWidget(
          icon: Icons.schedule,
          label: "Prep Time",
          value: "30m",
        ),
        InfoBoxWidget(
          icon: Icons.timer,
          label: "Cook Time",
          value: "45m",
        ),
        InfoBoxWidget(
          icon: Icons.group,
          label: "Servings",
          value: "4",
        ),
        InfoBoxWidget(
          icon: Icons.restaurant_menu,
          label: "Difficulty",
          value: "Medium",
        ),
      ],
    );
  }
}
