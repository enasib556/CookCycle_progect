import 'package:flutter/material.dart';
import 'package:university_graduate_project/utilis/color.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeName extends StatelessWidget {
  const RecipeName ({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Apple & Walnut Salad",
      style: GoogleFonts.roboto(
        color: AuthColorButton,
        fontSize: 32,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
