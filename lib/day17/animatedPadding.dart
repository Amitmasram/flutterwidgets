import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedPaddingEx());
}

class AnimatedPaddingEx extends StatefulWidget {
  const AnimatedPaddingEx({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedPaddingExState createState() => _AnimatedPaddingExState();
}

class _AnimatedPaddingExState extends State<AnimatedPaddingEx> {
  double _paddingValue = 16.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AnimatedPadding Example'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                // Toggle between two padding values for demonstration
                _paddingValue = (_paddingValue == 16.0) ? 32.0 : 16.0;
              });
            },
            child: AnimatedPadding(
              duration: const Duration(seconds: 1),
              padding: EdgeInsets.all(_paddingValue),
              child: Container(
                color: Colors.blue,
                width: 200,
                height: 200,
                child: const Center(
                  child: Text(
                    'Hello, AnimatedPadding!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
