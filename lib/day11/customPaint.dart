import 'package:flutter/material.dart';

class CustomPainEx extends StatelessWidget {
  const CustomPainEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomPaint Example'),
      ),
      body: Center(
        child: CustomPaint(
          painter: MyPainter(),
          child: Container(
            width: 200.0,
            height: 200.0,
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define your custom painting logic here
    final Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    canvas.drawLine(
        const Offset(50.0, 50.0), const Offset(150.0, 150.0), paint);
    canvas.drawCircle(const Offset(100.0, 100.0), 50.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
