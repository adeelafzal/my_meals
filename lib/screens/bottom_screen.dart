import 'package:flutter/material.dart';
import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:my_meals/screens/categories_screen.dart';
import 'package:my_meals/screens/favorite_screen.dart';
import 'package:my_meals/widgets/drawer_screen.dart';

class BottomScreen extends StatefulWidget {
  @override
  _BottomScreenState createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {

  List<Map<String,Object>> pagesList = [
    {'page':CategoriesScreen(),'title':'Categories'},
    {'page':FavoriteScreen(),'title':'Your Favorite'},
    {'page':CategoriesScreen(),'title':'Categories'},
    {'page':FavoriteScreen(),'title':'Your Favorite'}
  ];

  int _selectedIndex = 0;

  void selectPage(int page){
    setState(() {
      _selectedIndex =page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(pagesList[_selectedIndex]['title']),
        ),
        body: pagesList[_selectedIndex]['page'],
        drawer: DraweScreen(),

        bottomNavigationBar: FlashyTabBar(
          animationCurve: Curves.linear,
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            FlashyTabBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorite'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorite'),
            ),
          ],
        ),
    );
  }
}
