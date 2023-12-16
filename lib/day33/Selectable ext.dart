import 'package:flutter/material.dart';

class SelectableTextEx extends StatelessWidget {
  const SelectableTextEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SelectableText Example'),
        ),
        body: const Center(
          child: SelectableText(
            'Hello, Flutter!',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}

//////////////////////////////

class SelectableTextEx2 extends StatefulWidget {
  const SelectableTextEx2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectableTextEx2State createState() => _SelectableTextEx2State();
}

class _SelectableTextEx2State extends State<SelectableTextEx2> {
  String displayText =
      'Flutter is an open-source UI software development toolkit.';

  void changeText() {
    setState(() {
      displayText =
          'Flutter allows you to build natively compiled applications for mobile, web, and desktop from a single codebase.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SelectableText Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                displayText,
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: changeText,
                child: const Text('Change Text'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
