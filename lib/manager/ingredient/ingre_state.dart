import '../../models/recipe_model.dart'; // لأن Ingredient موجود في نفس الموديل

abstract class IngredientsState {}

class IngredientsInitial extends IngredientsState {}

class IngredientsLoading extends IngredientsState {}

class IngredientsError extends IngredientsState {
  final String errorMessage;
  IngredientsError(this.errorMessage);
}

class IngredientsLoaded extends IngredientsState {
  final List<Ingredient> ingredientsList;
  IngredientsLoaded(this.ingredientsList);
}
