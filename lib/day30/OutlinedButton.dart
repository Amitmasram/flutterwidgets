import 'package:flutter/material.dart';

class OutlinedButtonEx extends StatelessWidget {
  const OutlinedButtonEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('OutlinedButton Example'),
        ),
        body: Center(
          child: OutlinedButton(
            onPressed: () {
              // Handle button press
              print('Button Pressed');
            },
            child: const Text('Press Me'),
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////

class OutlinedButtonEx2 extends StatelessWidget {
  const OutlinedButtonEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Multiple OutlinedButtons Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  print('Button 1 Pressed');
                },
                child: const Text('Button 1'),
              ),
              const SizedBox(height: 16), // Add some space between buttons
              OutlinedButton(
                onPressed: () {
                  print('Button 2 Pressed');
                },
                child: const Text('Button 2'),
              ),
              const SizedBox(height: 16), // Add some space between buttons
              OutlinedButton(
                onPressed: () {
                  print('Button 3 Pressed');
                },
                child: const Text('Button 3'),
              ),
              const SizedBox(height: 16), // Add some space between buttons
              // Example of a new feature: ToggleButton
              const ToggleButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          isToggled = !isToggled;
          print('Toggle Button Toggled: $isToggled');
        });
      },
      child: Text(isToggled ? 'Toggle OFF' : 'Toggle ON'),
    );
  }
}
