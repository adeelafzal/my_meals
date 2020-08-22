import 'package:flutter/material.dart';
import 'package:my_meals/models/meal.dart';
import 'package:my_meals/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  List<Meal> favoriteList;

  FavoriteScreen(this.favoriteList);

  @override
  Widget build(BuildContext context) {
    return favoriteList.isEmpty
        ? Center(
            child: Text(
            'You have no favorites yet - start adding some',
            style: TextStyle(color: Colors.black),
          ))
        : ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                favoriteList[index].id,
                favoriteList[index].title,
                favoriteList[index].imageUrl,
                favoriteList[index].duration,
                favoriteList[index].complexity,
                favoriteList[index].affordability,
                Colors.pink,
              );
            },
            itemCount: favoriteList.length,
          );
  }
}
