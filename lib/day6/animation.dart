import 'package:flutter/material.dart';

class MyAnimationExample extends StatefulWidget {
  const MyAnimationExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAnimationPageState createState() => _MyAnimationPageState();
}

class _MyAnimationPageState extends State<MyAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Create an AnimationController with a duration of 3 seconds
    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 3),
    );

    // Create a size Tween that goes from 100.0 to 200.0
    var sizeTween = Tween<double>(begin: 100.0, end: 200.0);
    _sizeAnimation = sizeTween.animate(_controller);

    // Create a color Tween that changes from red to green
    var colorTween = ColorTween(begin: Colors.red, end: Colors.green);
    _colorAnimation = colorTween.animate(_controller);

    // Create an opacity Tween that goes from 1.0 to 0.0
    var opacityTween = Tween<double>(begin: 1.0, end: 0.0);
    _opacityAnimation = opacityTween.animate(_controller);

    // Start the animations
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Animations Example'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              width: _sizeAnimation.value,
              height: _sizeAnimation.value,
              color: _colorAnimation.value,
              child: Center(
                child: Opacity(
                  opacity: _opacityAnimation.value,
                  child: Text(
                    'Size: ${_sizeAnimation.value.toStringAsFixed(2)}\n'
                    'Color: ${_colorAnimation.value.toString()}\n'
                    'Opacity: ${_opacityAnimation.value.toStringAsFixed(2)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }
}
