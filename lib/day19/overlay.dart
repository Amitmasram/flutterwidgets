import 'package:flutter/material.dart';

class OverLayEx extends StatelessWidget {
  const OverLayEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 100.0,
      left: 50.0,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.blue,
          child: Text('This is an overlay'),
        ),
      ),
    ),
  );

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overlay Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Overlay.of(context).insert(overlayEntry);
          },
          child: Text('Show Overlay'),
        ),
      ),
    );
  }
}
