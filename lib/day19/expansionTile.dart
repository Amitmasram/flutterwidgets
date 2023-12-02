import 'package:flutter/material.dart';

class ExpansionTileEx extends StatelessWidget {
  const ExpansionTileEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ExpansionTile Example'),
        ),
        body: const MyExpansionTile(),
      ),
    );
  }
}

class MyExpansionTile extends StatelessWidget {
  const MyExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        ExpansionTile(
          title: Text('Expandable Tile'),
          leading: Icon(Icons.arrow_drop_down),
          children: <Widget>[
            ListTile(
              title: Text('Subitem 1'),
            ),
            ListTile(
              title: Text('Subitem 2'),
            ),
          ],
        ),
      ],
    );
  }
}

////-----------------------------///////////

class ExpansionTileEx2 extends StatelessWidget {
  const ExpansionTileEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cool Animation App'),
        ),
        body: const Center(
          child: CoolButton(),
        ),
      ),
    );
  }
}

class CoolButton extends StatefulWidget {
  const CoolButton({super.key});

  @override
  _CoolButtonState createState() => _CoolButtonState();
}

class _CoolButtonState extends State<CoolButton> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 360).animate(_controller);

    // Uncomment the next line if you want the animation to repeat
    // _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.status == AnimationStatus.completed) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      },
      child: RotationTransition(
        turns: _animation,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
          child: const Center(
            child: Text(
              'Press Me!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
