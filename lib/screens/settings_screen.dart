import 'package:flutter/material.dart';
import 'package:my_meals/widgets/drawer_screen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: DraweScreen(),
      body: Text('This is Settings Screen',
        style: TextStyle(
            color: Colors.black
        ),),
    );
  }
}
