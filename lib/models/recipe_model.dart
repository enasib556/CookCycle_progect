class Recipe {
  int? recipeId;
  String? name;
  String? imageUrl;
  String? videoLink;
  String? duration;
  String? disc;
  String? smallDisc;
  List<StepModel>? steps;
  List<Ingredient>? ingredients;

  Recipe({
    this.recipeId,
    this.name,
    this.imageUrl,
    this.videoLink,
    this.duration,
    this.disc,
    this.smallDisc,
    this.steps,
    this.ingredients,
  });

  Recipe.fromJson(Map<String, dynamic> json) {
    recipeId = json['Recipe_id'];
    name = json['Name'];
    imageUrl = json['Image_url'];
    videoLink = json['Video_link'];
    duration = json['Duration'];
    disc = json['Disc'];
    smallDisc = json['Small_Disc'];

    if (json['Steps'] != null) {
      steps = (json['Steps'] as List).map((v) => StepModel.fromJson(v)).toList();
    }
    if (json['Ingredients'] != null) {
      ingredients = (json['Ingredients'] as List).map((v) => Ingredient.fromJson(v)).toList();
    }
  }

  Map<String, dynamic> toJson() => {
    'Recipe_id': recipeId,
    'Name': name,
    'Image_url': imageUrl,
    'Video_link': videoLink,
    'Duration': duration,
    'Disc': disc,
    'Small_Disc': smallDisc,
    'Steps': steps?.map((v) => v.toJson()).toList(),
    'Ingredients': ingredients?.map((v) => v.toJson()).toList(),
  };
}

class StepModel {
  int? stepId;
  int? stepNumber;
  String? instructions;
  String? imageUrl;

  StepModel({this.stepId, this.stepNumber, this.instructions, this.imageUrl});

  StepModel.fromJson(Map<String, dynamic> json) {
    stepId = json['Step_id'];
    stepNumber = json['Step_number'];
    instructions = json['Instructions'];
    imageUrl = json['Image_url'];
  }

  Map<String, dynamic> toJson() => {
    'Step_id': stepId,
    'Step_number': stepNumber,
    'Instructions': instructions,
    'Image_url': imageUrl,
  };
}
class Ingredient {
  int? ingredientId;
  int? recipeId;
  String? name;
  String? price;
  String? imageUrl;
  String? quantity;
  bool isSelected;

  Ingredient({
    this.ingredientId,
    this.recipeId,
    this.name,
    this.price,
    this.imageUrl,
    this.quantity,
    this.isSelected = false,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      ingredientId: json['Ingredient_id'],
      recipeId: json['Recipe_id'],
      name: json['Name'],
      price: json['Price']?.toString() ?? '',
      imageUrl: json['Image_url'],
      quantity: json['Quantity'],
      isSelected: json['isSelected'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'Ingredient_id': ingredientId,
    'Recipe_id': recipeId,
    'Name': name,
    'Price': price,
    'Image_url': imageUrl,
    'Quantity': quantity,
    'isSelected': isSelected,
  };

  static double? _parsePrice(dynamic price) {
    if (price == null) return null;
    if (price is double) return price;
    if (price is int) return price.toDouble();
    if (price is String) return double.tryParse(price);
    return null;
  }
}