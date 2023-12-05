import 'package:flutter/material.dart';

class AnimatedSizeEx extends StatelessWidget {
  const AnimatedSizeEx({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedSize Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSize(
              //vsync: this,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: Container(
                width: isExpanded ? 200.0 : 100.0,
                height: 100.0,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Hello',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: const Text('Toggle Size'),
            ),
          ],
        ),
      ),
    );
  }
}
