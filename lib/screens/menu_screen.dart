import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_meals/screens/tabs_screen.dart';
import 'package:my_meals/screens/bottom_screen.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
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
                  fontWeight: FontWeight.bold))),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                    height: 150,
                    child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRwYmRxanUlq2KwnIeChq7BAU1d45zOLBS6UA&usqp=CAU')),
              ),
              SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    'DeliMeals',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              Center(
                child: OptionCard(
                  onPress: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return TabsScreen();
                      }));
                    });
                  },
                  title: 'TabBar View',
                  imageUrl: 'https://i.imgur.com/1fgC3yv.png',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: OptionCard(
                    onPress: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return BottomScreen();
                        }));
                      });
                    },
                    title: 'BottomNvigationBar View',
                    imageUrl: 'https://i.stack.imgur.com/LHvbI.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final String title;
  final Function onPress;
  final String imageUrl;

  OptionCard(
      {@required this.title, @required this.onPress, @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 250,
        height: 200,
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.pink, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(imageUrl),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
