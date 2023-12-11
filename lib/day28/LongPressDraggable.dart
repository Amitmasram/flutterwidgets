import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LongPressDraggableEx extends StatelessWidget {
  const LongPressDraggableEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LongPressDraggable Example'),
        ),
        body: const Center(
          child: MyDraggableWidget(),
        ),
      ),
    );
  }
}

class MyDraggableWidget extends StatelessWidget {
  const MyDraggableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Draggable(
      // Specify a unique identifier for this draggable item.
      data: 'Drag me!',
      // The child that will be dragged.
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
      // The feedback widget that appears during the drag.
      feedback: Container(
        width: 120.0,
        height: 120.0,
        color: Colors.blue.withOpacity(0.7),
        child: const Center(
          child: Text(
            'Dragging...',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      // Callback when the item is successfully dragged.
      onDraggableCanceled: (velocity, offset) {
        print('Item dropped at $offset');
      },
      // Callback when the long press occurs.
      onDragStarted: () {
        // Optionally provide haptic feedback.
        HapticFeedback.mediumImpact();
        // Show the menu.
        showMenu(
          context: context,
          position: const RelativeRect.fromLTRB(0, 100, 0, 0),
          items: <PopupMenuEntry>[
            const PopupMenuItem(
              child: Text('Menu Item 1'),
              value: 'item1',
            ),
            const PopupMenuItem(
              child: Text('Menu Item 2'),
              value: 'item2',
            ),
          ],
        );
      },
    );
  }
}

////////////////////////////////

class LongPressDraggableEx2 extends StatelessWidget {
  const LongPressDraggableEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('Cool LongPressDraggable Example'),
        ),
        body: Center(
          child: DraggableCard(
            color: Colors.blue,
            shape: Icons.star,
          ),
        ),
      ),
    );
  }
}

class DraggableCard extends StatelessWidget {
  final Color color;
  final IconData shape;

  DraggableCard({super.key, required this.color, required this.shape});

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable(
      data: shape, // Use the shape as data for simplicity
      feedback: _buildCard(color, shape),
      child: _buildCard(color, shape),
      childWhenDragging: Container(), // Hide the original card when dragging
    );
  }

  Widget _buildCard(Color color, IconData shape) {
    return Container(
      width: 100.0,
      height: 100.0,
      color: color,
      child: Center(
        child: Icon(
          shape,
          size: 50.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

//////////////////////////////////////

class LongPressDraggableEx3 extends StatelessWidget {
  const LongPressDraggableEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cool Emoji Drag and Drop'),
        ),
        body: const EmojiCanvas(),
      ),
    );
  }
}

class EmojiCanvas extends StatefulWidget {
  const EmojiCanvas({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EmojiCanvasState createState() => _EmojiCanvasState();
}

class _EmojiCanvasState extends State<EmojiCanvas> {
  List<Widget> emojis = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.yellow,
        ),
        ...emojis,
        EmojiPalette(
          onEmojiDragged: (iconData, color) {
            setState(() {
              emojis.add(
                Positioned(
                  top: 100.0,
                  left: 100.0,
                  child: Emoji(
                    iconData: iconData,
                    color: color,
                  ),
                ),
              );
            });
          },
        ),
      ],
    );
  }
}

class Emoji extends StatelessWidget {
  final IconData iconData;
  final Color color;

  Emoji({super.key, required this.iconData, required this.color});

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable(
      data: iconData,
      feedback: _buildEmoji(),
      child: _buildEmoji(),
      childWhenDragging: Container(),
    );
  }

  Widget _buildEmoji() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      // ignore: sort_child_properties_last
      child: Icon(
        iconData,
        size: 40.0,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class EmojiPalette extends StatelessWidget {
  final List<Map<String, dynamic>> emojiData = [
    {'icon': Icons.favorite, 'color': Colors.red},
    {'icon': Icons.star, 'color': Colors.amber},
    {'icon': Icons.thumb_up, 'color': Colors.blue},
  ];

  final Function(IconData, Color) onEmojiDragged;

  EmojiPalette({super.key, required this.onEmojiDragged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: emojiData.map((data) {
        return Emoji(
          iconData: data['icon'],
          color: data['color'],
        );
      }).toList(),
    );
  }
}
