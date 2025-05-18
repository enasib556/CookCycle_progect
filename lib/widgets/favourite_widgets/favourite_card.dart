import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_graduate_project/models/recipe_model.dart';
import '../../screens/details_screen.dart';
import '../../utilis/color.dart';

class FavouriteCard extends StatefulWidget {
  final Recipe recipe;
  final VoidCallback onUnfavourite;

  const FavouriteCard({
    super.key,
    required this.recipe,
    required this.onUnfavourite,
  });

  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
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
                SizedBox(width: 10),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(recipe: widget.recipe,)));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.recipe.imageUrl!,
                      width: 140,
                      height: 130,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 15, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text( widget.recipe.name!,
                          style: TextStyle(
                            fontFamily: 'SansitaOne',
                            fontSize: 18,
                            color: Color(0xff6E7370),
                          ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            return Icon(
                              index < widget.recipe.recipeId! ? Icons.star : Icons.star_border,
                              color: Colors.amber,
                            );
                          }),
                        ),
                        SizedBox(height: 5),
                        Text(
                          widget.recipe.disc!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
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
              child: GestureDetector(
                onTap: () {
                  widget.onUnfavourite(); // نبلغ الليست إنه يتحذف
                },
                child: Icon(Icons.favorite, color: colorElevatedButton, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
