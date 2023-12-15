import 'package:flutter/material.dart';

class RoatedBoxEx extends StatelessWidget {
  const RoatedBoxEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rotated Box Example'),
        ),
        body: Center(
          child: RotatedBox(
            quarterTurns:
                3, // You can change the number of quarter turns (90-degree increments)
            child: Container(
              width: 100.0,
              height: 50.0,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Hello, Rotated Box!',
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
