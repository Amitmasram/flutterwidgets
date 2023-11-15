import 'package:flutter/material.dart';

/// --------------------------------------------------------------
/// [StackExample]
/// 
/// A Flutter widget demonstrating the use of the Stack widget to
/// overlay widgets on top of each other.
/// 
/// **Explanation:**
/// 
/// - The `Stack` widget is used to overlay its children. The `alignment`
///   property is set to `Alignment.center` to align the children at the
///   center of the stack.
/// 
/// - The first child is an `Image` widget, serving as a background image.
///   Replace the URL with the actual URL of your background image.
/// 
/// - The second child is a `Text` widget, positioned at the top of the stack,
///   serving as overlay text.
/// 
/// - The third child is an `ElevatedButton`, positioned at the bottom of the
///   stack, serving as an overlay button.
/// 
/// This example creates a stack of widgets with a background image, overlay text,
/// and an overlay button. The `Stack` widget is useful for creating complex layouts
/// where elements need to be overlaid on top of each other. Adjust the positions and
/// properties as needed for your specific use case.
/// --------------------------------------------------------------
class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        // Background Image
        Image.network(
          'https://thewatchdogonline.com/wp-content/uploads/2021/01/image.jpeg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        
        // Overlay Text
        const Positioned(
          top: 50.0,
          child: Text(
            'Overlay Text',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Overlay Button
        Positioned(
          bottom: 50.0,
          child: ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            child: Text('Click Me'),
          ),
        ),
      ],
    );
  }
}
