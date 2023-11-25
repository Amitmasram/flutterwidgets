// ignore: file_names
import 'package:flutter/material.dart';

class FractionallySizedBoxEx extends StatelessWidget {
  const FractionallySizedBoxEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FractionallySizedBox Example'),
        ),
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.8, // 80% of the available width
            heightFactor: 0.5, // 50% of the available height
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Center(
                child: Text(
                  'Hello, FractionallySizedBox!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
