import 'package:flutter/material.dart';

/*
In this example:

*--The Scaffold widget is used as the top-level container.
*--The appBar property is set to an AppBar widget with a title.
*--The body property contains the main content of the app (in this case, just a Text widget).
*--The floatingActionButton property is set to a FloatingActionButton widget, which typically triggers a primary action.
*--The bottomNavigationBar property is set to a BottomNavigationBar widget, providing navigation options at the bottom of the screen.
*----This is a basic example, and you can further customize the Scaffold based on your specific app design and functionality requirements.



*/

class Scaffoldwidget extends StatelessWidget {
  const Scaffoldwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: const Center(
        child: Text('Welcome to My App!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the press of the floating action button
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
