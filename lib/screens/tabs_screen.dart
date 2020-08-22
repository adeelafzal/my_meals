import 'package:flutter/material.dart';
import 'package:my_meals/screens/categories_screen.dart';
import 'package:my_meals/screens/favorite_screen.dart';
import 'package:my_meals/widgets/drawer_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}


class _TabsScreenState extends State<TabsScreen> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('DeliMeals'),
            bottom:TabBar(tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favorites',
              ),
            ],),
          ),
          drawer: DraweScreen(),
          body: TabBarView(children: <Widget>[
//            CategoriesScreen(), FavoriteScreen()
          ],

          ),),
    );
  }
}
