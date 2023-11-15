
import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expanded Widget Example'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.blue,
              height: 100.0,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Header',
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Expanded Widget Takes Up Remaining Space',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              height: 50.0,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Footer',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
