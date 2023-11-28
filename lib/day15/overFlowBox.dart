import 'package:flutter/material.dart';

class OverFlowBoxEx extends StatelessWidget {
  const OverFlowBoxEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('OverflowBox Example'),
        ),
        body: Center(
          child: OverflowBox(
            minWidth: 0.0,
            maxWidth: double.infinity,
            minHeight: 0.0,
            maxHeight: double.infinity,
            alignment: Alignment.center,
            child: Container(
              color: Colors.blue,
              width: 200.0,
              height: 300.0,
              child: const Center(
                child: Text(
                  'Hello, OverflowBox!',
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

/////-----------------------------////////////////////////
class RotatingOverflowPlanet extends StatefulWidget {
  const RotatingOverflowPlanet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RotatingOverflowPlanetState createState() => _RotatingOverflowPlanetState();
}

class _RotatingOverflowPlanetState extends State<RotatingOverflowPlanet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat(); // The planet will rotate continuously.

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      minWidth: 0.0,
      maxWidth: double.infinity,
      minHeight: 0.0,
      maxHeight: double.infinity,
      alignment: Alignment.center,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * 3.141592653589793,
            child: Image.asset(
              'assets/planet.png', // Replace with your planet image asset.
              width: 150.0,
              height: 150.0,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
