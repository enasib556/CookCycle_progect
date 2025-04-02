import 'package:flutter/material.dart';
import 'package:university_graduate_project/widgets/details_widget/step_item.dart';
import '../../data.dart';

class StepsList extends StatelessWidget {
  const StepsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: recipes[0].steps!.length,
      itemBuilder: (context, index) {
        return StepItem(index: index);
      },
    );
  }
}
