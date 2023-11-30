import 'package:flutter/material.dart';

class AnimatedThemeEx extends StatefulWidget {
  const AnimatedThemeEx({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedThemeExState createState() => _AnimatedThemeExState();
}

class _AnimatedThemeExState extends State<AnimatedThemeEx>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller);

    // Uncomment the line below if you want the animation to loop
    //_controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Theme Example'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (context, child) {
            return Container(
              width: 200,
              height: 200,
              color: _colorAnimation.value,
              child: const Center(
                child: Text(
                  'Hello, Flutter!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            _controller.repeat();
          }
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
