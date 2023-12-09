import 'package:flutter/material.dart';

class IconButtonEx extends StatelessWidget {
  const IconButtonEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('IconButton Example'),
        ),
        body: Center(
          child: IconButton(
            icon: const Icon(Icons.star),
            onPressed: () {
              // Add your onPressed functionality here
              // ignore: avoid_print
              print('IconButton pressed!');
            },
          ),
        ),
      ),
    );
  }
}

///////////-----------------//////////////////////

class IconButtonEx2 extends StatefulWidget {
  const IconButtonEx2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IconButtonEx2State createState() => _IconButtonEx2State();
}

class _IconButtonEx2State extends State<IconButtonEx2> {
  bool _isStarSelected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cool IconButton Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: _isStarSelected
                    ? IconButton(
                        key: ValueKey<bool>(_isStarSelected),
                        icon: const Icon(Icons.star,
                            size: 50, color: Colors.yellow),
                        onPressed: _toggleIcon,
                      )
                    : IconButton(
                        key: ValueKey<bool>(_isStarSelected),
                        icon: const Icon(Icons.favorite,
                            size: 50, color: Colors.red),
                        onPressed: _toggleIcon,
                      ),
              ),
              const SizedBox(height: 20),
              Text(
                _isStarSelected ? 'Star Selected' : 'Heart Selected',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleIcon() {
    setState(() {
      _isStarSelected = !_isStarSelected;
    });
  }
}
