import 'package:flutter/material.dart';
import 'package:university_graduate_project/screens/details_screen.dart';
import '../../models/recipe_model.dart';
import '../../utilis/color.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen(recipe: recipe,)));
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
                    recipe.imageUrl??"",
                    fit: BoxFit.cover,
                    height: 120, // تقليل الارتفاع لتناسب التصميم
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: SizedBox(
                      width: 110,
                      child: Text(
                        recipe.name??"",
                        style: TextStyle(
                          fontFamily: 'SansitaOne',
                          fontSize: 12.5,
                          color: Color(0xff666967),
                        )))
                ),
                SizedBox(height: 5),
              ],
            ),
            // أيقونة القلب في الأسفل على اليمين
            Positioned(
              right: 0,
              bottom: 1,
              child: IconButton(
                icon: Icon(Icons.favorite_border, color: colorElevatedButton, size: 26),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
