import 'package:flutter/material.dart';

class BaseLineEx extends StatelessWidget {
  const BaseLineEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Baseline Widget Example'),
        ),
        body: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Baseline(
                baseline: 50.0, // Adjust this value based on your needs
                baselineType: TextBaseline.alphabetic,
                child: Text(
                  'Baseline Text 1',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(width: 20),
              Baseline(
                baseline: 50.0, // Adjust this value based on your needs
                baselineType: TextBaseline.alphabetic,
                child: Text(
                  'Baseline Text 2',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
