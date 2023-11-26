import 'package:flutter/material.dart';

class HeroEx extends StatelessWidget {
  const HeroEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hero Widget Example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(),
                  ),
                );
              },
              child: Hero(
                tag: 'heroTag1',
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Hero(
          tag: 'heroTag1',
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
