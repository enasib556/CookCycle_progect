import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utilis/color.dart';

class CustomRowForTotal extends StatelessWidget {
  final String text;
  final double price;
  const CustomRowForTotal({super.key, required this.text, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            text,
            style: GoogleFonts.sansita(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: colorIconCart,
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text(
            '\$$price',
            style: GoogleFonts.sansita(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: colorIconCart,
            ),
          ),
        ),
      ],
    );
  }
}

