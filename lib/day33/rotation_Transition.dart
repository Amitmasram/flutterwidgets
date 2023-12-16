import 'package:flutter/material.dart';

class RotationTransitionEx extends StatelessWidget {
  const RotationTransitionEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rotation Transition Example'),
        ),
        body: const Center(
          child: MyRotatingWidget(),
        ),
      ),
    );
  }
}

class MyRotatingWidget extends StatefulWidget {
  const MyRotatingWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyRotatingWidgetState createState() => _MyRotatingWidgetState();
}

class _MyRotatingWidgetState extends State<MyRotatingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Create an animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Create a rotation animation
    _animation = Tween<double>(begin: 0, end: 360).animate(_controller);

    // Start the animation
    _controller.repeat(); // You can also use forward() for a one-time rotation
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: const Center(
          child: Text(
            'Rotating Widget',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller when done
    super.dispose();
  }
}
