import 'package:flutter/material.dart';

class LimitedBoxEx extends StatelessWidget {
  const LimitedBoxEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LimitedBox Example'),
        ),
        body: Center(
          child: LimitedBox(
            maxHeight: 200.0, // Maximum height for the child
            maxWidth: 200.0, // Maximum width for the child
            child: Container(
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Hello, LimitedBox!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
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

class CoolLimitedBox extends StatefulWidget {
  const CoolLimitedBox({super.key});

  @override
  _CoolLimitedBoxState createState() => _CoolLimitedBoxState();
}

class _CoolLimitedBoxState extends State<CoolLimitedBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 360).animate(_controller);

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 200.0,
      maxWidth: 200.0,
      child: AnimatedBuilder(
        animation: _rotationAnimation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _rotationAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Center(
                child: Text(
                  'Cool LimitedBox!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
