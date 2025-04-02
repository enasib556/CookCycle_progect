import 'package:flutter/material.dart';

import '../../data.dart';
import '../../utilis/color.dart';

class TimeRecipe extends StatelessWidget {
  const TimeRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.access_time_outlined, color: primaryColor, size: 31),
          const SizedBox(width: 5),
          Text(
            recipes[0].cookingTime,
            style: TextStyle(
              fontFamily: 'SansitaOne',
              fontSize: 18,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
