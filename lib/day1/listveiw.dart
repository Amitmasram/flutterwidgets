import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///---ListView.builder: Example ----

/*
ListView.builder:

Scenario: Imagine you have a really long list of items, 
but you don't want to load them all at once because it might be too much for the device to handle.
How it works: ListView.builder creates items on-the-fly as the user scrolls.
 It only builds the widgets that are currently visible on the screen, 
 making it memory-efficient for long lists.

*/

class MyListView extends StatelessWidget {
  final List<String> items = List.generate(50, (index) => 'Item $index');

  MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Example'),
      ),
      body: ListView.builder(
        // Properties of ListView.builder
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            // Properties of Card
            elevation: 5.0,
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: ListTile(
              // Properties of ListTile
              contentPadding: const EdgeInsets.all(10.0),
              title: Text(
                items[index],
                style: const TextStyle(fontSize: 18.0),
              ),
              subtitle: Text('Subtitle for Item $index'),
              leading: CircleAvatar(
                // Properties of CircleAvatar
                backgroundColor: Colors.blue,
                child: Text(
                  (index + 1).toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Handle item tap
                if (kDebugMode) {
                  print('Tapped on: ${items[index]}');
                }
              },
              onLongPress: () {
                // Handle long press on item
                if (kDebugMode) {
                  print('Long pressed on: ${items[index]}');
                }
              },
            ),
          );
        },
      ),
    );
  }
}

////--- ListView.custom Example:-----

// ListView.custom:

/*Scenario:-- Let's say you want more control over how your list items are laid out or you have a custom design in mind.
 How it works: --ListView.custom gives you greater flexibility. 
You use a SliverChildBuilderDelegate to determine what to display for each item. It's useful
when you need a specific layout strategy or a more customized approach.  */

class MyCustomListView extends StatelessWidget {
  final List<String> items = List.generate(50, (index) => 'Item $index');

  MyCustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom ListView Example'),
      ),
      body: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ListTile(
              title: Text(items[index]),
              onTap: () {
                if (kDebugMode) {
                  print('Tapped on: ${items[index]}');
                }
              },
            );
          },
          childCount: items.length,
        ),
      ),
    );
  }
}

///------: ListView.separated Example:------
///
/*
ListView.separated:

Scenario: Consider a situation where you have a list, 
and you want a consistent separator (like a line or a divider) between each item.
How it works: ListView.separated is designed for exactly that. 
You provide two builders—one for the items and one for the separators. 
This makes it easy to add a consistent visual break between each item in your list.

*/

class MySeparatedListView extends StatelessWidget {
  final List<String> items = List.generate(50, (index) => 'Item $index');

  MySeparatedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Separated ListView Example'),
      ),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              if (kDebugMode) {
                print('Tapped on: ${items[index]}');
              }
            },
          );
        },
      ),
    );
  }
}
