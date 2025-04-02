import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:university_graduate_project/utilis/color.dart';
import 'package:university_graduate_project/widgets/home_widgets/recipe_word.dart';
import 'package:university_graduate_project/widgets/home_widgets/search_bar.dart';
import 'package:university_graduate_project/widgets/home_widgets/header_clipper.dart';
import 'grid_view_recipe.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: HeaderClipper(),
                child: Container(
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/salmon-salad-international.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Searchbar(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Recipeword(
                  text: 'Recipe Suggestion',
                  fontSize: 26,
                ),
              ),
              GridViewRecipe(),
              SizedBox(height: 10),
            ],
          ),
          Positioned(
            top: 140, // تحريك النص للأعلى
            left: 20,
            child: Text(
              "Find Your\nFavourite Food",
              textAlign: TextAlign.left,
              style: GoogleFonts.sansita(
                color: colorTextHome,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
