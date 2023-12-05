import 'package:flutter/material.dart';

class BottomSheetEx extends StatelessWidget {
  const BottomSheetEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bottom Sheet Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Show the bottom sheet when the button is pressed
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  // ignore: avoid_unnecessary_containers
                  return Container(
                    // Content of the bottom sheet
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.share),
                          title: const Text('Share'),
                          onTap: () {
                            // Handle share action
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.edit),
                          title: const Text('Edit'),
                          onTap: () {
                            // Handle edit action
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.delete),
                          title: const Text('Delete'),
                          onTap: () {
                            // Handle delete action
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Text('Show Bottom Sheet'),
          ),
        ),
      ),
    );
  }
}
