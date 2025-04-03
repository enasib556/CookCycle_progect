import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_graduate_project/widgets/home_widgets/recipe_word.dart';
import '../../models/favourite_model.dart';

class FavouriteCard extends StatelessWidget {
  final Favouritemodel recipe;
  const FavouriteCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 383,
      height: 195,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        child: Stack(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    recipe.image,
                    width: 163,
                    height: 187,
                    fit: BoxFit.fill,
                  ),
                ),
                /// محتوى النصوص والتقييم
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 15, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// اسم الوصفة مع تأثير الظل
                        Padding(
                          padding: const EdgeInsets.only(right: 30), // عشان القلب ما يغطي النص
                          child: Recipeword(text: recipe.name, fontSize: 19)
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            return Icon(
                              index < recipe.rating ? Icons.star : Icons.star_border,
                              color: Colors.amber,
                            );
                          }),
                        ),
                        SizedBox(height: 5),
                        Text(
                          recipe.description,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.sansita(
                            color: Colors.grey.withOpacity(0.8),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 20,
              right: 12,
              child: Icon(Icons.favorite_border, color: Colors.grey, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}

