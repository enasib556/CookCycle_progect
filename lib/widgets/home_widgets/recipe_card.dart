import 'package:flutter/material.dart';
import 'package:university_graduate_project/screens/details_screen.dart';
import '../../models/recipe_model.dart';
import '../../utilis/color.dart';

class RecipeCard extends StatelessWidget {
  final RecipeCardModel recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen()));
      },
      child: Container(
        width: 180, // ضبط العرض
        decoration: BoxDecoration(
          border: Border.all(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(25), // زوايا مستديرة
          color: Colors.white, // خلفية بيضاء
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black26,
          //     blurRadius: 0,
          //     spreadRadius: 2,
          //     offset: Offset(0, 3),
          //   ),
          // ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min, // منع overflow
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                  child: Image.asset(
                    recipe.image,
                    fit: BoxFit.cover,
                    height: 120, // تقليل الارتفاع لتناسب التصميم
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: Stack(
                    children: [
                      // النص الخارجي (حدود خضراء)
                      Text(
                        recipe.recipeName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = Colors.green.shade900,
                        ),
                      ),
                      // النص الداخلي (لون أبيض)
                      Text(
                        recipe.recipeName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
            // أيقونة القلب في الأسفل على اليمين
            Positioned(
              right: 0,
              bottom: 6,
              child: IconButton(
                icon: Icon(Icons.favorite_border, color: Colors.grey, size: 26),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}