import 'package:flutter/material.dart';

class PositionedEx extends StatelessWidget {
  const PositionedEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Positioned Widget Example'),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 50.0,
              left: 20.0,
              child: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Positioned Widget Example',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20.0,
              right: 20.0,
              child: Container(
                width: 150.0,
                height: 150.0,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/////-------------------Positioned.direction

class PositionedFromREctEx extends StatelessWidget {
  const PositionedFromREctEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Positioned.fromRect Example')),
        body: Stack(
          children: [
            Positioned.fromRect(
              rect:
                  Rect.fromPoints(const Offset(50, 50), const Offset(250, 250)),
              child: Container(
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Positioned.fromRect Example',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///////////-----------------------------------///////////////////
///
class PositionedFillEx extends StatelessWidget {
  const PositionedFillEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Positioned.fill Example')),
        body: Stack(
          children: [
            // Other widgets in the stack
            Positioned.fill(
              child: Container(
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'This widget takes up the entire space of the Stack.',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
