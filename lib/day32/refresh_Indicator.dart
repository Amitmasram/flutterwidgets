import 'package:flutter/material.dart';

class RefreshIndicatorEx extends StatelessWidget {
  const RefreshIndicatorEx({super.key});

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
  // Simulated data
  List<String> items = List.generate(20, (index) => 'Item $index');

  Future<void> _refresh() async {
    // Simulate a network request or any asynchronous operation
    await Future.delayed(const Duration(seconds: 2));

    // Update the data or perform any other necessary actions
    setState(() {
      items = List.generate(20, (index) => 'Refreshed Item $index');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RefreshIndicator Example'),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
      ),
    );
  }
}
