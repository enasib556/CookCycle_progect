// ingredients_widget.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EquipmentsWidget extends StatelessWidget {
  final List<String> equipments ;
  const EquipmentsWidget({super.key,required this.equipments});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0,horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // العنوان
          Row(
            children: [
              Icon(Icons.restaurant_menu, color: Colors.orange,size: 30,),
              SizedBox(width: 8),
              Text(
                'Equipments Needed',
                style: GoogleFonts.roboto(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E715B),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // قائمة المكونات
          ...equipments.map(
                (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
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
