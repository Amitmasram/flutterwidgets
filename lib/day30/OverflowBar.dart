import 'package:flutter/material.dart';

class OverflowEx extends StatelessWidget {
  const OverflowEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Overflow Example'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: List.generate(
              10,
              (index) => Chip(
                label: Text('Item $index'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
