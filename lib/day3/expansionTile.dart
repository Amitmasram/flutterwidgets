// ignore: file_names
import 'package:flutter/material.dart';

/// MyExpansionTileList displays a list of ExpansionTile widgets inside a Material widget.
/// In this example, a ListView.builder is used to create a list of two ExpansionTile widgets dynamically.
/// Each ExpansionTile has a title, a leading icon, a background color, and a list of children.
/// The Material widget is added as the root widget to ensure that there is a material ancestor for the ExpansionTile widgets.
class MyExpansionTileList extends StatelessWidget {
  const MyExpansionTileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      // Material is added as the root widget to provide a material ancestor.
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text('Tile ${index + 1}'),
            leading: const Icon(Icons.arrow_forward),
            backgroundColor: Colors.grey[200],
            children: <Widget>[
              ListTile(
                title: Text('Subitem ${index + 1}.1'),
              ),
              ListTile(
                title: Text('Subitem ${index + 1}.2'),
              ),
            ],
          );
        },
      ),
    );
  }
}

///
// In this example:
// - MyFruitCategories is the root widget, containing a ListView of FruitCategoryTiles.
// - FruitCategoryTile is an ExpansionTile representing a category of fruits. It takes a category name and a list of fruits.
// - FruitTile is a simple ListTile representing an individual fruit.
// This example creates a visually appealing list of fruit categories with expansion tiles.
// Feel free to customize the content and style based on your preferences!
class MyFruitCategories extends StatelessWidget {
  const MyFruitCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: const <Widget>[
          FruitCategoryTile(
            category: 'Citrus Fruits',
            fruits: ['Orange', 'Lemon', 'Lime', 'Grapefruit'],
          ),
          FruitCategoryTile(
            category: 'Berries',
            fruits: ['Strawberry', 'Blueberry', 'Raspberry', 'Blackberry'],
          ),
          FruitCategoryTile(
            category: 'Tropical Fruits',
            fruits: ['Pineapple', 'Mango', 'Banana', 'Kiwi'],
          ),
        ],
      ),
    );
  }
}

class FruitCategoryTile extends StatelessWidget {
  final String category;
  final List<String> fruits;

  const FruitCategoryTile({
    super.key,
    required this.category,
    required this.fruits,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(category),
      leading: const Icon(Icons.local_florist),
      backgroundColor: Colors.lightGreen[100],
      children: fruits.map((fruit) => FruitTile(name: fruit)).toList(),
    );
  }
}

class FruitTile extends StatelessWidget {
  final String name;

  const FruitTile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      leading: const Icon(Icons.star),
    );
  }
}
