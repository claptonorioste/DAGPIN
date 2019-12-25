import 'package:dagpin/HomePageFiles/assess.dart';
import 'package:flutter/material.dart';

import 'HomePageFiles/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => HomePage(),
       Assess.routeName: (context) => Assess()
      },
    );
  }
}
