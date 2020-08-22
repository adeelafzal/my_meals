import 'package:flutter/material.dart';
import 'package:my_meals/dummy_categories.dart';
import 'package:my_meals/models/meal.dart';
import 'package:my_meals/widgets/category_item.dart';
import 'package:my_meals/widgets/meal_item.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: GridView(
          padding: EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children:
              DUMMY_CATEGORIES.map((e) => CategoryItem(e.id,e.title, e.color)).toList(),
        ),
    );
  }
}
