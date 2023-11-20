import 'dart:async';

import 'package:flutter/material.dart';

// This Flutter example demonstrates the basic usage of StreamBuilder for real-time data updates.
// Key Points:
// 1. Create a StreamController<int> to manage the stream of integers.
// 2. StreamBuilder listens to the stream and rebuilds the UI whenever new data is received.
// 3. Simulate data emission every second using a Timer.
// 4. StreamBuilder has three possible states: hasData, hasError, and waiting. Handle each case in the builder function.
// 5. Remember to close the stream controller in the dispose method to avoid memory leaks.

class MyStreamPage extends StatefulWidget {
  const MyStreamPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyStreamPageState createState() => _MyStreamPageState();
}

class _MyStreamPageState extends State<MyStreamPage> {
  late StreamController<int> _streamController;
  late Stream<int> _stream;
  int _data = 0;

  @override
  void initState() {
    super.initState();

    // Initialize a stream controller
    _streamController = StreamController<int>();

    // Create a stream from the controller
    _stream = _streamController.stream;

    // Simulate data emission every second
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _streamController.add(_data++);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamBuilder Example'),
      ),
      body: Center(
        // Use StreamBuilder to rebuild the UI when new data is emitted
        child: StreamBuilder<int>(
          stream: _stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                'Data from Stream: ${snapshot.data}',
                style: const TextStyle(fontSize: 20),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Close the stream controller when the widget is disposed
    _streamController.close();
    super.dispose();
  }
}
