class RecipeModel{
  final String name;
  final String image;
  final String? description;
  final String? cookingTime;
  final List<IngredientModel>? ingredients ; // List of ingredients>
  final List<StepModel>? steps ;
  RecipeModel({ this.cookingTime,required this.name, required this.image,  this.description
  , this.ingredients,  this.steps
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