import 'package:flutter/material.dart';

class BlockSemantics extends StatelessWidget {
  final String semanticsLabel;
  final Widget child;

  const BlockSemantics(
      {Key? key, required this.semanticsLabel, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.blue,
        child: child,
      ),
    );
  }
}

class BlocSemanticsEx extends StatelessWidget {
  const BlocSemanticsEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Block Semantics Example'),
        ),
        body: const Center(
          child: BlockSemantics(
            semanticsLabel: 'This is a block of widgets',
            child: Text(
              'Hello, World!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
