import 'package:flutter/material.dart';


class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.star, size: 50.0, color: Colors.yellow),
            Text(
              'Hello',
              style: TextStyle(fontSize: 24.0),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: Text('Press Me'),
            ),
          ],
        ),
      ),
    );
  }
}




///----- Row Basic Design with widget

/*
In this design:

The first section is a CircleAvatar representing the user's avatar.
The second section is a Column containing the user's name and role.
The third section is an ElevatedButton for an action (e.g., Follow).

*/

class RowWidgetDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row Design Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
            SizedBox(width: 16.0),
            // User Information
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Flutter Enthusiast',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(width: 16.0),
            // Action Button
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: Text('Follow'),
            ),
          ],
        ),
      ),
    );
  }
}
