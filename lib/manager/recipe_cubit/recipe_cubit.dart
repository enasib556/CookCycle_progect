import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_graduate_project/network/apiService.dart';
import '../../models/recipe_model.dart';
import 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  final ApiService apiService = ApiService();
  RecipeCubit() : super(RecipeInitial());
  void fetchRecipe() async{
    emit(RecipeLoading());
    try{
      final json = await apiService.get('recipes');
      List<Recipe> recipes = [];
      for (var item in json.data) {
        recipes.add(Recipe.fromJson(item));
      }
      emit(RecipeLoaded(recipes));
      }
      catch(e){
      emit(RecipeError(e.toString()));
    }
  }
}