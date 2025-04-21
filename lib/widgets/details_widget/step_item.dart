import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:university_graduate_project/models/recipe_model.dart';

class StepItem extends StatelessWidget {
  final Steps step;
  final int index;
  final int totalSteps;
  const StepItem({super.key, required this.index, required this.step, required this.totalSteps});

  @override
  Widget build(BuildContext context) {
    bool isOdd = index.isOdd; // لو فردي يكون true

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        color: Color(0xFFA8BBB3).withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection:
            isOdd ? TextDirection.rtl : TextDirection.ltr, // تبديل الاتجاه
            children: [
              ClipOval(
                child: Image.network(
                  step.imageUrl!,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/chef.svg'),
                      const SizedBox(width: 10),
                      Text(
                        'Step ${step.stepNumber}/$totalSteps',
                        style: TextStyle(
                          fontFamily: 'SansitaOne',
                          fontSize: 17,
                          color: Color(0xFFA8BBB3),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 155,
                    child: Text(
                      step.instructions!,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
