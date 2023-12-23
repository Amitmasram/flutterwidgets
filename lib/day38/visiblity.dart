import 'package:flutter/material.dart';

class VisibilityEx extends StatelessWidget {
  const VisibilityEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Visibility Widget Example'),
        ),
        body: const Center(
          child: Visibility(
            visible: true, // Set this to true or false based on your condition
            child: Text(
              'This text is visible!',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

////////////////////////////////

class VisibilityEx2 extends StatelessWidget {
  const VisibilityEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPanelVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visibility Widget Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                isPanelVisible = !isPanelVisible;
              });
            },
            child: const Text('Toggle Panel'),
          ),
          Visibility(
            visible: isPanelVisible,
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: isPanelVisible ? 1.0 : 0.0,
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sliding Panel',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'This is a cool and beautiful complex UI with animation.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//////////////////////////////////////

class VisiblityEx3 extends StatelessWidget {
  const VisiblityEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreenf(),
    );
  }
}

class HomeScreenf extends StatefulWidget {
  const HomeScreenf({super.key});

  @override
  _HomeScreenfState createState() => _HomeScreenfState();
}

class _HomeScreenfState extends State<HomeScreenf>
    with SingleTickerProviderStateMixin {
  bool isCardVisible = false;
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _rotateAnimation =
        Tween<double>(begin: 0, end: 0.5).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleCardVisibility() {
    setState(() {
      isCardVisible = !isCardVisible;
      if (isCardVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex UI with Visibility and Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _toggleCardVisibility,
              child: const Text('Toggle Card'),
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: isCardVisible,
              child: AnimatedBuilder(
                animation: _rotateAnimation,
                builder: (context, child) {
                  return Transform(
                    transform: Matrix4.rotationY(_rotateAnimation.value * 3.14),
                    child: Container(
                      width: 200,
                      height: 150,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: 50,
                            color: Colors.yellow,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Rotating Card',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
