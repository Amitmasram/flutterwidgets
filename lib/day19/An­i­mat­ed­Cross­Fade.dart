import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedCrossFadeEx extends StatefulWidget {
  const AnimatedCrossFadeEx({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedCrossFadeExState createState() => _AnimatedCrossFadeExState();
}

class _AnimatedCrossFadeExState extends State<AnimatedCrossFadeEx> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AnimatedCrossFade Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedCrossFade(
                duration: const Duration(seconds: 1),
                firstChild: Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                  child: const Center(
                    child: Text('First Child'),
                  ),
                ),
                secondChild: Container(
                  width: 200,
                  height: 200,
                  color: Colors.green,
                  child: const Center(
                    child: Text('Second Child'),
                  ),
                ),
                crossFadeState: _showFirst
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showFirst = !_showFirst;
                  });
                },
                child: const Text('Toggle Child'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

////////////////------------------------////////////////

class AnimatedCrossFadeEx2 extends StatelessWidget {
  const AnimatedCrossFadeEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCoolHomePage(),
    );
  }
}

class MyCoolHomePage extends StatefulWidget {
  const MyCoolHomePage({super.key});

  @override
  _MyCoolHomePageState createState() => _MyCoolHomePageState();
}

class _MyCoolHomePageState extends State<MyCoolHomePage> {
  Color _currentColor = Colors.blue;

  void _generateRandomColor() {
    setState(() {
      _currentColor = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cool Color Generator'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: _currentColor,
          child: const Center(
            child: Text(
              'Tap below to change color!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateRandomColor,
        tooltip: 'Change Color',
        child: const Icon(Icons.color_lens),
      ),
    );
  }
}
