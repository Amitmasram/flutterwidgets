import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleEx extends StatelessWidget {
  const AnimatedDefaultTextStyleEx({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyAnimatedTextStyleWidget(),
    );
  }
}

class MyAnimatedTextStyleWidget extends StatefulWidget {
  const MyAnimatedTextStyleWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAnimatedTextStyleWidgetState createState() =>
      _MyAnimatedTextStyleWidgetState();
}

class _MyAnimatedTextStyleWidgetState extends State<MyAnimatedTextStyleWidget> {
  TextStyle _currentTextStyle =
      const TextStyle(fontSize: 20.0, color: Colors.blue);

  void _changeTextStyle() {
    setState(() {
      _currentTextStyle = (_currentTextStyle.fontSize == 20.0)
          ? const TextStyle(fontSize: 30.0, color: Colors.red)
          : const TextStyle(fontSize: 20.0, color: Colors.blue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Text Style Example'),
      ),
      body: Center(
        child: AnimatedDefaultTextStyle(
          duration: const Duration(seconds: 1),
          style: _currentTextStyle,
          child: const Text('Hello, Flutter!'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeTextStyle,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

///////////////-///////////

class AnimatedDefaultTextStyleEx2 extends StatelessWidget {
  const AnimatedDefaultTextStyleEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCoolAnimatedTextStyleWidget(),
    );
  }
}

class MyCoolAnimatedTextStyleWidget extends StatefulWidget {
  const MyCoolAnimatedTextStyleWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyCoolAnimatedTextStyleWidgetState createState() =>
      _MyCoolAnimatedTextStyleWidgetState();
}

class _MyCoolAnimatedTextStyleWidgetState
    extends State<MyCoolAnimatedTextStyleWidget> {
  double _fontSize = 20.0;
  Color _textColor = Colors.blue;

  void _changeTextStyle() {
    setState(() {
      _fontSize = (_fontSize == 20.0) ? 30.0 : 20.0;
      _textColor = (_textColor == Colors.blue) ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cool Animated Text Style Example'),
      ),
      body: Center(
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 500),
          style: TextStyle(fontSize: _fontSize, color: _textColor),
          child: const Text('Hello, Flutter!'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeTextStyle,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
