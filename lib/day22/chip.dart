import 'package:flutter/material.dart';

class ChipEx extends StatelessWidget {
  const ChipEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Chip Examples'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Chip(
                label: Text('Flutter Chip'),
              ),
              const SizedBox(height: 20),
              Chip(
                label: const Text('Custom Chip'),
                avatar: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('A'),
                ),
                backgroundColor: Colors.yellow,
                deleteIcon: const Icon(Icons.close),
                deleteIconColor: Colors.red,
                onDeleted: () {
                  // Handle chip deletion
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
