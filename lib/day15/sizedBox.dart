import 'package:flutter/material.dart';

class SizeboxEx extends StatelessWidget {
  const SizeboxEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SizedBox Example'),
        ),
        body: Center(
          child: SizedBox(
            width: 200.0,
            height: 100.0,
            child: Container(
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Hello, SizedBox!',
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
