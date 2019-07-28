import 'package:flutter/material.dart';

import '../widgets/category_item.dart';

import '../dummy-data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Receitas da Maria'),),
      body: GridView(
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(
                  catData.title,
                  catData.color,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}