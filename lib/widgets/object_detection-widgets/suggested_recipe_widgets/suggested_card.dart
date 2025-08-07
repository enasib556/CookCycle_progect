import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/detect_model.dart';
import '../../../screens/detailsOfSuggested_screen.dart';

class SuggestedCard extends StatelessWidget {
  final RecipesDetect recipe;
  final String imagePath;
  final int rank; // رقم الترتيب

  const SuggestedCard({
    super.key,
    required this.recipe,
    required this.imagePath,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsOfSuggestedScreen(
              recipe: recipe,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
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
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        width: 350,
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
                    ),
                    const SizedBox(height: 8),
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
            Positioned(
              top: 35,
              left:-15 ,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xffFDAB7E),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  rank.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
