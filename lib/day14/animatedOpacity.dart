import 'package:flutter/material.dart';

class AnimatedOpacityEx extends StatefulWidget {
  const AnimatedOpacityEx({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedOpacityExState createState() => _AnimatedOpacityExState();
}

class _AnimatedOpacityExState extends State<AnimatedOpacityEx> {
  bool _isVisible = true;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedOpacity Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              // Duration of the opacity animation.
              duration: const Duration(seconds: 1),

              // The target opacity. The opacity is 1.0 (fully opaque) by default.
              opacity: _isVisible ? 1.0 : 0.0,

              // Curve for the opacity animation. You can use Curves class for predefined curves.
              curve: Curves.easeInOut,

              // Optional: The callback that is called when the widget is rebuilt with a new opacity value.
              // This can be useful for triggering actions when the animation completes.
              onEnd: () {
                print('Animation completed!');
              },

              // Optional: The child widget whose opacity will be animated.
              child: Container(
                width: 200.0,
                height: 200.0,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Hello, Flutter!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _toggleVisibility,
              child: const Text('Toggle Visibility'),
            ),
          ],
        ),
      ),
    );
  }
}
