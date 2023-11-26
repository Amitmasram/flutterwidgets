import 'package:flutter/material.dart';

class ClipOvalEx extends StatelessWidget {
  const ClipOvalEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ClipOval Example'),
        ),
        body: Center(
          child: ClipOval(
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Oval',
                  style: TextStyle(
                    color: Colors.white,
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

///////////////////////

class ClipOvalImageEx extends StatelessWidget {
  const ClipOvalImageEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cool Image'),
        ),
        body: Center(
          child: ClipOval(
            child: Image.network(
              'https://tse3.mm.bing.net/th?id=OIP.q8eB0ZuykV_7H0UyEMNSpAHaEK&pid=Api&P=0&h=180',
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
