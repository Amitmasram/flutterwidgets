import 'package:flutter/material.dart';

class IconEx extends StatelessWidget {
  const IconEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Icon Example'),
        ),
        body: const Center(
          child: Icon(
            Icons.star, // Using the built-in star icon
            size: 50.0, // Set the size of the icon
            color: Colors.yellow, // Set the color of the icon
          ),
        ),
      ),
    );
  }
}

///////////////////---------------------////////////////////

class IconEx2 extends StatefulWidget {
  const IconEx2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IconEx2State createState() => _IconEx2State();
}

class _IconEx2State extends State<IconEx2> {
  Color _iconColor = Colors.blue; // Initial color

  void _toggleIconColor() {
    setState(() {
      // Change the color to a random color when tapped
      _iconColor = Color(
          0xFF000000 + (DateTime.now().microsecondsSinceEpoch & 0xFFFFFF));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cool Icon Example'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: _toggleIconColor,
            child: Icon(
              Icons.favorite,
              size: 100.0,
              color: _iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
