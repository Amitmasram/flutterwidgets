import 'package:flutter/material.dart';


/*
*-The Scaffold widget provides the overall structure of the screen.
*-The AppBar is set as the appBar property of the Scaffold.
*-The title property of the AppBar is set to a Text widget displaying the app title.
*-The leading property is set to an IconButton with the menu icon.
*-The actions property is set to a list of IconButton widgets with search and settings icons.
*-The body property of the Scaffold contains the main content of the screen.
*-----You can further customize the AppBar based on your app's design requirements,
 including adjusting colors, adding additional actions, or using a custom title widget

*/



class Appbarwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Handle menu button press
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to My App!'),
      ),
    );
  }
}
