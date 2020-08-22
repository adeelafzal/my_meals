import 'package:flutter/material.dart';
import 'package:my_meals/models/meal.dart';
import 'package:my_meals/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title, id;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void nextScreen(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealScreen.routeName, arguments: {
      'id': id,
      'title': title
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        nextScreen(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Text(title, style: Theme.of(context).textTheme.title),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            color.withOpacity(0.7),
            color,
          ], begin: Alignment.topRight, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
