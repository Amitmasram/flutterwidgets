import 'package:flutter/material.dart';

class ScrollbarEx extends StatelessWidget {
  const ScrollbarEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Scrollbar Example'),
        ),
        body: Scrollbar(
          // Wrap your scrollable widget with Scrollbar
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item $index'),
              );
            },
          ),
        ),
      ),
    );
  }
}
