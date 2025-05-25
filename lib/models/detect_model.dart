class DetectModel {
  List<String>? detectedObjects;
  List<RecipesDetect>? recipes;

  DetectModel({this.detectedObjects, this.recipes});

  DetectModel.fromJson(Map<String, dynamic> json) {
    detectedObjects = json['detected_objects'].cast<String>();
    if (json['recipes'] != null) {
      recipes = <RecipesDetect>[];
      json['recipes'].forEach((v) {
        recipes!.add(new RecipesDetect.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detected_objects'] = this.detectedObjects;
    if (this.recipes != null) {
      data['recipes'] = this.recipes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecipesDetect {
  int? recipeId;
  String? name;
  String? videoLink;
  String? prepTime;
  String? cookTime;
  String? servings;
  String? difficulty;
  String? recipeType;
  List<StepsDetect>? steps;
  List<IngredientsDetect>? ingredients;
  List<String>? equipment;
  NutritionDetect? nutrition;

  RecipesDetect(
      {this.recipeId,
        this.name,
        this.videoLink,
        this.prepTime,
        this.cookTime,
        this.servings,
        this.difficulty,
        this.recipeType,
        this.steps,
        this.ingredients,
        this.equipment,
        this.nutrition});

  RecipesDetect.fromJson(Map<String, dynamic> json) {
    recipeId = json['Recipe_id'];
    name = json['Name'];
    videoLink = json['Video_link'];
    prepTime = json['Prep_Time'];
    cookTime = json['Cook_Time'];
    servings = json['Servings'];
    difficulty = json['Difficulty'];
    recipeType = json['Recipe_Type'];
    if (json['Steps'] != null) {
      steps = <StepsDetect>[];
      json['Steps'].forEach((v) {
        steps!.add(new StepsDetect.fromJson(v));
      });
    }
    if (json['Ingredients'] != null) {
      ingredients = <IngredientsDetect>[];
      json['Ingredients'].forEach((v) {
        ingredients!.add(new IngredientsDetect.fromJson(v));
      });
    }
    equipment = json['Equipment'].cast<String>();
    nutrition = json['Nutrition'] != null
        ? new NutritionDetect.fromJson(json['Nutrition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Recipe_id'] = this.recipeId;
    data['Name'] = this.name;
    data['Video_link'] = this.videoLink;
    data['Prep_Time'] = this.prepTime;
    data['Cook_Time'] = this.cookTime;
    data['Servings'] = this.servings;
    data['Difficulty'] = this.difficulty;
    data['Recipe_Type'] = this.recipeType;
    if (this.steps != null) {
      data['Steps'] = this.steps!.map((v) => v.toJson()).toList();
    }
    if (this.ingredients != null) {
      data['Ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    data['Equipment'] = this.equipment;
    if (this.nutrition != null) {
      data['Nutrition'] = this.nutrition!.toJson();
    }
    return data;
  }
}

class StepsDetect {
  int? stepId;
  int? stepNumber;
  String? instructions;

  StepsDetect({this.stepId, this.stepNumber, this.instructions});

  StepsDetect.fromJson(Map<String, dynamic> json) {
    stepId = json['Step_id'];
    stepNumber = json['Step_number'];
    instructions = json['Instructions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Step_id'] = this.stepId;
    data['Step_number'] = this.stepNumber;
    data['Instructions'] = this.instructions;
    return data;
  }
}

class IngredientsDetect {
  int? ingredientId;
  String? name;
  String? price;
  String? quantity;

  IngredientsDetect({this.ingredientId, this.name, this.price, this.quantity});

  IngredientsDetect.fromJson(Map<String, dynamic> json) {
    ingredientId = json['Ingredient_id'];
    name = json['Name'];
    price = json['Price'];
    quantity = json['Quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Ingredient_id'] = this.ingredientId;
    data['Name'] = this.name;
    data['Price'] = this.price;
    data['Quantity'] = this.quantity;
    return data;
  }
}

class NutritionDetect {
  String? calories;
  String? protein;
  String? carbs;
  String? fat;

  NutritionDetect({this.calories, this.protein, this.carbs, this.fat});

  NutritionDetect.fromJson(Map<String, dynamic> json) {
    calories = json['calories'];
    protein = json['protein'];
    carbs = json['carbs'];
    fat = json['fat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['calories'] = this.calories;
    data['protein'] = this.protein;
    data['carbs'] = this.carbs;
    data['fat'] = this.fat;
    return data;
  }
}