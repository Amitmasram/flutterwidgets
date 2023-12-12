import 'package:flutter/material.dart';

class MouseCursorEx extends StatelessWidget {
  const MouseCursorEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mouse Cursor Example'),
        ),
        body: Center(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                print('Widget Clicked!');
              },
              child: Container(
                width: 200,
                height: 100,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Click Me!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
