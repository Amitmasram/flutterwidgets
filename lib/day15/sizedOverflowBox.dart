import 'package:flutter/material.dart';

class SizedOverFlowBoxEx extends StatelessWidget {
  const SizedOverFlowBoxEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SizedOverflowBox Example'),
        ),
        body: Center(
          child: SizedOverflowBox(
            size: const Size(200.0, 100.0),
            alignment: Alignment.topRight,
            child: Container(
              color: Colors.blue,
              width: 250.0,
              height: 150.0,
              child: const Center(
                child: Text(
                  'Overflow Box',
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
