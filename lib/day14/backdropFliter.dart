import 'dart:ui';

import 'package:flutter/material.dart';

class BackDropFilterEx extends StatelessWidget {
  const BackDropFilterEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BackdropFilter Example'),
      ),
      body: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://tse4.mm.bing.net/th?id=OIP.OctLaPgLiG38wwZOx8s3WQHaEK&pid=Api&P=0&h=180'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: Text(
                  'Hello, Flutter!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
