import 'package:flutter/material.dart';

class OffstageEx extends StatelessWidget {
  const OffstageEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Offstage Example'),
        ),
        body: const Center(
          child: OffstageExample(),
        ),
      ),
    );
  }
}

class OffstageExample extends StatefulWidget {
  const OffstageExample({super.key});

  @override
  _OffstageExampleState createState() => _OffstageExampleState();
}

class _OffstageExampleState extends State<OffstageExample> {
  bool hideWidget = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('This is a visible widget'),
        Offstage(
          offstage: hideWidget,
          child: Container(
            height: 50,
            width: 200,
            color: Colors.blue,
            child: const Center(
              child: Text('This widget can be hidden'),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              hideWidget = !hideWidget;
            });
          },
          child: const Text('Toggle Widget Visibility'),
        ),
      ],
    );
  }
}

//////////////-------------//////////////

class OffstageEx2 extends StatelessWidget {
  const OffstageEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cool Offstage Example'),
        ),
        body: const Center(
          child: CoolOffstageExample(),
        ),
      ),
    );
  }
}

class CoolOffstageExample extends StatefulWidget {
  const CoolOffstageExample({super.key});

  @override
  _CoolOffstageExampleState createState() => _CoolOffstageExampleState();
}

class _CoolOffstageExampleState extends State<CoolOffstageExample> {
  bool showCircle = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Offstage(
          offstage: !showCircle,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
        ),
        Offstage(
          offstage: showCircle,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              showCircle = !showCircle;
            });
          },
          child: const Text('Toggle Shape'),
        ),
      ],
    );
  }
}
