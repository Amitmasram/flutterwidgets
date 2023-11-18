import 'package:flutter/material.dart';

/// In this example:
/// - We create a [Container] widget with a fixed width and height.
/// - The [decoration] property is set to a [BoxDecoration], where we set the background color to blue,
///   border radius to 10, border color to black with a width of 2.0, and a box shadow for a subtle effect.
/// - Inside the container, there's a [Text] widget centered, displaying the text 'Hello, BoxDecoration!'
///   with a white color and bold font weight.

class BoxDecorationPage extends StatelessWidget {
  const BoxDecorationPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BoxDecoration Example'),
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue, // Set the background color
              borderRadius: BorderRadius.circular(10), // Set border radius
              border: Border.all(
                color: Colors.black, // Set border color
                width: 2.0, // Set border width
              ),
              boxShadow: [
                const BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Hello, BoxDecoration!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
