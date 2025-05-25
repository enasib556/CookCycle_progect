import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utilis/color.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Delivery Service',
          style: TextStyle(
            fontFamily: 'SansitaOne',
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: AuthColorButton,
          ),
        ),
        const SizedBox(height: 15),
         Text(
          'Now you can order all your favourite\n'
              'ingredients or recipes straight to your\n'
              'doorstep 🏠🛒.',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Color(0xff54977D),
          ),
        ),
      ],
    );
  }
}
