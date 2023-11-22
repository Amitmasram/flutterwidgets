// ignore: file_names
import 'package:flutter/material.dart';

///--- AnimatedContainer: Example ---
/*
In this example:

The _containerWidth, _containerHeight, and _containerColor properties are used to control the width, height, and color of the AnimatedContainer.
The AnimatedContainer is wrapped with a Column widget, and there's a button below it.
When you press the button, the setState method is called to update the container properties. The AnimatedContainer automatically animates these changes over the specified duration (in this case, 1 second).
*/
class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _containerWidth = 100.0;
  double _containerHeight = 100.0;
  Color _containerColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: _containerWidth,
              height: _containerHeight,
              color: _containerColor,
              child: const Center(
                child: Text(
                  'Flutter',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update the container properties to trigger the animation
                setState(() {
                  _containerWidth = 200.0;
                  _containerHeight = 200.0;
                  _containerColor = Colors.red;
                });
              },
              child: const Text('Animate Container'),
            ),
          ],
        ),
      ),
    );
  }
}
