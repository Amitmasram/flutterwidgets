import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FutureProviderEx extends StatelessWidget {
  const FutureProviderEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => MyDataModel(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyDataModel with ChangeNotifier {
  Future<String> fetchData() async {
    // Simulating an asynchronous operation, e.g., fetching data from a network
    await Future.delayed(const Duration(seconds: 2));
    return "Hello, FutureProvider!";
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureProvider Example'),
      ),
      body: Center(
        child: FutureProvider<String>(
          create: (context) => context.read<MyDataModel>().fetchData(),
          initialData:
              "Loading...", // Initial value while the future is being resolved
          child: const MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the value exposed by FutureProvider using Consumer
    return Consumer<String>(
      builder: (context, data, child) {
        return Text(data);
      },
    );
  }
}
