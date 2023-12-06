import 'package:flutter/material.dart';

class CloseButtonEx extends StatelessWidget {
  const CloseButtonEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Close Button Example'),
        ),
        body: Center(
          child: CloseButton(
            onPressed: () {
              // Handle close button press
              // ignore: avoid_print
              print('Close button pressed');
            },
          ),
        ),
      ),
    );
  }
}

///////////------------------///////////////////

class CloseButtonEx2 extends StatelessWidget {
  const CloseButtonEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cool Animated Button'),
        ),
        body: const Center(
          child: CoolButton(),
        ),
      ),
    );
  }
}

class CoolButton extends StatefulWidget {
  const CoolButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CoolButtonState createState() => _CoolButtonState();
}

class _CoolButtonState extends State<CoolButton> {
  double buttonSize = 100.0;
  double borderRadius = 12.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Change button properties on tap
          buttonSize = 120.0;
          borderRadius = 20.0;
        });

        // Add any cool actions or animations here!
        // For simplicity, we'll just wait for a moment and then revert the changes.
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            buttonSize = 100.0;
            borderRadius = 12.0;
          });
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: const Center(
          child: Text(
            'Cool!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
