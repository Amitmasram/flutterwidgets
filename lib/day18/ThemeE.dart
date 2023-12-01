import 'package:flutter/material.dart';

class ThemeEx extends StatelessWidget {
  const ThemeEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.orange,
        fontFamily: 'Roboto',
        // ... other app-wide theme properties
      ),
      home: Theme(
        data: ThemeData(
            // Customize styles for this part of the widget tree
            ),
        child: const YourWidgetTree(),
      ),
    );
  }
}

class YourWidgetTree extends StatelessWidget {
  const YourWidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Center(
        child: Text(
          'Hello, World!',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
