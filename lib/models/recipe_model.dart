class Recipe {
  int? recipeId;
  String? name;
  String? imageUrl;
  String? videoLink;
  String? duration;
  String? disc;
  String? smallDisc;
  List<Steps>? steps;

  Recipe(
      {this.recipeId,
      this.name,
      this.imageUrl,
      this.videoLink,
      this.duration,
      this.disc,
      this.smallDisc,
      this.steps});

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
        steps!.add(new Steps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Recipe_id'] = this.recipeId;
    data['Name'] = this.name;
    data['Image_url'] = this.imageUrl;
    data['Video_link'] = this.videoLink;
    data['Duration'] = this.duration;
    data['Disc'] = this.disc;
    data['Small_Disc'] = this.smallDisc;
    if (this.steps != null) {
      data['Steps'] = this.steps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Steps {
  int? stepId;
  int? stepNumber;
  String? instructions;
  String? imageUrl;

  Steps({this.stepId, this.stepNumber, this.instructions, this.imageUrl});

  Steps.fromJson(Map<String, dynamic> json) {
    stepId = json['Step_id'];
    stepNumber = json['Step_number'];
    instructions = json['Instructions'];
    imageUrl = json['Image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Step_id'] = this.stepId;
    data['Step_number'] = this.stepNumber;
    data['Instructions'] = this.instructions;
    data['Image_url'] = this.imageUrl;
    return data;
  }
}