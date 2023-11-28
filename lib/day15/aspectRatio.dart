import 'package:flutter/material.dart';

class AspectRatioEx extends StatelessWidget {
  const AspectRatioEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AspectRatio Widget Example'),
        ),
        body: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
            child: Container(
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Aspect Ratio Example',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///

class AspectRatioEx2 extends StatelessWidget {
  const AspectRatioEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cool AspectRatio Example'),
        ),
        body: Center(
          child: AspectRatio(
            aspectRatio: 3 / 2, // Adjust the aspect ratio as needed
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Cool AspectRatio Example',
                      style: TextStyle(color: Colors.white),
                    ),
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
