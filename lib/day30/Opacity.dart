import 'package:flutter/material.dart';

class OpacityEx extends StatelessWidget {
  const OpacityEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Opacity Widget Example'),
        ),
        body: Center(
          child: Opacity(
            opacity: 0.5, // Set the opacity value between 0.0 and 1.0
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'I am partially transparent!',
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

//////////////////////////////////////////////////////

class OpacityEx2 extends StatelessWidget {
  const OpacityEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Opacity Widget Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: 1.0,
                child: Image.network(
                  'https://example.com/your_image_url.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Opacity(
                opacity: 0.5,
                child: Image.network(
                  'https://example.com/your_image_url.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Opacity(
                opacity: 0.2,
                child: Image.network(
                  'https://example.com/your_image_url.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
