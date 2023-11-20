import 'dart:async';

import 'package:flutter/material.dart';

class MyFuturePage extends StatefulWidget {
  const MyFuturePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyFuturePageState createState() => _MyFuturePageState();
}

class _MyFuturePageState extends State<MyFuturePage> {
  late Future<String> _dataFuture;

  @override
  void initState() {
    super.initState();

    // Simulate an asynchronous operation (e.g., fetching data from an API)
    _dataFuture = fetchData();
  }

  Future<String> fetchData() async {
    // Simulate a delay of 2 seconds (e.g., fetching data from an API)
    await Future.delayed(const Duration(seconds: 2));

    // Return some data
    return 'Hello from the Future!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder Example'),
      ),
      body: Center(
        // Use FutureBuilder to rebuild the UI based on the completion of the future
        child: FutureBuilder<String>(
          future: _dataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While the future is still running, show a loading indicator
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // If the future completes with an error, display the error
              return Text('Error: ${snapshot.error}');
            } else {
              // If the future completes successfully, display the data
              return Text('Data from Future: ${snapshot.data}',
                  style: const TextStyle(fontSize: 20));
            }
          },
        ),
      ),
    );
  }
}

////////----------------------------------------/////////////////////////////////

// In this Flutter example using FutureBuilder:
// - We create a Future<List<String>> named _dataFuture to represent an asynchronous operation
//   (e.g., fetching a list of items from an API).
// - In the initState method, we initiate the asynchronous operation by calling fetchItemList.
// - The FutureBuilder widget listens to _dataFuture and rebuilds the UI based on the completion of the future.
// - While the future is still running, a loading indicator is displayed (ConnectionState.waiting).
// - If the future completes with an error, the error is displayed (snapshot.hasError).
// - If the future completes successfully, the list of items is displayed in a ListView.
//   Each item is represented by a ListTile.

class MyFutureListPage extends StatefulWidget {
  const MyFutureListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyFutureListPageState createState() => _MyFutureListPageState();
}

class _MyFutureListPageState extends State<MyFutureListPage> {
  late Future<List<String>> _dataFuture;

  @override
  void initState() {
    super.initState();

    // Simulate an asynchronous operation (e.g., fetching a list of items from an API)
    _dataFuture = fetchItemList();
  }

  Future<List<String>> fetchItemList() async {
    // Simulate a delay of 2 seconds (e.g., fetching data from an API)
    await Future.delayed(Duration(seconds: 2));

    // Return a list of items
    return ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder List Example'),
      ),
      body: Center(
        // Use FutureBuilder to rebuild the UI based on the completion of the future
        child: FutureBuilder<List<String>>(
          future: _dataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While the future is still running, show a loading indicator
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // If the future completes with an error, display the error
              return Text('Error: ${snapshot.error}');
            } else {
              // If the future completes successfully, display the list of items
              List<String> items = snapshot.data!;
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index]),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
