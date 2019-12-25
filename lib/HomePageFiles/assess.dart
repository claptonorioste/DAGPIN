import 'dart:math';

import 'package:flutter/material.dart';
import 'home.dart';
import 'infoData.dart';

Random generateRandom = Random();


class Assess extends StatefulWidget {  
 
 static const routeName = '/assess';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AssessState();
  }
}

class AssessState extends State<Assess> {
  SetTodaysMood setMood = SetTodaysMood();

  @override
  Widget build(BuildContext context) {
    final Questions args = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Assess"),
        ),
        body: ListView.builder(
          itemCount: args.questions.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(args.questions[index]) ,
              onTap: () {
               //update attributes in first page here
              },
            );
          },
        ));
  }
}


