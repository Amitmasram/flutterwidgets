import 'package:flutter/material.dart';

class IgnorePointerEx extends StatelessWidget {
  const IgnorePointerEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('IgnorePointer Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                  print('Button Pressed!');
                },
                child: const Text('Clickable Button'),
              ),
              const SizedBox(height: 20),
              IgnorePointer(
                ignoring: true, // Set to true to ignore user input
                child: ElevatedButton(
                  onPressed: () {
                    // This button will not respond to user input
                    print('This button is ignored!');
                  },
                  child: const Text('Ignored Button'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////////-------------------------------//////////

class IgnorePointerEx2 extends StatelessWidget {
  const IgnorePointerEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Draggable Square Example'),
        ),
        body: const DraggableSquare(),
      ),
    );
  }
}

class DraggableSquare extends StatefulWidget {
  const DraggableSquare({super.key});

  @override
  _DraggableSquareState createState() => _DraggableSquareState();
}

class _DraggableSquareState extends State<DraggableSquare> {
  bool ignorePointer = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          // Draggable square
          Positioned(
            left: 0,
            top: 0,
            child: IgnorePointer(
              ignoring: ignorePointer,
              child: Draggable(
                // ignore: sort_child_properties_last
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Drag me!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                feedback: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue.withOpacity(0.5),
                  child: const Center(
                    child: Text(
                      'Drag me!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                onDraggableCanceled: (Velocity velocity, Offset offset) {
                  // Handle when dragging is canceled
                },
              ),
            ),
          ),

          // Toggle button
          Positioned(
            right: 16,
            bottom: 16,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  ignorePointer = !ignorePointer;
                });
              },
              child: Text(ignorePointer ? 'Enable Drag' : 'Disable Drag'),
            ),
          ),
        ],
      ),
    );
  }
}
