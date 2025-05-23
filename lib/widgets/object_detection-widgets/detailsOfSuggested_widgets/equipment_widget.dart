// ingredients_widget.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_graduate_project/widgets/object_detection-widgets/detailsOfSuggested_widgets/static_data.dart';


class EquipmentsWidget extends StatelessWidget {
  const EquipmentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // العنوان
          Row(
            children: [
              Icon(Icons.restaurant_menu, color: Colors.orange,size: 35,),
              SizedBox(width: 8),
              Text(
                'Equipments Needed',
                style: GoogleFonts.roboto(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E715B),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // قائمة المكونات
          ...staticEquipments.map(
                (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Icon(Icons.circle, color: Colors.orange.shade300, size: 10),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF3E3E3E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
