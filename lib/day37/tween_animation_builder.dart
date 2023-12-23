import 'dart:math';

import 'package:flutter/material.dart';

class TweenAnimationEx extends StatelessWidget {
  const TweenAnimationEx({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyAnimationWidget(),
    );
  }
}

class MyAnimationWidget extends StatefulWidget {
  const MyAnimationWidget({super.key});

  @override
  _MyAnimationWidgetState createState() => _MyAnimationWidgetState();
}

class _MyAnimationWidgetState extends State<MyAnimationWidget> {
  double _animationValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TweenAnimationBuilder Example'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(seconds: 2),
          tween: Tween<double>(begin: 0.0, end: 1.0),
          builder: (BuildContext context, double value, Widget? child) {
            _animationValue = value;
            return Container(
              width: 200.0,
              height: 200.0,
              color: Colors.blue.withOpacity(_animationValue),
              child: Center(
                child: Text(
                  'Hello Flutter!',
                  style: TextStyle(
                    fontSize: 20.0 + (_animationValue * 10),
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

////////////////////////////

class TweenAnimationEx2 extends StatelessWidget {
  const TweenAnimationEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyAnimationWidgets(),
    );
  }
}

class MyAnimationWidgets extends StatefulWidget {
  const MyAnimationWidgets({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAnimationWidgetsState createState() => _MyAnimationWidgetsState();
}

class _MyAnimationWidgetsState extends State<MyAnimationWidgets> {
  double _rotationValue = 0.0;
  double _fadeValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex TweenAnimationBuilder Example'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(seconds: 3),
          tween: Tween<double>(begin: 0.0, end: 1.0),
          builder: (BuildContext context, double value, Widget? child) {
            _rotationValue = 2 * pi * value;
            _fadeValue = value;
            return Transform(
              transform: Matrix4.rotationY(_rotationValue),
              child: Container(
                width: 200.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: _fadeValue,
                      child: const Text(
                        'Hello',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Opacity(
                      opacity: 1 - _fadeValue,
                      child: const Text(
                        'Flutter',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

//////////////////////////////////////

class TweenAnimationEx3 extends StatelessWidget {
  const TweenAnimationEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyAnimationWidgetr(),
    );
  }
}

class MyAnimationWidgetr extends StatefulWidget {
  const MyAnimationWidgetr({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAnimationWidgetrState createState() => _MyAnimationWidgetrState();
}

class _MyAnimationWidgetrState extends State<MyAnimationWidgetr>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  double _rotationValue = 0.0;
  late AnimationController _colorController;
  Color _currentColor = Colors.red;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _colorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _colorController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _colorController.forward();
        }
      });

    _colorController.addListener(() {
      setState(() {
        _currentColor =
            Color.lerp(Colors.red, Colors.blue, _colorController.value)
                as Color;
      });
    });

    _colorController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex TweenAnimationBuilder Example'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _rotationController,
          builder: (BuildContext context, Widget? child) {
            _rotationValue = _rotationController.value * 2 * pi;
            return TweenAnimationBuilder(
              duration: const Duration(seconds: 2),
              tween: Tween<double>(begin: 0.0, end: 1.0),
              builder: (BuildContext context, double value, Widget? child) {
                final rotation = Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateX(_rotationValue * value)
                  ..rotateY(_rotationValue * value);

                return Transform(
                  transform: rotation,
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: _currentColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Flutter',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _colorController.dispose();
    super.dispose();
  }
}

////////////////////////////////////////////////////////

class TweenAnimationEx4 extends StatelessWidget {
  const TweenAnimationEx4({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWeatherAnimation(),
    );
  }
}

class MyWeatherAnimation extends StatefulWidget {
  const MyWeatherAnimation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyWeatherAnimationState createState() => _MyWeatherAnimationState();
}

class _MyWeatherAnimationState extends State<MyWeatherAnimation>
    with TickerProviderStateMixin {
  late AnimationController _backgroundController;
  late AnimationController _raindropController;
  late Animation<double> _raindropPosition;

  @override
  void initState() {
    super.initState();

    _backgroundController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);

    _raindropController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _raindropController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _raindropController.forward();
        }
      });

    _raindropPosition = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_raindropController);

    _backgroundController.forward();
    _raindropController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Animation'),
      ),
      body: TweenAnimationBuilder<Color>(
        duration: const Duration(seconds: 6),
        tween: Tween<Color>(
          begin: Colors.blue,
          end: Colors.indigo,
        ),
        builder: (BuildContext context, Color color, Widget? child) {
          return Container(
            color: color,
            child: Center(
              child: AnimatedBuilder(
                animation: _raindropPosition,
                builder: (context, child) {
                  return Positioned(
                    top: MediaQuery.of(context).size.height * 0.7 -
                        _raindropPosition.value * 100,
                    left: MediaQuery.of(context).size.width * 0.5,
                    child: const Icon(
                      Icons.water_drop,
                      size: 50.0,
                      color: Colors.lightBlueAccent,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _backgroundController.dispose();
    _raindropController.dispose();
    super.dispose();
  }
}

//////////////////////////////

class TweenAnimationEx5 extends StatelessWidget {
  const TweenAnimationEx5({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCarouselAnimation(),
    );
  }
}

class MyCarouselAnimation extends StatefulWidget {
  const MyCarouselAnimation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyCarouselAnimationState createState() => _MyCarouselAnimationState();
}

class _MyCarouselAnimationState extends State<MyCarouselAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  // ignore: unused_field
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel Animation'),
      ),
      body: Center(
        child: Container(
          width: 300.0,
          height: 200.0,
          child: TweenAnimationBuilder(
            duration: const Duration(seconds: 5),
            tween: Tween<double>(begin: 0, end: 1),
            builder: (BuildContext context, double value, Widget? child) {
              final double angle = value * 2 * pi;
              final double scale = (value * 0.5) + 0.5;

              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // perspective
                  ..rotateY(angle)
                  ..scale(scale),
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 40.0,
                          color: Colors.amber,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Card $value',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
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

////////////////////////////////

class TweenAnimationEx6 extends StatelessWidget {
  const TweenAnimationEx6({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyComplexAnimation(),
    );
  }
}

class MyComplexAnimation extends StatefulWidget {
  const MyComplexAnimation({super.key});

  @override
  _MyComplexAnimationState createState() => _MyComplexAnimationState();
}

class _MyComplexAnimationState extends State<MyComplexAnimation>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _scaleController;
  late AnimationController _colorController;

  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _colorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _rotationAnimation =
        Tween<double>(begin: 0, end: 2 * pi).animate(_rotationController);

    _scaleAnimation =
        Tween<double>(begin: 1, end: 0.5).animate(_scaleController);

    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue)
        .animate(_colorController);

    _scaleController.forward();
    _colorController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex Animation'),
      ),
      body: Center(
        child: TweenAnimationBuilder<double>(
          duration: const Duration(seconds: 5),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (BuildContext context, double value, Widget? child) {
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // perspective
                ..rotateX(value * _rotationAnimation.value)
                ..rotateY(value * _rotationAnimation.value)
                ..scale(value * _scaleAnimation.value),
              child: Container(
                width: 200.0,
                height: 200.0,
                color: _colorAnimation.value,
                child: const Center(
                  child: Text(
                    'Flutter',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
    _rotationController.dispose();
    _scaleController.dispose();
    _colorController.dispose();
    super.dispose();
  }
}
