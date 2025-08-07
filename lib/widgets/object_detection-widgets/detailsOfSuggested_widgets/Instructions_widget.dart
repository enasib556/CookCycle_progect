import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/detect_model.dart';

class InstructionsWidget extends StatelessWidget {
  final List<StepsDetect> Instructions ;
  const InstructionsWidget({super.key, required this.Instructions});

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
              Icon(Icons.lightbulb_outline_rounded, color: Colors.orange,size: 30,),
              SizedBox(width: 8),
              Text(
                'Instructions',
                style: GoogleFonts.roboto(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E715B),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // قائمة المعدات مع أرقام بدلاً من الدائرة
          ...Instructions.asMap().entries.map(
                (entry) {
              int index = entry.key;
              String item = entry.value.instructions!;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
