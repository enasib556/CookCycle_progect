import '../../models/recipe_model.dart'; // لأن Ingredients جوه Recipe Model

abstract class IngredientsState {}

class IngredientsInitial extends IngredientsState {}

class IngredientsLoading extends IngredientsState {}

class IngredientsError extends IngredientsState {
  final String errorMessage;
  IngredientsError(this.errorMessage);
}

class IngredientsLoaded extends IngredientsState {
  final List<Ingredients> ingredientsList;
  IngredientsLoaded(this.ingredientsList);
}
