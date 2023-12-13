import 'package:flutter/material.dart';

class PlaceholderEx extends StatelessWidget {
  const PlaceholderEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Placeholder Example'),
        ),
        body: const Center(
          child: Placeholder(
            // Specify the width, height, and color of the placeholder
            fallbackHeight: 100,
            fallbackWidth: 200,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////

class PlaceHolderEx2 extends StatelessWidget {
  const PlaceHolderEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cool Placeholder App'),
        ),
        body: const Center(
          child: CoolPlaceholderWidget(),
        ),
      ),
    );
  }
}

class CoolPlaceholderWidget extends StatefulWidget {
  const CoolPlaceholderWidget({super.key});

  @override
  _CoolPlaceholderWidgetState createState() => _CoolPlaceholderWidgetState();
}

class _CoolPlaceholderWidgetState extends State<CoolPlaceholderWidget> {
  Color _placeholderColor = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Change the color when the placeholder is tapped
        setState(() {
          _placeholderColor = _generateRandomColor();
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Placeholder
          Placeholder(
            fallbackHeight: 200,
            fallbackWidth: 200,
            color: _placeholderColor,
          ),
          // Overlaid Text
          const Text(
            'Tap me!',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Color _generateRandomColor() {
    // Generate a random color
    return Color((0xFF000000 & DateTime.now().millisecondsSinceEpoch) +
        ((DateTime.now().microsecondsSinceEpoch % 0xFFFFFF) << 6));
  }
}
