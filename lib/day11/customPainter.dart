// ignore: file_names
import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  final Color lineColor;
  final double lineWidth;

  MyCustomPainter({required this.lineColor, required this.lineWidth});

  @override
  void paint(Canvas canvas, Size size) {
    // Your custom painting logic here
    final Paint paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round;

    // Draw a simple line for demonstration purposes
    canvas.drawLine(const Offset(0, 0), Offset(size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
