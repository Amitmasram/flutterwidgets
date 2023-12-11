import 'package:flutter/material.dart';

class ListnerEx extends StatelessWidget {
  const ListnerEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Listener Example'),
        ),
        body: Center(
          child: Listener(
            onPointerDown: (PointerDownEvent event) {
              // Handle pointer down event
              print('Pointer down');
            },
            onPointerMove: (PointerMoveEvent event) {
              // Handle pointer move event
              print('Pointer move');
            },
            onPointerUp: (PointerUpEvent event) {
              // Handle pointer up event
              print('Pointer up');
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: const Center(
                child: Text('Tap me'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////

class ListnerEx2 extends StatelessWidget {
  const ListnerEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Draggable Box Example'),
        ),
        body: const DraggableBox(),
      ),
    );
  }
}

class DraggableBox extends StatefulWidget {
  const DraggableBox({super.key});

  @override
  _DraggableBoxState createState() => _DraggableBoxState();
}

class _DraggableBoxState extends State<DraggableBox> {
  Offset _offset = const Offset(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: _offset.dx,
          top: _offset.dy,
          child: Listener(
            onPointerDown: (PointerDownEvent event) {
              // Set the initial position when the user taps the box
              setState(() {
                _offset = event.position;
              });
            },
            onPointerMove: (PointerMoveEvent event) {
              // Update the position as the user moves their finger
              setState(() {
                _offset = event.position;
              });
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: const Center(
                child: Text('Drag me'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
