import 'package:flutter/material.dart';

class AnimatedModalBarierEx extends StatelessWidget {
  const AnimatedModalBarierEx({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation =
        Tween<double>(begin: 0.0, end: 0.7).animate(_animationController);

    // Uncomment the line below if you want the barrier to start with opacity 0
    // _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showModal() {
    _animationController.forward();
  }

  void _hideModal() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Modal Barrier'),
      ),
      body: Stack(
        children: [
          // Your main content goes here
          const Center(
            child: Text('Main Content'),
          ),
          // Modal Barrier with animation
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return IgnorePointer(
                // Use IgnorePointer to block user interactions
                ignoring:
                    _animationController.status == AnimationStatus.reverse,
                child: Opacity(
                  opacity: _animation.value,
                  child: const ModalBarrier(
                    color: Colors.black, // You can customize the color
                    dismissible:
                        false, // Set to true if you want to allow dismissal on tap
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _hideModal();
        },
        child: const Icon(Icons.close),
      ),
    );
  }
}
