import 'package:flutter/material.dart';

class SinglechildScrollViewEx extends StatelessWidget {
  const SinglechildScrollViewEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scrollable Content'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Your scrollable content goes here
              Container(
                height: 200.0,
                color: Colors.red,
              ),
              Container(
                height: 200.0,
                color: Colors.blue,
              ),
              Container(
                height: 200.0,
                color: Colors.green,
              ),
              Container(
                height: 200.0,
                color: Colors.red,
              ),
              Container(
                height: 200.0,
                color: Colors.blue,
              ),
              Container(
                height: 200.0,
                color: Colors.green,
              ),
              // ... add more widgets as needed
            ],
          ),
        ),
      ),
    );
  }
}
