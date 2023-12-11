import 'package:flutter/material.dart';

class LayoutBuilderEx extends StatelessWidget {
  const LayoutBuilderEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LayoutBuilder Example'),
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Center(
                  child: Text(
                    'Width: ${constraints.maxWidth.toStringAsFixed(2)}\n'
                    'Height: ${constraints.maxHeight.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////

class LayoutBuilderEx2 extends StatelessWidget {
  const LayoutBuilderEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Responsive Card Example'),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > 600) {
                  // Landscape mode
                  return buildLandscapeCard();
                } else {
                  // Portrait mode
                  return buildPortraitCard();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPortraitCard() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlutterLogo(size: 100),
        SizedBox(height: 16),
        Text(
          'Portrait Mode',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 8),
        Text('Content specific to portrait mode.'),
      ],
    );
  }

  Widget buildLandscapeCard() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlutterLogo(size: 100),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Landscape Mode',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
            Text('Content specific to landscape mode.'),
          ],
        ),
      ],
    );
  }
}
