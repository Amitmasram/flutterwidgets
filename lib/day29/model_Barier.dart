import 'package:flutter/material.dart';

class ModalBarrierEx extends StatelessWidget {
  const ModalBarrierEx({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;

  void _startLoading() {
    setState(() {
      _isLoading = true;
    });

    // Simulate a background task
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cool ModalBarrier Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _startLoading();
              },
              child: const Text('Start Loading'),
            ),
            const SizedBox(height: 20),
            // Cool loading overlay using ModalBarrier
            if (_isLoading)
              Stack(
                children: [
                  // Content behind the barrier
                  Container(
                    color: Colors.grey.withOpacity(0.3),
                    child: const Center(
                      child: Text(
                        'Content Behind Loading...',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  // ModalBarrier to prevent interaction
                  ModalBarrier(
                    color: Colors.black.withOpacity(0.5),
                    dismissible: false,
                  ),
                  // Loading indicator
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
