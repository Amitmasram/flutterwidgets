import 'package:flutter/material.dart';

/// --------------------------------------------------------------
/// [ListTileWidget]
/// 
/// A Flutter widget demonstrating the use of the ListTile widget to
/// create a list with items that have a leading icon, title, and subtitle.
/// 
/// **Explanation:**
/// 
/// - The `MyList` class is a stateless widget that uses the `ListView`
///   widget to create a scrollable list of items.
/// 
/// - Each item in the list is represented by a `ListTile` widget, which
///   conveniently combines a leading icon, title, and subtitle into a
///   single row.
/// 
/// - The `leading` property of ListTile is used to set an icon at the
///   beginning of each list item.
/// 
/// - The `title` property holds the main text content for each item.
/// 
/// - The `subtitle` property holds additional text content, providing
///   more information about each list item.
/// 
/// - The `onTap` property is optional but can be used to handle taps
///   on the individual list items.
/// 
/// This example creates a simple list using ListTile widgets, each
/// representing a different topic with an icon, title, and subtitle.
/// Adjust the content and styling based on your specific use case.
/// --------------------------------------------------------------


class ListTileWidget extends StatelessWidget {
  const ListTileWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListTile Widget Example'),
        ),
        body: MyList(),
      ),
    );
  }
}

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Flutter'),
            subtitle: const Text('A UI toolkit for building natively compiled applications'),
            onTap: () {
              // Handle tile tap
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.code),
            title: const Text('Dart'),
            subtitle: const Text('A programming language optimized for building mobile, desktop, server, and web applications'),
            onTap: () {
              // Handle tile tap
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('Widgets'),
            subtitle: const Text('Reusable building blocks for constructing Flutter applications'),
            onTap: () {
              // Handle tile tap
            },
          ),
        ),
        // Add more ListTiles as needed
      ],
    );
  }
}

