import 'package:flutter/material.dart';

class MyDraggableWidget extends StatefulWidget {
  const MyDraggableWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyDraggableWidgetState createState() => _MyDraggableWidgetState();
}

class _MyDraggableWidgetState extends State<MyDraggableWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable Widget Example'),
      ),
      body: Center(
        child: Draggable(
          // ignore: sort_child_properties_last
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
            child: const Center(
              child: Text(
                'Dragging...',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          childWhenDragging: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
////////////////////--------------------------

class MyPuzzleGame extends StatefulWidget {
  const MyPuzzleGame({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyPuzzleGameState createState() => _MyPuzzleGameState();
}

class _MyPuzzleGameState extends State<MyPuzzleGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable Puzzle Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DraggablePuzzlePiece(imageAsset: 'assets/piece1.png'),
                DraggablePuzzlePiece(imageAsset: 'assets/piece2.png'),
                DraggablePuzzlePiece(imageAsset: 'assets/piece3.png'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DraggablePuzzlePiece(imageAsset: 'assets/piece4.png'),
                DraggablePuzzlePiece(imageAsset: 'assets/piece5.png'),
                DraggablePuzzlePiece(imageAsset: 'assets/piece6.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DraggablePuzzlePiece extends StatelessWidget {
  final String imageAsset;

  DraggablePuzzlePiece({super.key, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Draggable(
      // ignore: sort_child_properties_last
      child: Image.asset(imageAsset, width: 100, height: 100),
      feedback: Image.asset(imageAsset, width: 100, height: 100),
      childWhenDragging: Container(),
    );
  }
}
