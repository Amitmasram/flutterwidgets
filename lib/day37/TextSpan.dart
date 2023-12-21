import 'package:flutter/material.dart';

class TextSpanEx extends StatelessWidget {
  const TextSpanEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TextSpan Example'),
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
                  style:
                      TextStyle(fontStyle: FontStyle.italic, color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/////////////////////////////-------------Ex2-------------//////

class TextSpanEx2 extends StatelessWidget {
  const TextSpanEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Styled Text Example'),
        ),
        body: Center(
          child: RichText(
            text: const TextSpan(
              text: 'Flutter is ',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'awesome',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: ' and ',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'beautiful',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.red,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextSpan(
                  text: '!',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
