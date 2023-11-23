import 'package:flutter/material.dart';

class MyStepper extends StatefulWidget {
  const MyStepper({super.key});

  @override
  _MyStepperState createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Stepper Example'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          setState(() {
            if (_currentStep < 2) {
              _currentStep += 1;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep -= 1;
            }
          });
        },
        steps: [
          Step(
            title: const Text('Step 1'),
            content: const Text('This is the content of Step 1'),
            isActive: _currentStep == 0,
          ),
          Step(
            title: const Text('Step 2'),
            content: const Text('This is the content of Step 2'),
            isActive: _currentStep == 1,
          ),
          Step(
            title: const Text('Step 3'),
            content: const Text('This is the content of Step 3'),
            isActive: _currentStep == 2,
          ),
        ],
      ),
    );
  }
}
