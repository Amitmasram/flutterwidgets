import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class BackDropFilterEx extends StatelessWidget {
  const BackDropFilterEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Backdrop Filter Example'),
        ),
        body: Center(
          child: Stack(
            children: [
              // Background image
              Image.network(
                'https://example.com/background_image.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              // BackdropFilter with blur effect
              BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.transparent,
                  // Your content goes here
                  child: const Center(
                    child: Text(
                      'Hello, BackdropFilter!',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
