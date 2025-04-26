class Recipe {
  int? recipeId;
  String? name;
  String? imageUrl;
  String? videoLink;
  String? duration;
  String? disc;
  String? smallDisc;
  List<Steps>? steps;
  List<Ingredients>? ingredients;

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
      steps = <Steps>[];
      json['Steps'].forEach((v) {
        steps!.add(Steps.fromJson(v));
      });
    }

    if (json['Ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['Ingredients'].forEach((v) {
        ingredients!.add(Ingredients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Recipe_id'] = recipeId;
    data['Name'] = name;
    data['Image_url'] = imageUrl;
    data['Video_link'] = videoLink;
    data['Duration'] = duration;
    data['Disc'] = disc;
    data['Small_Disc'] = smallDisc;

    if (steps != null) {
      data['Steps'] = steps!.map((v) => v.toJson()).toList();
    }

    if (ingredients != null) {
      data['Ingredients'] = ingredients!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Steps {
  int? stepId;
  int? stepNumber;
  String? instructions;
  String? imageUrl;

  Steps({
    this.stepId,
    this.stepNumber,
    this.instructions,
    this.imageUrl,
  });

  Steps.fromJson(Map<String, dynamic> json) {
    stepId = json['Step_id'];
    stepNumber = json['Step_number'];
    instructions = json['Instructions'];
    imageUrl = json['Image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Step_id'] = stepId;
    data['Step_number'] = stepNumber;
    data['Instructions'] = instructions;
    data['Image_url'] = imageUrl;
    return data;
  }
}

class Ingredients {
  int? ingredientId;
  String? name;
  String? price;
  String? imageUrl;
  String? quantity;
  bool isSelected;

  Ingredients({
    this.ingredientId,
    this.name,
    this.price,
    this.imageUrl,
    this.quantity,
    this.isSelected = false,
  });

  Ingredients.fromJson(Map<String, dynamic> json)
      : ingredientId = json['Ingredient_id'],
        name = json['Name'],
        price = json['Price'],
        imageUrl = json['Image_url'],
        quantity = json['Quantity'],
        isSelected = json['isSelected'] ?? false;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Ingredient_id'] = ingredientId;
    data['Name'] = name;
    data['Price'] = price;
    data['Image_url'] = imageUrl;
    data['Quantity'] = quantity;
    data['isSelected'] = isSelected;
    return data;
  }
}
