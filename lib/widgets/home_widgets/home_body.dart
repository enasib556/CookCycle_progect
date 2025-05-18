import 'package:flutter/material.dart';
import 'package:university_graduate_project/utilis/color.dart';
import 'package:university_graduate_project/widgets/home_widgets/recipe_word.dart';
import 'package:university_graduate_project/widgets/home_widgets/search_bar.dart';
import 'package:university_graduate_project/widgets/home_widgets/header_clipper.dart';
import 'grid_view_recipe.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  String searchQuery = "";
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
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Searchbar(
                   onChanged: (value) {
                     setState(() {
                       searchQuery = value;
                     });
                   },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Recipeword(
                  text: 'Recipe Suggestion',
                  fontSize: 28,
                ),
              ),
              GridViewRecipe(searchQuery: searchQuery,),
              SizedBox(height: 10),
            ],
          ),
          Positioned(
            top: 140, // تحريك النص للأعلى
            left: 20,
            child: Text(
              "Find Your\nFavourite Food",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'SansitaOne',
                color: colorTextHome.withOpacity(0.65),
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

