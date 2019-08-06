import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Container(
        child: Text('Favorites'),
      );
    } else {
      return  ListView.builder(
        itemBuilder: (ctx, i) {
          return MealItem(
            id: favoriteMeals[i].id,
            title: favoriteMeals[i].title,
            imageUrl: favoriteMeals[i].imageUrl,
            duration: favoriteMeals[i].duration,
            affordability: favoriteMeals[i].affordability,
            complexity: favoriteMeals[i].complexity,
            removeItem: null,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
