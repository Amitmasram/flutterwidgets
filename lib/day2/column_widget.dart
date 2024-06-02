import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Column Widget Example'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Widget 1'),
              Text('Widget 2'),
              Text('Widget 3'),
            ],
          ),
        ),
      ),
    );
  }
}

/// --------------------------------------------------------------
/// [ParallaxBackgroundtwo]
///
/// A Flutter widget demonstrating a captivating parallax effect
/// with an overlaying text on a cool background image.
///
/// **Explanation:**
///
/// - **Image.network:** Loads an image from a provided URL.
///   Replace the URL with the actual link to your captivating
///   background image.
///
/// - **Stack:** A powerful widget that enables the overlaying
///   of multiple children on the screen, creating visually
///   stunning effects.
///
/// - **Background Image:** Positioned at the bottom of the stack,
///   covering the entire screen. The `fit: BoxFit.cover` property
///   ensures the image spans the screen, and `height: double.infinity,
///   width: double.infinity` makes it occupy the full height and width.
///
/// - **Content Overlay:** Centered within the stack, containing
///   a stylish text widget. This text is overlaid on top of the
///   background image, creating a visually appealing effect.
///
/// This example achieves a parallax effect as the background image
/// remains fixed while the overlay scrolls, resulting in a cool
/// and engaging user interface. Remember to replace the image URL
/// with your own captivating background image.
/// --------------------------------------------------------------
class ParallaxBackgroundColumn extends StatelessWidget {
  const ParallaxBackgroundColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Background image
        Image.network(
          'https://thewatchdogonline.com/wp-content/uploads/2021/01/image.jpeg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),

        // Content overlay
        const Center(
          child: Text(
            'Cool Parallax Effect!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

//// ----2

class ParallaxBackgroundtwo extends StatelessWidget {
  const ParallaxBackgroundtwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Background image
        Image.network(
          'https://thewatchdogonline.com/wp-content/uploads/2021/01/image.jpeg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),

        // Content overlay
        const Center(
          child: Text(
            'Cool Parallax Effect!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Interactive button
        Positioned(
          bottom: 16.0,
          left: 16.0,
          right: 16.0,
          child: ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            style: ElevatedButton.styleFrom(
              // ignore: deprecated_member_use
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Press Me!',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
