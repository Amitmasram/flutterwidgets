import 'package:flutter/material.dart';

class ScaleTransitionEx extends StatelessWidget {
  const ScaleTransitionEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Scale Transition Example'),
        ),
        body: const Center(
          child: MyScaleTransition(),
        ),
      ),
    );
  }
}

class MyScaleTransition extends StatefulWidget {
  const MyScaleTransition({super.key});

  @override
  _MyScaleTransitionState createState() => _MyScaleTransitionState();
}

class _MyScaleTransitionState extends State<MyScaleTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Create an animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Create a Tween to define the range of scaling
    Tween<double> _scaleTween = Tween<double>(begin: 1.0, end: 2.0);

    // Create a curved animation for smoother scaling
    CurvedAnimation _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Attach the Tween to the CurvedAnimation
    _scaleAnimation = _scaleTween.animate(_curvedAnimation);

    // Start the animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
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
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
