import 'package:flutter/material.dart';

class ClipRectEx extends StatelessWidget {
  const ClipRectEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ClipRect Example'),
        ),
        body: const Center(
          child: ClippedContent(),
        ),
      ),
    );
  }
}

class ClippedContent extends StatelessWidget {
  const ClippedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipBehavior: Clip.hardEdge, // Specify the clipping behavior
      child: Container(
        width: 300.0,
        height: 300.0,
        color: Colors.blue,
        child: const Center(
          child: Text(
            'Clipped Content',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
