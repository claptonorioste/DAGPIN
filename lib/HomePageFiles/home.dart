import 'dart:math';

import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

import 'assess.dart';
import 'infoData.dart';

Random generateRandom = Random();

final List<String> _questionIntro = [
  "Introvert Question 1",
  "Introvert Question 2",
  "Introvert Question 3",
  "Introvert Question 4",
  "Introvert Question 5",
  "Introvert Question 6",
  "Introvert Question 7",
  "Introvert Question 8",
  "Introvert Question 9",
  "Introvert Question 10",
];
final List<String> _questionExtro = [
  "Extrovert Question 1",
  "Extrovert Question 2",
  "Extrovert Question 3",
  "Extrovert Question 4",
  "Extrovert Question 5",
  "Extrovert Question 6",
  "Extrovert Question 7",
  "Extrovert Question 8",
  "Extrovert Question 9",
  "Extrovert Question 10",
];

final List<String> _agendaIntro = [
  "Introvert Agenda 1",
  "Introvert Agenda 2",
  "Introvert Agenda 3",
  "Introvert Agenda 4",
  "Introvert Agenda 5",
];
final List<String> _agendaExtro = [
  "Extrovert Agenda 1",
  "Extrovert Agenda 2",
  "Extrovert Agenda 3",
  "Extrovert Agenda 4",
  "Extrovert Agenda 5",
];

List<String> questions = List();

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with AfterLayoutMixin<Home> {
  int todaysMood = 5;
  int userType = 0;

  String mood = "";

  @override
  void initState() {
    super.initState();

    checkMood();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  mood,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )
              ],
            ),
            Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width * 0.20,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Text(
                      "Assess Thyself",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Assess.routeName,
                        arguments: Questions(questions),
                      );
                    },
                    color: Colors.blue,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.80,
                  ),
                  padding: EdgeInsets.all(15),
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.20,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Text(
                      "Agenda Today",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                    color: Colors.blue,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void afterFirstLayout(BuildContext context) {
    askIfIntroExtro();
  }

  void askIfIntroExtro() {
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 300.0,
        width: 400.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'You are what?',
                style: TextStyle(color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        userType = 0;
                        setQuestions();
                      });
                    
                    },
                    child: Text(
                      'Im Introvert',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        userType = 1;
                        setQuestions();
                      });
                     
                    },
                    child: Text(
                      'Im Extrovert!',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
  }

  void checkMood() {
    if (todaysMood == 3) {
      setState(() {
        mood = "NEUTRAL";
      });
    } else if (todaysMood > 3) {
      setState(() {
        mood = "HAPPY";
      });
    } else {
      setState(() {
        mood = "SAD";
      });
    }
  }

  void setQuestions() {
    if (userType == 0) {
      for (int x = 0; x < 5; x++) {
        questions.add(_questionIntro[generateRandom.nextInt(10)]);
      }
    } else {
      for (int x = 0; x < 5; x++) {
        questions.add(_questionExtro[generateRandom.nextInt(10)]);
      }
    }
    print(questions.length);
  }
}
