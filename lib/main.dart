import 'package:flutter/material.dart';
import 'package:my_meals/screens/bottom_screen.dart';
import 'package:my_meals/screens/category_meal_screen.dart';
import 'package:my_meals/screens/meal_detail_screen.dart';
import 'package:my_meals/screens/settings_screen.dart';
import 'package:my_meals/models/meal.dart';
import 'package:my_meals/dummy_categories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> availAbleMeals;

  Map<String, bool> _filterList = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableList = DUMMY_MEALS;
  List<Meal> favoriteList = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filterList = filterData;
      availableList = DUMMY_MEALS.where((meal) {
        if (_filterList['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filterList['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filterList['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filterList['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toogleFavorite(String mealId) {
    final existIndex =
        favoriteList.indexWhere((element) => element.id == mealId);
    if (existIndex >= 0) {
      favoriteList.removeAt(existIndex);
    } else {
      setState(() {
        favoriteList
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealfavorite(String id) {
    return favoriteList.any((element) => element.id == id);
  }

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
      initialRoute: '/',
      routes: {
        '/': (context) => BottomScreen(favoriteList),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(availableList),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toogleFavorite,_isMealfavorite),
        SettingsScreen.routeName: (context) =>
            SettingsScreen(_filterList, _setFilters)
      },
    );
  }
}
