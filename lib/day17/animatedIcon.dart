import 'package:flutter/material.dart';

class AnimatedIconEx extends StatefulWidget {
  const AnimatedIconEx({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedIconExState createState() => _AnimatedIconExState();
}

class _AnimatedIconExState extends State<AnimatedIconEx>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late AnimatedIconData _animatedIcon = AnimatedIcons.menu_arrow;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // You can add more listeners, like for example, to change the icon after completing the animation.
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _animatedIcon = AnimatedIcons.play_pause;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          _animatedIcon = AnimatedIcons.menu_arrow;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedIcon Example'),
      ),
      body: Center(
        child: AnimatedIcon(
          icon: _animatedIcon,
          progress: _controller,
          size: 50.0,
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
