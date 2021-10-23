class RecipeList {
  List<Recipe>? listofRecipe;
  RecipeList({this.listofRecipe});
  factory RecipeList.fromMap(Map<String, dynamic> map) {
    return RecipeList(
      listofRecipe: generatelist(map),
    );
  }
}

List<Recipe> generatelist(Map<String, dynamic> map) {
  List<Recipe> recipe_list = [];
  for (var item in map['results']) {
    Recipe recipe = Recipe.fromMap(item);
    recipe_list.add(recipe);
  }
  return recipe_list;
}

class Recipe {
  int? id;
  String? title;
  String? image;
  
  int? readyInMinutes;
  bool? vegetarian;
   double? healthScore;

  Recipe(
      {this.id,
      this.title,
      this.image,
     
      this.readyInMinutes,
      this.vegetarian,
      this.healthScore,
      });

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['id'],
      title: map['title'],
      image: map['image'],
      readyInMinutes: map['readyInMinutes'],
      vegetarian: map['vegetarian'],
      healthScore: map['healthScore'],
    );
  }
}


