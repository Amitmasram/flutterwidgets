import 'dart:math';

import 'package:flutter/material.dart';

class DragTargetEx extends StatelessWidget {
  const DragTargetEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Drag and Drop Example'),
        ),
        body: const MyDragAndDropWidget(),
      ),
    );
  }
}

class MyDragAndDropWidget extends StatelessWidget {
  const MyDragAndDropWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Draggable(
          data: "Hello",
          // ignore: sort_child_properties_last
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: const Center(child: Text("Drag me")),
          ),
          feedback: Container(
            width: 100,
            height: 100,
            color: Colors.blue.withOpacity(0.5),
            child: const Center(child: Text("Dragging")),
          ),
          childWhenDragging: Container(), // Empty container when dragging.
        ),
        const SizedBox(height: 20),
        DragTarget(
          builder: (context, candidateData, rejectedData) {
            return Container(
              width: 150,
              height: 150,
              color: Colors.red,
              child: const Center(child: Text("Drop here")),
            );
          },
          onWillAccept: (data) {
            return true; // Accept all types of data.
          },
          onAccept: (data) {
            print("Data dropped: $data");
          },
          onLeave: (data) {
            print("Data dragged away: $data");
          },
        ),
      ],
    );
  }
}
///////////////---------------------//////////////////

class DragDownDetailsEx extends StatelessWidget {
  const DragDownDetailsEx({super.key});

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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _ballColor = Colors.blue;
  Offset _ballPosition = const Offset(150.0, 150.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag and Tap Ball'),
      ),
      body: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            _ballPosition += details.primaryDelta! as Offset;
          });
        },
        onTap: () {
          setState(() {
            _ballColor = _generateRandomColor();
          });
        },
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                left: _ballPosition.dx,
                top: _ballPosition.dy,
                child: Draggable(
                  child: _buildBall(),
                  feedback: _buildBall(),
                  childWhenDragging: Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBall() {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _ballColor,
      ),
    );
  }

  Color _generateRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
