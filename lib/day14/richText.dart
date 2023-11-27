import 'package:flutter/material.dart';

class RichTextEx extends StatelessWidget {
  const RichTextEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RichText Example'),
        ),
        body: Center(
          child: RichText(
            text: TextSpan(
              text: 'Hello ',
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                  text: 'bold',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                TextSpan(
                  text: ' world!',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.green),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
