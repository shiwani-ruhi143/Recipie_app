import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

import 'package:recipe_app/models/recipes.dart';


Future<RecipeList> fetching_list(String recipe_name)async{

   var url=Uri.parse("https://api.spoonacular.com/recipes/complexSearch?apiKey=221f864b349b4157bc696db36b382397&query=$recipe_name&number=30");
   http.Response response=await http.get(url);
   print(response.body);
   return RecipeList.fromMap(jsonDecode(response.body));

}
Future<Recipe> fetching_recipe_info(int id)async{

      var url=Uri.parse("https://api.spoonacular.com/recipes/$id/information?includeNutrition=false&apiKey=221f864b349b4157bc696db36b382397");
      http.Response response=await http.get(url);
      return Recipe.fromMap(jsonDecode(response.body));
}

Future<RecipieSteps> fetching_steps(int id)async{
  var url=Uri.parse("https://api.spoonacular.com/recipes/$id/analyzedInstructions?apiKey=221f864b349b4157bc696db36b382397");
  http.Response reponse=await http.get(url);
  
  return RecipieSteps.fromMap(jsonDecode(reponse.body)[0]);
  
}