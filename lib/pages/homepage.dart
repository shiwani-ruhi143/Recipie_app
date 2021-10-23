
import 'dart:ui';
import 'package:recipe_app/pages/searchresult.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipes.dart';
import 'package:recipe_app/services/fetching.dart';
import 'package:hovering/hovering.dart';
class RecipeTiles extends StatefulWidget {
  RecipeTiles(
      {Key? key,
      this.id,
      this.title,
      this.image,
      this.readyInMinutes,
      this.vegetarian,
      this.healthScore})
      : super(key: key);
  int? id;
  String? title;
  String? image;
  int? readyInMinutes;
  bool? vegetarian;
  double? healthScore;
  @override
  _RecipeTilesState createState() => _RecipeTilesState();
}

class _RecipeTilesState extends State<RecipeTiles> {
  void RecipieInfo()async{
    Recipe recipieDetails;
    print('recipietile pressed');
    recipieDetails=await fetching_recipe_info(widget.id!);
    
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchResult(recipiedetails: recipieDetails,)));
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: InkWell(
        onTap: (){
            RecipieInfo();
        },
        child: Container(
             child: Column(
               children: [
                
                Image.network(widget.image!,height: 300,width: double.infinity,),
                 Text(widget.title!,
                   style: TextStyle(
                       fontSize: 25,
                   ),
                 ),
                
               ],
             ),
        ),
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   TextEditingController recipe_name = TextEditingController();
   List<Widget> searchList=[];
  void searchFunction() async {
  
    RecipeList recipies;
    recipies = await fetching_list(recipe_name.text);
    setState(() {
      print('set state called');
      for (Recipe item in recipies.listofRecipe ?? []) {

       searchList.add(

        RecipeTiles(
          title: item.title,
          image: item.image,
          readyInMinutes: item.readyInMinutes,
          id: item.id,
          vegetarian: item.vegetarian,
          healthScore: item.healthScore,
        )
       );
      
    }
    });
    
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      decoration: BoxDecoration(
      color: Colors.amber[50],
      ),
        child: SingleChildScrollView(
          child: Column(
          
            children: [
            
              Container(
                  height: 100,
                  width: 500,
                  decoration: const BoxDecoration(
                      color: Colors.orange,
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: <Color>[Color(0xFFFFE082), Color(0xFFFFBA53)],
                          tileMode: TileMode.repeated)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 9),
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            searchFunction();
                            
                          },
                          child: Icon(Icons.search),
                        ),
                        border: OutlineInputBorder(),
                        hintText: "Search Any recipe",
                      ),
                      controller: recipe_name,
                      onEditingComplete: searchFunction,
                    ),
                  )),
                ...searchList,
                
            ],
          ),
        ),
      ),
    );
  }
}



