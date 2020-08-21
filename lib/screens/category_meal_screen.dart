import 'package:flutter/material.dart';
import 'package:my_meals/dummy_categories.dart';
import 'package:my_meals/models/meal.dart';
import 'package:my_meals/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  final String title, id;
  final Color color;
  String categoryTitle;


  CategoryMealScreen(this.id, this.title, this.color);



  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  List<Meal> displayMeal;
  bool loadInitData = false;

  void onRemove(String mealId){
    setState(() {
      displayMeal.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void initState() {

  }

  @override
  void didChangeDependencies() {
    if(!loadInitData){
      displayMeal = DUMMY_MEALS.where((element) {
        return element.categories.contains(widget.id);
      }).toList();
      loadInitData= true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(displayMeal[index].id,displayMeal[index].title, displayMeal[index].imageUrl, displayMeal[index].duration, displayMeal[index].complexity,
                displayMeal[index].affordability,widget.color,onRemove);
          },
          itemCount: displayMeal.length,
        ),
      ),
    );
  }


}
