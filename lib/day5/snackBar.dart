import 'package:flutter/material.dart';

/*
  In this updated example:
  - The first button shows a simple SnackBar.
  - The second button shows a SnackBar with an action button ("Undo").
  - The third button shows a SnackBar with a longer duration (5 seconds).
  - The fourth button shows a SnackBar with custom styling, including a different background color, floating behavior, elevation, and a rounded shape.
*/

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SnackBar Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Show a simple SnackBar
                  const simpleSnackBar = SnackBar(
                    content: Text('Simple SnackBar'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(simpleSnackBar);
                },
                child: const Text('Show Simple SnackBar'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Show a SnackBar with an action button
                  final snackBarWithAction = SnackBar(
                    content: const Text('SnackBar with Action'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Handle undo action
                        print('Undo button pressed!');
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackBarWithAction);
                },
                child: const Text('Show SnackBar with Action'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Show a SnackBar with a longer duration
                  const longDurationSnackBar = SnackBar(
                    content: Text('SnackBar with Long Duration'),
                    duration: Duration(seconds: 5),
                  );
                  ScaffoldMessenger.of(context)
                      .showSnackBar(longDurationSnackBar);
                },
                child: const Text('Show SnackBar with Long Duration'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Show a SnackBar with custom styling
                  final styledSnackBar = SnackBar(
                    content: const Text('Styled SnackBar'),
                    backgroundColor: Colors.orange,
                    behavior: SnackBarBehavior.floating,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(styledSnackBar);
                },
                child: const Text('Show Styled SnackBar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
