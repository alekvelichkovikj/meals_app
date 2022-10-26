import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen({Key key, this.favoriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Padding(
            padding: const EdgeInsets.all(40),
            child: Center(
              child: Text(
                'You have no favorites yet - Start adding some!',
                style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : ListView.builder(
            itemBuilder: ((context, index) {
              return MealItem(
                id: favoriteMeals[index].id,
                affordability: favoriteMeals[index].affordability,
                complexity: favoriteMeals[index].complexity,
                duration: favoriteMeals[index].duration,
                imageUrl: favoriteMeals[index].imageUrl,
                title: favoriteMeals[index].title,
              );
            }),
            itemCount: favoriteMeals.length,
          );
  }
}
