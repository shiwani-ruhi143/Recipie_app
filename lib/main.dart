import 'dart:ui';

import 'package:flutter/material.dart';
import 'pages/homepage.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoveToHomepage(),
    );
  }
}


class MoveToHomepage extends StatefulWidget {
  MoveToHomepage({Key? key}) : super(key: key);

  @override
  _MoveToHomepageState createState() => _MoveToHomepageState();
}

class _MoveToHomepageState extends State<MoveToHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Stack(
          children: [
            Container(
              decoration:  const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://previews.123rf.com/images/belchonock/belchonock1211/belchonock121100371/16107948-paper-for-recipes-spaghetti-with-vegetables-and-spices-on-sacking-background.jpg"),
                  fit: BoxFit.cover,
                  )
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
            ),
         Padding(
           padding: const EdgeInsets.fromLTRB(0,200,0,0),
           child: Column(
              children: [
                const Center(
                   child: Text("Recipes",
                     style: TextStyle(
                       fontFamily: 'Lobester',
                       fontSize: 50,
                       fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic
                     ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                    },
                    child: Padding(
                       padding: const EdgeInsets.fromLTRB(0,70,0,0),
                       child: Container(
                         height:50,
                         width: 200,
                         decoration: BoxDecoration(
                           color: Colors.black,
                         ),
                         child: const Center(
                         child: Text("Explore Now..",
                           style: TextStyle(
                             fontFamily: 'Lobester',
                             fontSize: 25,
                             color: Colors.white,
                           ),
                          ),
                    ),
                       ),
                     ),
                  ),
               ],
             ),
         )
          ],
        ),
        
      );
    
  }
}