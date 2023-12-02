import 'package:flutter/material.dart';

class FlowEx extends StatelessWidget {
  const FlowEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fractional Positioning Example'),
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.grey,
            child: Stack(
              children: [
                Positioned(
                  left: 0.25, // Fractional left offset (25% from the left)
                  top: 0.25, // Fractional top offset (25% from the top)
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                ),
                Positioned(
                  right: 0.25, // Fractional right offset (25% from the right)
                  bottom:
                      0.25, // Fractional bottom offset (25% from the bottom)
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/////////------------------//////////////////

class FlowEx2 extends StatelessWidget {
  const FlowEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flow Example'),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Flow(
              delegate: FlowDelegateWithSpacing(),
              children: [
                BoxWidget(Colors.red),
                BoxWidget(Colors.green),
                BoxWidget(Colors.blue),
                BoxWidget(Colors.yellow),
                BoxWidget(Colors.purple),
                BoxWidget(Colors.orange),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BoxWidget extends StatelessWidget {
  final Color color;

  BoxWidget(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      color: color,
      child: Center(
        child: Text(
          color
              .toString()
              .split('(0xff')[1]
              .split(')')[0], // Display color name
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class FlowDelegateWithSpacing extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    for (int i = 0; i < context.childCount; i++) {
      if (i != 0) {
        // Add spacing between the boxes
        context.paintChild(i,
            transform: Matrix4.translationValues(10.0, 0.0, 0.0));
      } else {
        context.paintChild(i);
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return false;
  }
}
