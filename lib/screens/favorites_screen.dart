import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('Your favorite list is empty'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, i) {
          return MealItem(
            title: favoriteMeals[i].title,
            id: favoriteMeals[i].id,
            affordability: favoriteMeals[i].affordability,
            complexity: favoriteMeals[i].complexity,
            duration: favoriteMeals[i].duration,
            imgUrl: favoriteMeals[i].imageUrl,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
