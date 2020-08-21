import 'package:flutter/material.dart';
import 'package:my_meals/screens/bottom_screen.dart';
import 'package:my_meals/screens/settings_screen.dart';

class DraweScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.pink,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Center(
                child: Container(
                  height: 100,
                  child: Image.network(
                      'https://lh3.googleusercontent.com/proxy/1XOmvoCUbuGxPf04eVEphP1QdS8PV2yKpXXcEw73_5eIrUz4p5t7Wgog_Pt47vk9n9YHNOOOhJ2mic3uqXzQyFzg9gSb4iOGW-rgn9KKlRdKScjF2g'),
                ),
              ),
              SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    'DeliMeals',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              DrawerMenu(title: 'Meals',icon: Icons.fastfood, onClick: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
                  return BottomScreen();
                }));
              },),
              Divider(
                color: Colors.white,
              ),
              DrawerMenu(title: 'Settings',icon: Icons.settings, onClick: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
                  return SettingsScreen();
                }));
              },),
              Divider(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {

  final String title;
  final IconData icon;
  final Function onClick;

  DrawerMenu({@required this.title,@required this.icon,@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,
        size: 26,
        color: Colors.white,),
      title: Text(title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 24
        ),),
      onTap: onClick,
    );
  }
}
