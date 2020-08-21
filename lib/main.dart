import 'package:flutter/material.dart';
import 'package:my_meals/screens/menu_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromARGB(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromARGB(20, 51, 51, 1)),
              title: TextStyle(
                  fontSize: 16,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
              color: Colors.white))),
      home: MenuScreen()
    );
  }
}
