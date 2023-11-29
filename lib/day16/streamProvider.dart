import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamProviderEx extends StatelessWidget {
  const StreamProviderEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamProvider<int>(
        create: (context) =>
            myStream(), // Replace myStream with your actual stream
        initialData:
            0, // Initial value while waiting for the first data from the stream
        child: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int dataFromStream = Provider.of<int>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider Example'),
      ),
      body: Center(
        child: Text('Data from Stream: $dataFromStream'),
      ),
    );
  }
}

Stream<int> myStream() async* {
  // Simulating a stream that emits integers over time
  for (int i = 0; i < 20; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}
