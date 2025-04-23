import 'package:flutter/material.dart';
import '../../models/recipe_model.dart';
import '../../network/favourite_service.dart';
import 'favourite_card.dart';

class FavouriteListView extends StatefulWidget {
  const FavouriteListView({super.key});

  @override
  State<FavouriteListView> createState() => _FavouriteListViewState();
}

class _FavouriteListViewState extends State<FavouriteListView> {
  List<Recipe> _favourites = [];

  @override
  void initState() {
    super.initState();
    _loadFavourites();
  }

  void _loadFavourites() async {
    List<Recipe> favs = await FavouriteService.loadFavourites();
    setState(() {
      _favourites = favs;
    });
  }

  void _removeFromFavourites(Recipe recipe) async {
    _favourites.removeWhere((r) => r.recipeId == recipe.recipeId);
    await FavouriteService.saveFavourites(_favourites);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _favourites.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: FavouriteCard(
              recipe: _favourites[index],
              onUnfavourite: () => _removeFromFavourites(_favourites[index]),
            ),
          );
        },
      ),
    );
  }
}
