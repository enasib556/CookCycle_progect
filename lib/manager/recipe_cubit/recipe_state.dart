import '../../models/recipe_model.dart';

abstract class RecipeState {}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeError extends RecipeState {
  final String errorMessage;
  RecipeError(this.errorMessage);
}

class RecipeLoaded extends RecipeState {
  final List<Recipe> recipesList;
  RecipeLoaded(this.recipesList);
}
