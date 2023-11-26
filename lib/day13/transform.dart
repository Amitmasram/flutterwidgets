import 'package:flutter/material.dart';

class TransformEx extends StatelessWidget {
  const TransformEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Transform Widget Example'),
        ),
        body: Center(
          child: Transform(
            // You can apply various transformations here
            transform: Matrix4.rotationZ(0.2),
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Transformed Text',
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

///////////////////

class TransformCoolEx extends StatelessWidget {
  const TransformCoolEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Cool Animation Example'),
        ),
        body: const Center(
          child: AnimatedCoolWidget(),
        ),
      ),
    );
  }
}

class AnimatedCoolWidget extends StatefulWidget {
  const AnimatedCoolWidget({super.key});

  @override
  _AnimatedCoolWidgetState createState() => _AnimatedCoolWidgetState();
}

class _AnimatedCoolWidgetState extends State<AnimatedCoolWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(); // Repeat the animation indefinitely

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * 3.141, // 2 * pi radians is a full rotation
    ).animate(_controller);

    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 2,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.rotationZ(_rotationAnimation.value)
            ..scale(_scaleAnimation.value),
          child: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Cool Animation',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
