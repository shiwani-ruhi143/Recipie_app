import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipes.dart';


class SearchResult extends StatefulWidget {
  SearchResult({Key? key,this.recipiedetails}) : super(key: key);
  Recipe ?recipiedetails;
  
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Text(widget.recipiedetails!.title!),
      ),
    );
    
}
}