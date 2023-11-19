import 'package:flutter/material.dart';

class AnimatedBuilderApp extends StatefulWidget {
  const AnimatedBuilderApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedBuilderAppState createState() => _AnimatedBuilderAppState();
}

class _AnimatedBuilderAppState extends State<AnimatedBuilderApp>
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

  void startAnimation() {
    // Reset the animation to its initial state
    _controller.reset();
    // Start the animation when triggered
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedBuilder Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return Opacity(
                  opacity: _animation.value,
                  child: Container(
                    width: 200 *
                        _animation
                            .value, // Change width based on animation value
                    height: 200 *
                        _animation
                            .value, // Change height based on animation value
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Hello amit how are you today',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                startAnimation();
              },
              child: const Text('Start Animation'),
            ),
          ],
        ),
      ),
    );
  }
}
