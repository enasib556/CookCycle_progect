import 'package:flutter/material.dart';

class NutritionItem extends StatelessWidget {
  final String nutrition;
  const NutritionItem({super.key, required this.nutrition});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(Icons.info_rounded, color: Colors.orange.shade300, size: 10),
          SizedBox(width: 8),
          Flexible(
            child: Text(
              nutrition
              ,style: TextStyle(
              fontSize: 16,
              color: Color(0xFF3E3E3E),
            ),
            ),
          ),
        ],
      ),
    );
  }
}
