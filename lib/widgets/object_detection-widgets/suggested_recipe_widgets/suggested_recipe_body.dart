import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_graduate_project/widgets/object_detection-widgets/suggested_recipe_widgets/custom_imgae.dart';

import '../../../utilis/color.dart';
import '../../general_widgets/custom_appbar_for_objectDe.dart';
import 'suggested_list.dart';

class SuggestedRecipeBody extends StatelessWidget {
  final String imagePath;
  const SuggestedRecipeBody({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16 ),
      child: ListView(
        children: [
          SizedBox(height: 30),
          CustomAppbarForObjectde(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 20),
          CustomImgae(imagePath: imagePath),
          SizedBox(height: 16),
          Text(
            'Suggested Recipe for You',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w800,
              color: AuthColorButton,
              fontSize: 28,
            ),
          ),
          SuggestedList()
        ],
      ),
    );
  }
}
