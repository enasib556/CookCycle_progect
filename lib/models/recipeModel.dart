class RecipeModel{
  final String name;
  final String image;
  final String description;
  final String cookingTime;
  final List<IngredientModel> ingredients ; // List of ingredients>
  final List<StepModel> steps ;
  RecipeModel({required this.cookingTime,required this.name, required this.image, required this.description
  ,required this.ingredients, required this.steps
  });

}

class IngredientModel{
  final String name;
  final String quantity;
  final String? image;
  final int? price;

  IngredientModel({required this.name, required this.quantity, this.price,this.image,} );
}

class StepModel{
  final String description;
  final String image;
  final int stepNumber;
  StepModel({required this.description, required this.image,required this.stepNumber});
}