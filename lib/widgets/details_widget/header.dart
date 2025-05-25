import 'package:flutter/material.dart';
import 'package:university_graduate_project/models/recipe_model.dart';
import '../../utilis/color.dart';
import '../home_widgets/recipe_word.dart';
import 'package:url_launcher/url_launcher.dart';


class Header extends StatelessWidget {
  final Recipe recipe;
  const Header({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse('${recipe.videoLink}');

    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }
    return Stack(
      children: [
        Image.network(recipe.imageUrl!, width: double.infinity, height: 459, fit: BoxFit.cover),
        Positioned(
          top: 50, // Adjust the top position as per your requirement
          left: 10, // Adjust the left position as per your requirement
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color:Colors.white, size: 30,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Positioned(
          bottom: 10,
          left: 12,
          child: Recipeword(text: recipe.name!, fontSize: 25),
        ),
        Positioned(
          bottom: 10,
          right: 20,
          child: InkWell(
            onTap: _launchUrl,
            child: CircleAvatar(
              radius: 20.5,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: AuthColorButton,
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}