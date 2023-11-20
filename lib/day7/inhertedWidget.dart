import 'package:flutter/material.dart';

// Custom InheritedWidget class to hold shared data
class MyInheritedData extends InheritedWidget {
  final String data;

  MyInheritedData({
    super.key,
    required this.data,
    required Widget child,
  }) : super(child: child);

  // Static method to get the nearest instance of MyInheritedData in the widget tree
  static MyInheritedData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedData>();
  }

  // Returning false as we don't want to trigger unnecessary rebuilds when the data changes
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class MyInheritedWidgetPage extends StatefulWidget {
  const MyInheritedWidgetPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyInheritedWidgetPageState createState() => _MyInheritedWidgetPageState();
}

class _MyInheritedWidgetPageState extends State<MyInheritedWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget Example'),
      ),
      body: MyInheritedData(
        // Wrap the subtree that needs access to the shared data with MyInheritedData
        data: 'Hello from InheritedWidget!',
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidgetA(),
              TextWidgetB(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextWidgetA extends StatelessWidget {
  const TextWidgetA({super.key});

  @override
  Widget build(BuildContext context) {
    // Access data from the InheritedWidget
    final inheritedData = MyInheritedData.of(context)?.data ?? '';

    return Text(
      'TextWidgetA: $inheritedData',
      style: const TextStyle(fontSize: 20),
    );
  }
}

class TextWidgetB extends StatelessWidget {
  const TextWidgetB({super.key});

  @override
  Widget build(BuildContext context) {
    // Access data from the InheritedWidget
    final inheritedData = MyInheritedData.of(context)?.data ?? '';

    return Text(
      'TextWidgetB: $inheritedData',
      style: const TextStyle(fontSize: 20),
    );
  }
}
