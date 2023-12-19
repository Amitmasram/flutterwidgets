import 'dart:async';

import 'package:flutter/material.dart';

class TextButtonEx extends StatelessWidget {
  const TextButtonEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TextButton Example'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              // Handle button press
              print('TextButton pressed');
            },
            style: TextButton.styleFrom(
              primary: Colors.blue, // Text color
              backgroundColor: Colors.white, // Button background color
              textStyle: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            child: const Text('Press me'),
          ),
        ),
      ),
    );
  }
}

/////////////////////////

class TextButtonEx2 extends StatelessWidget {
  const TextButtonEx2({super.key});

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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // Uncomment the next line to start the animation automatically
    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex UI with Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated container
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  width: 200 * _animation.value,
                  height: 200 * _animation.value,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Animated Container',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            // Multiple TextButtons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle button press
                    print('Button 1 pressed');
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                    backgroundColor: Colors.white,
                  ),
                  child: const Text('Button 1'),
                ),
                const SizedBox(width: 20),
                TextButton(
                  onPressed: () {
                    // Handle button press
                    print('Button 2 pressed');
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.red,
                    backgroundColor: Colors.white,
                  ),
                  child: const Text('Button 2'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Start the animation when the FloatingActionButton is pressed
          _controller.forward();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

////////////////////////////////

class TextButtonEx4 extends StatelessWidget {
  const TextButtonEx4({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePagel(),
    );
  }
}

class MyHomePagel extends StatefulWidget {
  const MyHomePagel({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePagelState createState() => _MyHomePagelState();
}

class _MyHomePagelState extends State<MyHomePagel> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);

    // Automatic carousel animation
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex UI with Animation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated carousel
          Container(
            height: 200,
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                _buildCarouselItem('Slide 1', Colors.blue),
                _buildCarouselItem('Slide 2', Colors.green),
                _buildCarouselItem('Slide 3', Colors.orange),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // TextButtons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // Handle button press
                  print('Button 1 pressed');
                },
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                  backgroundColor: Colors.white,
                ),
                child: const Text('Button 1'),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  // Handle button press
                  print('Button 2 pressed');
                },
                style: TextButton.styleFrom(
                  primary: Colors.red,
                  backgroundColor: Colors.white,
                ),
                child: const Text('Button 2'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(String text, Color color) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
