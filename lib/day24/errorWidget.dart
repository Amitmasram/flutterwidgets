import 'package:flutter/material.dart';

class ErrorWidgetEx extends StatelessWidget {
  const ErrorWidgetEx({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ErrorWidget Example'),
      ),
      body: const ErrorWidgetExample(),
    );
  }
}

class ErrorWidgetExample extends StatelessWidget {
  const ErrorWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulating an error by dividing by zero
    int result = 5 ~/ 0;

    // This line will not be reached because an error occurred above
    return Text('Result: $result');
  }
}

// Custom ErrorWidget to display a friendly error message
class CustomErrorWidget extends StatelessWidget {
  final dynamic error;

  CustomErrorWidget(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'An error occurred: $error',
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}

/////////////////////-------------------------////////////

class ErrorWidgetEx2 extends StatelessWidget {
  const ErrorWidgetEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePagex(),
    );
  }
}

class MyHomePagex extends StatelessWidget {
  const MyHomePagex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Error Widget Example'),
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            // Simulate an error by dividing by zero
            int result = 1 ~/ 0;

            return Text('Result: $result');
          },
        ),
      ),
    );
  }
}

class MyErrorWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  MyErrorWidget(this.errorDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'An error occurred:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Text(
            errorDetails.exceptionAsString(),
            style: const TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class MyErrorWidgetFallback extends StatelessWidget {
  const MyErrorWidgetFallback({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Text(
        'Oops! Something went wrong.',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
      ),
    );
  }
}
