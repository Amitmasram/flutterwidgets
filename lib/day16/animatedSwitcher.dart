import 'package:flutter/material.dart';

class MyAnimatedSwitcher extends StatefulWidget {
  const MyAnimatedSwitcher({super.key});

  @override
  _MyAnimatedSwitcherState createState() => _MyAnimatedSwitcherState();
}

class _MyAnimatedSwitcherState extends State<MyAnimatedSwitcher> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: _showFirst
                ? Container(
                    key: const ValueKey<int>(1),
                    height: 100,
                    width: 100,
                    color: Colors.blue,
                    child: const Center(
                      child: Text('First'),
                    ),
                  )
                : Container(
                    key: const ValueKey<int>(2),
                    height: 100,
                    width: 100,
                    color: Colors.red,
                    child: const Center(
                      child: Text('Second'),
                    ),
                  ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _showFirst = !_showFirst;
              });
            },
            child: const Text('Switch'),
          ),
        ],
      ),
    );
  }
}
