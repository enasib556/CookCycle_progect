import 'package:flutter/material.dart';
import 'package:university_graduate_project/screens/details_screen.dart';
import 'package:university_graduate_project/widgets/home_widgets/recipe_word.dart';
import '../../models/recipeModel.dart';
import '../../utilis/color.dart';

class RecipeCard extends StatelessWidget {
  final RecipeModel recipe;
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
                  child: SizedBox(
                      width: 150,
                      child: Recipeword(text: recipe.name, fontSize: 13))
                ),
                SizedBox(height: 5),
              ],
            ),
            // أيقونة القلب في الأسفل على اليمين
            Positioned(
              right: 0,
              bottom: 1,
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
