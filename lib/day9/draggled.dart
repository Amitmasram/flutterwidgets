import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  const DraggableWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Draggable(
        data: 'This is my draggable widget!',
        child: Container(
          width: 100.0,
          height: 100.0,
          color: Colors.blue,
          child: const Center(
            child: Text(
              'Drag me!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        feedback: Container(
          width: 100.0,
          height: 100.0,
          color: Colors.blue.withOpacity(0.5),
          child: Center(
            child: Text(
              'Dragging...',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        // Callback when the draggable is released (dropped).
        onDragEnd: (DraggableDetails details) {
          // You can perform any action when the draggable is dropped here.
          print('Draggable dropped!');
        },
      ),
    );
  }
}
