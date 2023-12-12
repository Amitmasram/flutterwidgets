import 'package:flutter/material.dart';

class NotificationListnerEx extends StatelessWidget {
  const NotificationListnerEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Notification Listener Example'),
        ),
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            // Handle scroll notifications here
            print("Scrolling: ${scrollInfo.metrics.pixels}");
            return true; // Return true to prevent the notification from bubbling up
          },
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item $index'),
              );
            },
          ),
        ),
      ),
    );
  }
}
