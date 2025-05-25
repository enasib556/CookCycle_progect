import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/recipe_model.dart';
import '../../utilis/color.dart';

class TimeRecipe extends StatelessWidget {
  final Recipe recipe;
  const TimeRecipe({super.key,required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.access_time_outlined, color: AuthColorButton, size: 31),
          const SizedBox(width: 5),
          Text(
            '${recipe.duration} ',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              color: AuthColorButton,
            ),
          ),
        ],
      ),
    );
  }
}
