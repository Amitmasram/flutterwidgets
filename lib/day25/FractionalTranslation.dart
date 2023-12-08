import 'dart:math';

import 'package:flutter/material.dart';

class FractionalTranslationEx extends StatelessWidget {
  const FractionalTranslationEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fractional Translation Example'),
        ),
        body: Center(
          child: FractionalTranslation(
            translation: const Offset(0.2, 0.3),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Hello',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

////////////////-------------------/////////////////

class FractionalTranslationEx2 extends StatelessWidget {
  const FractionalTranslationEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic Fractional Translation'),
        ),
        body: const Center(
          child: DynamicFractionalTranslationButton(),
        ),
      ),
    );
  }
}

class DynamicFractionalTranslationButton extends StatefulWidget {
  const DynamicFractionalTranslationButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DynamicFractionalTranslationButtonState createState() =>
      _DynamicFractionalTranslationButtonState();
}

class _DynamicFractionalTranslationButtonState
    extends State<DynamicFractionalTranslationButton> {
  double translationX = 0.0;
  double translationY = 0.0;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: Offset(translationX, translationY),
      child: ElevatedButton(
        onPressed: () {
          // Generate random values for translation
          final random = Random();
          translationX =
              random.nextDouble() - 0.5; // Random value between -0.5 and 0.5
          translationY =
              random.nextDouble() - 0.5; // Random value between -0.5 and 0.5

          // Update the state to trigger a rebuild with the new translation values
          setState(() {});
        },
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Move Me!',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

//////////////////////-------------------------/////////////////

class FractionalTranslationEx3 extends StatelessWidget {
  const FractionalTranslationEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animated Fractional Translation'),
        ),
        body: const Center(
          child: AnimatedFractionalTranslationDemo(),
        ),
      ),
    );
  }
}

class AnimatedFractionalTranslationDemo extends StatefulWidget {
  const AnimatedFractionalTranslationDemo({super.key});

  @override
  _AnimatedFractionalTranslationDemoState createState() =>
      _AnimatedFractionalTranslationDemoState();
}

class _AnimatedFractionalTranslationDemoState
    extends State<AnimatedFractionalTranslationDemo> {
  double translationX = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FractionalTranslation(
          translation: Offset(translationX, 0.0),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Slide me!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Toggle between moving left and right
            setState(() {
              translationX = translationX == 0.0 ? 0.5 : 0.0;
            });
          },
          child: const Text('Toggle Slide'),
        ),
      ],
    );
  }
}
