import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.star, size: 50.0, color: Colors.yellow),
            const Text(
              'Hello',
              style: TextStyle(fontSize: 24.0),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: const Text('Press Me'),
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
  const RowWidgetDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row Design Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            const CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
            const SizedBox(width: 16.0),
            // User Information
            const Column(
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
            const SizedBox(width: 16.0),
            // Action Button
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: const Text('Follow'),
            ),
          ],
        ),
      ),
    );
  }
}
