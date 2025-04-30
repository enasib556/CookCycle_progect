import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_graduate_project/models/recipe_model.dart';
import 'package:university_graduate_project/manager/ingredient/ingre_state.dart';
import 'package:university_graduate_project/network/apiService.dart';

class IngredientCubit extends Cubit<IngredientsState> {
  IngredientCubit() : super(IngredientsInitial());

  final ApiService apiService = ApiService();

  void fetchIngredients(String recipeId) async {
    emit(IngredientsLoading());
    try {
      final response = await apiService.get('ingredients/$recipeId');

      List<Ingredient> ingredients = [];

      for (var item in response.data) {
        ingredients.add(Ingredient.fromJson(item));
      }

      emit(IngredientsLoaded(ingredients));
    } catch (e) {
      emit(IngredientsError('حدث خطأ أثناء جلب المكونات: ${e.toString()}'));
    }
  }
}
