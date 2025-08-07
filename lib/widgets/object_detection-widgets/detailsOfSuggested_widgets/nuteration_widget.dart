// ingredients_widget.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/detect_model.dart';
import 'nutrition_item.dart';

class NutritionalWidget extends StatelessWidget {
  final NutritionDetect nutrition;
  const NutritionalWidget({super.key, required this.nutrition});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0,horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.list_alt_rounded, color: Colors.orange,size: 30,),
              SizedBox(width: 8),
              Text(
                'Nutritional',
                style: GoogleFonts.roboto(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E715B),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          NutritionItem(nutrition: "Calories : ${nutrition.calories} kcal",),
          NutritionItem(nutrition: "Protein : ${nutrition.protein} ",),
          NutritionItem(nutrition: "Carbs : ${nutrition.carbs} ",),
          NutritionItem(nutrition: "Fat : ${nutrition.fat}",),
        ],
      ),
    );
  }
}
