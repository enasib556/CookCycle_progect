import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_graduate_project/manager/recipe_cubit/recipe_state.dart';
import 'package:university_graduate_project/widgets/home_widgets/recipe_card.dart';
import '../../manager/recipe_cubit/recipe_cubit.dart';

class GridViewRecipe extends StatefulWidget {
  final String searchQuery;
  const GridViewRecipe({super.key, required this.searchQuery});

  @override
  State<GridViewRecipe> createState() => _GridViewRecipeState();
}

class _GridViewRecipeState extends State<GridViewRecipe> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeCubit, RecipeState>(
      builder: (context, state) {
        if (state is RecipeError) {
          return Center(child: Text(state.errorMessage));
        } else if (state is RecipeLoaded) {
          final filteredList = state.recipesList.where((recipe) {
            final title = recipe.name?.toLowerCase();
            final query = widget.searchQuery.toLowerCase();
            return title!.contains(query);
          }).toList();

          if (filteredList.isEmpty) {
            return Center(child: Text("No recipes found."));
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              itemCount: filteredList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 13,
                mainAxisSpacing: 20,
                childAspectRatio: 0.56,
              ),
              itemBuilder: (context, index) {
                return RecipeCard(recipe: filteredList[index]);
              },
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}