import 'package:flutter/material.dart';
import 'package:university_graduate_project/utilis/color.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeName extends StatelessWidget {
  final String name;
  const RecipeName ({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: GoogleFonts.roboto(
        color: AuthColorButton,
        fontSize: 24,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
