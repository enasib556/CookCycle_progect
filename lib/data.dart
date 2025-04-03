import 'package:university_graduate_project/models/recipeModel.dart';

import 'models/favourite_model.dart';

List <RecipeModel> recipes = [
  RecipeModel(name: 'Classic Caesar Chicken', image: 'assets/images/salmon-salad-international.png',
      description: 'A Italian-American dish',
      ingredients: [
        IngredientModel(name: 'Chicken breasts', quantity: '4 boneless, skinless',price: 30,
        image: 'assets/images/salmon-salad-international.png'
        ),
        IngredientModel(name: 'Caesar dressing', quantity: '½ cup',price: 10,
            image: 'assets/images/salmon-salad-international.png'
        ),
        IngredientModel(name: 'Parmesan cheese', quantity: '½ cup, grated',price: 10,image: 'assets/images/salmon-salad-international.png'),
        IngredientModel(name: 'Crushed croutons', quantity: '½ cup',price: 10,image: 'assets/images/salmon-salad-international.png'),
        IngredientModel(name: 'Garlic powder', quantity: '1 teaspoon',price: 10,image: 'assets/images/salmon-salad-international.png'),
        IngredientModel(name: 'Black pepper', quantity: '½ teaspoon',price: 10,image: 'assets/images/salmon-salad-international.png'),
      ],
      steps: [
      StepModel(description: 'Preheat the oven to 190°C (375°F).',
          image: 'assets/images/oven.png',
          stepNumber: 1),
      StepModel(description: 'Place the chicken in a baking dish.',
          image: 'assets/images/chickendish.png',
          stepNumber: 2),
      StepModel(description: 'Coat with Caesar dressing, cheese, croutons, and seasonings.',
          image: 'assets/images/chickenwithcheese .png',
          stepNumber: 3),
      StepModel(description: 'Bake for 25-30 minutes until fully cooked.',
          image: 'assets/images/finishChicken.png',
          stepNumber: 4),
      StepModel(description: 'Serve with parsley garnish (optional).',
          image: 'assets/images/final_receipe.png',
          stepNumber: 5)
      ], cookingTime: '30 min')
];

final List<RecipeModel> recipesList = [
  RecipeModel(
      name: "Classic Caesar Chicken",
      image: "assets/images/test.jpg"),
  RecipeModel(
      name: "Roasted Potato Salad",
      image: "assets/images/test.jpg"),
  RecipeModel(
      name: "Quinoa Tabbouleh",
      image: "assets/images/test.jpg"),
  RecipeModel(
      name: "Spicy Meatballs",
      image: "assets/images/test.jpg"),
  RecipeModel(
      name: "Grilled Veggies",
      image: "assets/images/test.jpg"),
  RecipeModel(
      name: "Mediterranean Platter",
      image: "assets/images/test.jpg"),
  RecipeModel(
      name: "Classic Caesar Chicken",
      image: "assets/images/test.jpg"),
  RecipeModel(
      name: "Roasted Potato Salad",
      image: "assets/images/test.jpg"),
  RecipeModel(
      name: "Quinoa Tabbouleh",
      image: "assets/images/test.jpg"),
  RecipeModel(
      name: "Spicy Meatballs",
      image: "assets/images/test.jpg"),
  RecipeModel(
      name: "Grilled Veggies",
      image: "assets/images/test.jpg"),
  RecipeModel(
      name: "Mediterranean Platter",
      image: "assets/images/test.jpg"),
];

final List<Favouritemodel> favouriteRecipes = [
  Favouritemodel(
    name: "Roasted Sweet Potato Salad",
    image: "assets/images/test.jpg",
    rating: 4.5,
    description:
    "Delicious roasted sweet potatoes with nuts and Healthy toast with avocado, salmon, and eggs ",
  ),
  Favouritemodel(
    name: "Avocado Toast & Salmon",
    image: "assets/images/test.jpg",
    rating: 5.0,
    description:
    "Healthy toast with avocado, salmon, and eggs Healthy toast with avocado, salmon, and eggs.",
  ),
];
