import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_graduate_project/utilis/color.dart';

class DesciptionText extends StatelessWidget {
  const DesciptionText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          Text(
            'Powered by AI',
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: newColor.withOpacity(0.63),
            ),
          ),
          Text(
            'Smart Cooking Starts Here!',
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: newColor.withOpacity(0.63),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
