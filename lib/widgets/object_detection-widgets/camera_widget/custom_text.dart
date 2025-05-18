import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilis/color.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Identify Any Recipe From a Photo',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            color: AuthColorButton,
            fontSize: 32,
            height: 1.15,
          ),),
        SizedBox(height: 20,),
        Text('Take or upload a photo of your fridge, and we’ll suggest delicious recipes based on what you have.',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
            color: Color(0xff000000).withOpacity(0.64),
            fontSize: 18,
            height: 1.2
          ),
        )
      ],
    );
  }
}
