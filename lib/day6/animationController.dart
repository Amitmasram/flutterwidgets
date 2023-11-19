import 'package:flutter/material.dart';

class MyAnimationPage extends StatefulWidget {
  const MyAnimationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAnimationPageState createState() => _MyAnimationPageState();
}

class _MyAnimationPageState extends State<MyAnimationPage>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Rotation Animation
    _rotationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _rotationAnimation =
        CurvedAnimation(parent: _rotationController, curve: Curves.easeInOut);

    _rotationController.addListener(() {
      setState(() {});
    });

    _rotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _rotationController.reverse(); // Reverse the rotation animation
      } else if (status == AnimationStatus.dismissed) {
        _rotationController.forward(); // Start the rotation animation
      }
    });

    _rotationController.forward();

    // Scale Animation
    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _scaleAnimation =
        CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut);

    _scaleController.addListener(() {
      setState(() {});
    });

    _scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _scaleController.reverse(); // Reverse the scale animation
      } else if (status == AnimationStatus.dismissed) {
        _scaleController.forward(); // Start the scale animation
      }
    });

    _scaleController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Animations Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Rotation Animation Value: ${_rotationAnimation.value.toStringAsFixed(2)}'),
            RotationTransition(
              turns: _rotationAnimation,
              child: FlutterLogo(size: 100),
            ),
            SizedBox(height: 20),
            Text(
                'Scale Animation Value: ${_scaleAnimation.value.toStringAsFixed(2)}'),
            ScaleTransition(
              scale: _scaleAnimation,
              child: FlutterLogo(size: 100),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _scaleController.dispose();
    super.dispose();
  }
}
