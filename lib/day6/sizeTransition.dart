import 'package:flutter/material.dart';

class SizeTransitionApp extends StatefulWidget {
  const SizeTransitionApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SizeTransitionAppState createState() => _SizeTransitionAppState();
}

class _SizeTransitionAppState extends State<SizeTransitionApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Start the animation when the page loads
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void startSizeAnimation() {
    // Reset the animation to its initial state
    _controller.reset();
    // Start the animation when triggered
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SizeTransition Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizeTransition(
              sizeFactor: _animation,
              axis: Axis.horizontal,
              axisAlignment: -1, // Start from the beginning
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Resizing Widget',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                startSizeAnimation();
              },
              child: const Text('Start Resizing'),
            ),
          ],
        ),
      ),
    );
  }
}
