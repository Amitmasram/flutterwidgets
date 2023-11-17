import 'package:flutter/material.dart';

/// # FloatingActionButton Example
///
/// This is an example of different styles of FloatingActionButton in Flutter.
///
/// - The first [FloatingActionButton] is the default one with the default style.
/// - The second [FloatingActionButton] has a different background color.
/// - The third [FloatingActionButton] has a custom shape with rounded corners.
class FloatingActionButtonExample extends StatelessWidget {
  const FloatingActionButtonExample({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FloatingActionButton Styles'),
      ),
      body: const Center(
        child: Text('Content goes here'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Default FloatingActionButton
          FloatingActionButton(
            onPressed: () {
              // Add your onPressed logic here
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16), // Add some space between buttons

          // Customized FloatingActionButton with a different color
          FloatingActionButton(
            onPressed: () {
              // Add your onPressed logic here
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.star),
          ),
          const SizedBox(height: 16),

          // Customized FloatingActionButton with a different shape
          FloatingActionButton(
            onPressed: () {
              // Add your onPressed logic here
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Icon(Icons.check),
          ),
        ],
      ),
    );
  }
}
