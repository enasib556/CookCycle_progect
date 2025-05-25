import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/detect_model.dart';
import '../../../screens/detailsOfSuggested_screen.dart';

class SuggestedCard extends StatelessWidget {
  final RecipesDetect recipe;

  const SuggestedCard({super.key, required this.recipe,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsOfSuggestedScreen(recipe: recipe),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Color(0xffFDAB7E),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ]
        ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width:320 ,
                  child: Text(
                    recipe.name ?? 'No Name',
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff6E7370),
                      fontSize: 19,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '${recipe.ingredients?.length ?? 0} ingredients',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff6E7370).withOpacity(0.69),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
            ),
      ),
    );
  }
}


