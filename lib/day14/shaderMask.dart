import 'package:flutter/material.dart';

class ShaderMaskEx extends StatelessWidget {
  const ShaderMaskEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShaderMask Example'),
      ),
      body: Center(
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [Colors.red, Colors.blue],
              stops: [0.0, 1.0],
            ).createShader(bounds);
          },
          blendMode: BlendMode
              .modulate, // Blend mode to determine how the child is blended with the background
          child: Container(
            width: 200.0,
            height: 200.0,
            color:
                Colors.white, // Color of the child before applying the shader
            child: const Center(
              child: Text(
                'Hello, ShaderMask!',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//////////////----------------------------////////////

class ShaderMaskEx2 extends StatelessWidget {
  const ShaderMaskEx2({super.key});

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
                colors: [Colors.black, Colors.transparent],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: Image.network(
              "https://tse4.mm.bing.net/th?id=OIP.OctLaPgLiG38wwZOx8s3WQHaEK&pid=Api&P=0&h=180",
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
