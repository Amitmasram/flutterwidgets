import 'dart:async';

import 'package:flutter/material.dart';

class ColoredBoxEx extends StatefulWidget {
  const ColoredBoxEx({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ColoredBoxExState createState() => _ColoredBoxExState();
}

class _ColoredBoxExState extends State<ColoredBoxEx> {
  double _rotationAngle = 0.0;

  @override
  void initState() {
    super.initState();
    // Start a periodic timer to continuously rotate the logo
    Timer.periodic(const Duration(milliseconds: 16), (Timer timer) {
      setState(() {
        _rotationAngle += 0.02;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.red, Colors.blue, Colors.purple, Colors.black],
          ),
        ),
        child: Center(
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(_rotationAngle),
            child: const FlutterLogo(
              size: 150.0,
            ),
          ),
        ),
      ),
    );
  }
}
