import 'package:flutter/material.dart';
import 'package:meals_app/models/dummy_data.dart';

class CategoriesMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // const CategoriesMealsScreen({
  //   Key key,
  //   @required this.categoryId,
  //   @required this.categoryTitle,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where(
      (meal) {
        return meal.categories.contains(categoryId);
      },
    ).toList();
    // print(categoryId);
    return Scaffold(
        appBar: AppBar(
          title: Text(routeArgs['title']),
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return Text(categoryMeals[index].title);
          }),
          itemCount: categoryMeals.length,
        ));
  }
}
