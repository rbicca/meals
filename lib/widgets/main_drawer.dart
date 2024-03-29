import 'package:flutter/material.dart';
import 'package:meals/screens/filters.dart';

class MainDrawer extends StatelessWidget {

   Widget buildListTile(String title, IconData icon, Function onTapHandler) {
    return ListTile(
            leading: Icon(icon, size: 26,),
            title: Text(title, style: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 24, fontWeight: FontWeight.bold),),
            onTap: onTapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 30, left: 20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cookink Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20,),
          buildListTile('Meals', Icons.restaurant, (){ Navigator.of(context).pushReplacementNamed('/'); }),
          buildListTile('Filters', Icons.settings, (){ Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName); }), 
        ],
      ),
    );
  }

}
 

  