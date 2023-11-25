// ignore: file_names
import 'package:flutter/material.dart';

class CustomCliperEx extends StatelessWidget {
  const CustomCliperEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Clipper Example'),
        ),
        body: ClipPath(
          clipper: WaveClipper(),
          child: Container(
            color: Colors.blue,
            height: 200.0,
          ),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);

    final firstControlPoint = Offset(size.width / 4, size.height - 30.0);
    final firstEndPoint = Offset(size.width / 2, size.height - 60.0);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    final secondControlPoint = Offset(3 * size.width / 4, size.height - 90.0);
    final secondEndPoint = Offset(size.width, size.height - 30.0);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, size.height - 30.0);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
