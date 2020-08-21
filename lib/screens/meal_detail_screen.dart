import 'package:flutter/material.dart';
import 'package:my_meals/dummy_categories.dart';
import 'package:my_meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final String id;
  final Color color;

  MealDetailScreen(this.id, this.color);

  Widget buildSectionTitle(String title, BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.title,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealDetail = DUMMY_MEALS.firstWhere((element) => element.id == id);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: color,
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(mealDetail.title,
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  background: Image.network(
                    mealDetail.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                buildSectionTitle('Ingredients', context),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: color, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        margin:
                            EdgeInsets.only(bottom: 12, left: 20, right: 20),
                        elevation: 4,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            mealDetail.ingredients[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ));
                  },
                  itemCount: mealDetail.ingredients.length,
                ),
                buildSectionTitle('Steps', context),
                Card(
                  margin: EdgeInsets.all(20),
                  elevation: 4,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: color, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: color,
                              radius: 20,
                              child: Text(
                                '# ${(index + 1)}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(mealDetail.steps[index]),
                          ),
                          Divider(),
                        ],
                      );
                    },
                    itemCount: mealDetail.steps.length,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop(id);
          },
          backgroundColor: color,
          child: Icon(Icons.delete,
          color: Colors.white,),
        ),
      ),
    );
  }
}
