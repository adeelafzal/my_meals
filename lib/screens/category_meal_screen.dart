import 'package:flutter/material.dart';
import 'package:my_meals/dummy_categories.dart';
import 'package:my_meals/models/meal.dart';
import 'package:my_meals/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  List<Meal> availAbleMeals;
  CategoryMealScreen(this.availAbleMeals);

static const routeName = 'CategoryMealScreen';

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  List<Meal> displayMeal;
  bool loadInitData = false;
  String categoryTitle;
  Color color;
  void onRemove(String mealId){
    setState(() {
      displayMeal.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    if(!loadInitData){
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
      final id = routeArgs['id'];
      categoryTitle  =routeArgs['title'];
//      final routeColorArgs = ModalRoute.of(context).settings.arguments as Color;
//      color =routeColorArgs;
      displayMeal = widget.availAbleMeals.where((element) {
        return element.categories.contains(id);
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
        backgroundColor: Colors.pink,
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(displayMeal[index].id,displayMeal[index].title, displayMeal[index].imageUrl, displayMeal[index].duration, displayMeal[index].complexity,
                displayMeal[index].affordability,Colors.pink);
          },
          itemCount: displayMeal.length,
        ),
      ),
    );
  }


}
