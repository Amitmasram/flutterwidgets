import 'package:flutter/material.dart';

/*
  This example includes various TextStyle properties such as text color, background color, font size, font weight, font style,
  letter spacing, word spacing, text baseline, line height, text decoration, decoration color, decoration style, decoration thickness,
  text shadows, font family, and letter spacing. You can adjust these properties based on your specific styling requirements.
*/

class TextStylePage extends StatelessWidget {
  const TextStylePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TextStyle Example'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello, TextStyle!',
                style: TextStyle(
                  color: Colors.blue, // Text color
                  backgroundColor: Colors.yellow, // Background color
                  fontSize: 24.0, // Font size
                  fontWeight: FontWeight.bold, // Font weight
                  fontStyle: FontStyle.italic, // Font style
                  letterSpacing: 2.0, // Letter spacing
                  wordSpacing: 4.0, // Word spacing
                  textBaseline: TextBaseline.alphabetic, // Text baseline
                  height: 1.5, // Line height
                  decoration: TextDecoration.underline, // Text decoration
                  decorationColor: Colors.red, // Decoration color
                  decorationStyle:
                      TextDecorationStyle.dashed, // Decoration style
                  decorationThickness: 2.0, // Decoration thickness
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                    ),
                  ], // Text shadows
                  fontFamily: 'Roboto', // Font family
                ),
              ),
              SizedBox(height: 20.0), // Add some spacing between texts
              Text(
                'Another Text Example',
                style: TextStyle(
                  color: Colors.green, // Text color
                  fontSize: 18.0, // Font size
                  fontWeight: FontWeight.normal, // Font weight
                  fontStyle: FontStyle.normal, // Font style
                  letterSpacing: 1.0, // Letter spacing
                  wordSpacing: 2.0, // Word spacing
                  textBaseline: TextBaseline.alphabetic, // Text baseline
                  height: 1.2, // Line height
                  decoration: TextDecoration.none, // No text decoration
                  fontFamily: 'Arial', // Font family
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
