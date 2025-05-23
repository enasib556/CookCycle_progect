import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_graduate_project/widgets/object_detection-widgets/detailsOfSuggested_widgets/static_data.dart';

class InstructionsWidget extends StatelessWidget {
  const InstructionsWidget({super.key});

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
              Icon(Icons.lightbulb_outline_rounded, color: Colors.orange,size: 35,),
              SizedBox(width: 8),
              Text(
                'Instructions',
                style: GoogleFonts.roboto(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E715B),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // قائمة المعدات مع أرقام بدلاً من الدائرة
          ...staticInstructions.asMap().entries.map(
                (entry) {
              int index = entry.key;
              String item = entry.value;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Text(
                      '${index + 1}.', // الرقم يبدأ من 1 مع نقطة
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange.shade300,
                      ),
                    ),
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
              );
            },
          ).toList(),

        ],
      ),
    );
  }
}
