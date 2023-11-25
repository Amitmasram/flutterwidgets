// ignore: file_names
import 'package:flutter/material.dart';

class AnimatedPositionedEx extends StatefulWidget {
  const AnimatedPositionedEx({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedPositionedExState createState() => _AnimatedPositionedExState();
}

class _AnimatedPositionedExState extends State<AnimatedPositionedEx> {
  bool _isMoved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedPositioned Example'),
      ),
      body: Center(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              top: _isMoved ? 100.0 : 50.0,
              left: _isMoved ? 50.0 : 100.0,
              child: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Hello!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isMoved = !_isMoved;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
