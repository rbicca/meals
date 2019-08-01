import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';

import '../dummy-data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final cateroryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return MealItem(
            id: cateroryMeals[i].id,
            title: cateroryMeals[i].title,
            imageUrl: cateroryMeals[i].imageUrl,
            duration: cateroryMeals[i].duration,
            affordability: cateroryMeals[i].affordability,
            complexity: cateroryMeals[i].complexity,
          );
        },
        itemCount: cateroryMeals.length,
      ),
    );
  }
}
