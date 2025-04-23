import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/recipe_model.dart';

class FavouriteService {
  static const String _key = 'favouriteRecipes';

  static Future<void> saveFavourites(List<Recipe> recipes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> recipeStrings = recipes.map((r) => jsonEncode(r.toJson())).toList();
    await prefs.setStringList(_key, recipeStrings);
  }

  static Future<List<Recipe>> loadFavourites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? recipeStrings = prefs.getStringList(_key);
    if (recipeStrings != null) {
      return recipeStrings.map((r) => Recipe.fromJson(jsonDecode(r))).toList();
    }
    return [];
  }

  static Future<void> toggleFavourite(Recipe recipe) async {
    List<Recipe> favouriteRecipes = await loadFavourites();

    if (favouriteRecipes.any((r) => r.recipeId == recipe.recipeId)) {
      favouriteRecipes.removeWhere((r) => r.recipeId == recipe.recipeId);
    } else {
      favouriteRecipes.add(recipe);
    }

    await saveFavourites(favouriteRecipes);
  }

  static Future<bool> isFavourite(Recipe recipe) async {
    final list = await loadFavourites();
    return list.any((r) => r.recipeId == recipe.recipeId);
  }
}
