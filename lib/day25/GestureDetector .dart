import 'package:flutter/material.dart';

class GestureDetectorEx extends StatelessWidget {
  const GestureDetectorEx({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GestureDetector Example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            // This callback will be triggered when the user taps the widget.
            print('Tapped!');
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Tap me!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

////////////////---------------------------//////////////

class GestureDetectorEx2 extends StatelessWidget {
  const GestureDetectorEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePagex extends StatefulWidget {
  const MyHomePagex({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePagex> {
  String gestureStatus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GestureDetector Example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              gestureStatus = 'Tapped!';
            });
          },
          onDoubleTap: () {
            setState(() {
              gestureStatus = 'Double Tapped!';
            });
          },
          onLongPress: () {
            setState(() {
              gestureStatus = 'Long Pressed!';
            });
          },
          onLongPressMoveUpdate: (details) {
            setState(() {
              gestureStatus = 'Long Press Moving: ${details.globalPosition}';
            });
          },
          onVerticalDragDown: (details) {
            setState(() {
              gestureStatus = 'Vertical Drag Down: ${details.globalPosition}';
            });
          },
          onVerticalDragEnd: (details) {
            setState(() {
              gestureStatus = 'Vertical Drag Ended!';
            });
          },
          child: Transform.rotate(
            angle: 0.1,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: Center(
                child: Text(
                  gestureStatus.isEmpty ? 'Tap me!' : gestureStatus,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
