import 'package:flutter/material.dart';

class ShaderMaskEx extends StatelessWidget {
  const ShaderMaskEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ShaderMask Example'),
        ),
        body: Center(
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [Colors.red, Colors.blue],
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ).createShader(bounds);
            },
            child: const Text(
              'Hello ShaderMask!',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
