import 'package:flutter/material.dart';

class OrientationBuilderEx extends StatelessWidget {
  const OrientationBuilderEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('OrientationBuilder Example'),
        ),
        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return Center(
              child: Text(
                'Current Orientation: $orientation',
                style: const TextStyle(fontSize: 20.0),
              ),
            );
          },
        ),
      ),
    );
  }
}

////////////////////////////////////////////////

class OrientationBuilderEx2 extends StatelessWidget {
  const OrientationBuilderEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dynamic Image Orientation'),
        ),
        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Current Orientation: $orientation',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 20.0),
                  _buildImageForOrientation(orientation),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildImageForOrientation(Orientation orientation) {
    if (orientation == Orientation.portrait) {
      return Image.asset('assets/piece1.png', height: 200.0);
    } else {
      return Image.asset('assets/piece6.png', width: 200.0);
    }
  }
}
