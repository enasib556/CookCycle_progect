import 'package:bloc/bloc.dart';
import 'package:university_graduate_project/manager/ingredient/ingre_state.dart';

import '../../models/recipe_model.dart';
import '../../network/apiService.dart';

class IngredientCubit extends Cubit<IngredientsState> {
  final ApiService apiService = ApiService();
  IngredientCubit() : super(IngredientsInitial());

  void fetchIngredients(String recipeId) async {
    emit(IngredientsLoading());
    try {
      final json = await apiService.get('ingredients/$recipeId');
      List<Ingredients> ingredients = [];
      for (var item in json.data) {
        ingredients.add(Ingredients.fromJson(item));
      }
      emit(IngredientsLoaded(ingredients));
    } catch (e) {
      emit(IngredientsError(e.toString()));
    }
  }
}
