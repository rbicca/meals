import 'package:flutter/material.dart';
import 'package:meals/dummy-data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavoriteMeal;

  const MealDetailScreen(this.toggleFavorite, this.isFavoriteMeal) ;

  Widget buildSectionTitle(BuildContext ctx, String text){
    return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              style: Theme.of(ctx).textTheme.title,
            ),
          );
  }

  Widget buildContainer(Widget child){
    return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 200,
            width: 300,
            child: child
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
          title: Text(
        '${selectedMeal.title}',
      )),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context,'Ingedients' ),
            buildContainer(
              ListView.builder( 
                itemBuilder: (ctx, i) => Card(
                  color: Theme.of(ctx).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectedMeal.ingredients[i],
                    ),
                  ),
                ), 
                itemCount: selectedMeal.ingredients.length, ),
            ),
            buildSectionTitle(context,'Steps' ),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, i) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(child: Text('# ${i+1}'),),
                      title: Text(selectedMeal.steps[i]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // child: Icon(Icons.delete),
        // onPressed: () => Navigator.of(context).pop(mealId) ,
        child: Icon( isFavoriteMeal(mealId)? Icons.star : Icons.star_border ),
        onPressed: () => toggleFavorite(mealId) ,
      ),
    );
  }
}
