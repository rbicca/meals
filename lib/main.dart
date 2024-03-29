import 'package:flutter/material.dart';
import 'package:meals/dummy-data.dart';

import './models/meals.dart';

import 'package:meals/screens/category_meals.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meal_detail.dart';
import 'package:meals/screens/tabs.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal){
        
        if(_filters['gluten'] && !meal.isGlutenFree) { return false; }
        if(_filters['lactose'] && !meal.isLactoseFree) { return false; }
        if(_filters['vegetarian'] && meal.isVegetarian) { return false; }
        if(_filters['vegan'] && meal.isVegan) { return false; }

        return true;

      }).toList();
    });
  }

  void _toggleFavorites(String mealId){
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >=0) {
      setState(() {
          _favoriteMeals.removeAt(existingIndex);
      });
      } else {
        setState(() {
          _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal)=> meal.id == mealId));
        });
    }
  }
  
  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas da Maria',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),),
          body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),),
          title: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold)
        ),
      ),
      //home: CategoriesScreen(),
      //initialRoute: '/,',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),     //mesmo que home:
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorites, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      /*
      onGenerateRoute: (settings) {
        print(settings);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        print(settings);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      */
    );
  }
}