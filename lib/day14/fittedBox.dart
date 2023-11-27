import 'package:flutter/material.dart';

class FittedBoxEx extends StatelessWidget {
  const FittedBoxEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FittedBox Example'),
        ),
        body: Center(
          child: Container(
            width: 400.0,
            height: 150.0,
            color: Colors.lightBlue,
            child: const FittedBox(
              fit: BoxFit.cover,
              alignment: Alignment.center,
              child: Text(
                'Hello!',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
