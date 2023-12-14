import 'package:flutter/material.dart';

class PositionedTransitionEx extends StatefulWidget {
  const PositionedTransitionEx({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PositionedTransitionExState createState() => _PositionedTransitionExState();
}

class _PositionedTransitionExState extends State<PositionedTransitionEx>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<RelativeRect> _positionAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _positionAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
      end: const RelativeRect.fromLTRB(100.0, 100.0, 0.0, 0.0),
    ).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PositionedTransition Example'),
        ),
        body: Stack(
          children: <Widget>[
            // Other widgets...
            PositionedTransition(
              rect: _positionAnimation,
              child: Container(
                color: Colors.blue,
                width: 100.0,
                height: 100.0,
              ),
            ),
          ],
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
