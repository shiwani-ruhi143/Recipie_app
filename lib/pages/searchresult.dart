import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipes.dart';

class SearchResult extends StatefulWidget {
  SearchResult({Key? key, this.recipiedetails,this.step_s}) : super(key: key);
  Recipe? recipiedetails;
  RecipieSteps? step_s;
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  
 Widget Rich_text(String heading, String value) {
     return RichText(
      text: TextSpan(
          text: heading,
          style: TextStyle(fontSize: 25, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: value,
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            )
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              color: Color(0xFFFFBA53),
              child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40,45,20,0),
                child: RichText(
                          text: TextSpan(
                              text: "Name :  ",
                              style: TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                  text: widget.recipiedetails!.title,
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(text: "\n")
                              ]),
                        ),
              ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40,5,20,0),
                        child: RichText(
                          text: TextSpan(
                              text: "Time Needed :  ",
                              style: TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.bold,),
                              children: <TextSpan>[
                                TextSpan(
                                  text: widget.recipiedetails!.readyInMinutes!
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: " minutes",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(text: "\n")
                              ]),
                        ),
                      ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 25, 0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                  )),
                  child: Image.network(
                    widget.recipiedetails!.image!,
                    height: 200,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 30, 25, 0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // RichText(
                      //   text: TextSpan(
                      //       text: "Name :  ",
                      //       style: TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.bold),
                      //       children: <TextSpan>[
                      //         TextSpan(
                      //           text: widget.recipiedetails!.title,
                      //           style: TextStyle(
                      //             fontSize: 25,
                      //             color: Colors.black,
                      //             fontWeight: FontWeight.normal,
                      //           ),
                      //         ),
                      //         TextSpan(text: "\n")
                      //       ]),
                      // ),
                      // RichText(
                      //   text: TextSpan(
                      //       text: "Time Needed :  ",
                      //       style: TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.bold,),
                      //       children: <TextSpan>[
                      //         TextSpan(
                      //           text: widget.recipiedetails!.readyInMinutes!
                      //               .toString(),
                      //           style: TextStyle(
                      //             fontSize: 25,
                      //             color: Colors.black,
                      //             fontWeight: FontWeight.normal,
                      //           ),
                      //         ),
                      //         TextSpan(
                      //           text: " minutes",
                      //           style: TextStyle(
                      //             fontSize: 25,
                      //             color: Colors.black,
                      //             fontWeight: FontWeight.normal,
                      //           ),
                      //         ),
                      //         TextSpan(text: "\n")
                      //       ]),
                      // ),
                      RichText(
                        text: TextSpan(
                            text: "Vegetarian :  ",
                            style: TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.bold,),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    widget.recipiedetails!.vegetarian!.toString(),
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(text: "\n")
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Health Scores :  ",
                            style: TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.bold,),
                            children: <TextSpan>[
                              TextSpan(
                                text: widget.recipiedetails!.healthScore!
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(text: "\n")
                            ]),
                      ),
                      for(var abc in widget.step_s!.steps!)
                        //  Text("Step "+abc.number!.toString()+" : "+abc.step!,
                        //      style: TextStyle(
                        //        fontSize: 25,
                        //      ),
                        //  ),
                      RichText(
                        text: TextSpan(
                            text: "Step ${abc.number} : ",
                            style: TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: abc.step!,
                                  
                                style: TextStyle(
                                 fontWeight: FontWeight.normal,
                                 fontSize: 25,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(text: "\n")
                            ]),
                      ),
        
                    ],
                  ),
                ),
              ),
            ],
          ),
              ),
            ),
        ));
  }
}
