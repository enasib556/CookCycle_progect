import 'package:flutter/material.dart';
import 'package:university_graduate_project/screens/details_screen.dart';
import '../../models/recipe_model.dart';
import '../../network/favourite_service.dart';
import '../../utilis/color.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool isFavorite =false;
  @override
  void initState() {
    super.initState();
    _loadFavouriteStatus();
  }

  void _loadFavouriteStatus() async {
    bool fav = await FavouriteService.isFavourite(widget.recipe);
    setState(() {
      isFavorite = fav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen(recipe: widget.recipe,)));
      },
      child: Container(
        width: 180, // ضبط العرض
        decoration: BoxDecoration(
          border: Border.all(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(23), // زوايا مستديرة
          color: beige, // خلفية بيضاء
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min, // منع overflow
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(23)),
                  child: Image.network(
                    widget.recipe.imageUrl??"",
                    fit: BoxFit.cover,
                    height: 120, // تقليل الارتفاع لتناسب التصميم
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: SizedBox(
                    width: 110,
                    child: AutoSizeText(
                      widget.recipe.name ?? "",
                      style: TextStyle(
                        fontFamily: 'SansitaOne',
                        fontSize: 12.8,
                        color: Color(0xff666967),
                      ),
                      maxLines: 2,
                      minFontSize: 8,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
            // أيقونة القلب في الأسفل على اليمين
            Positioned(
              right: 0,
              bottom: 2,
              child: IconButton(
                icon: Icon(isFavorite?Icons.favorite:Icons.favorite_border, color: AuthColorButton, size: 26),
                onPressed: () async {
                  await FavouriteService.toggleFavourite(widget.recipe);
                  bool fav = await FavouriteService.isFavourite(widget.recipe);
                  setState(() {
                    isFavorite = fav;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
