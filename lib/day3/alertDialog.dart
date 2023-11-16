// ignore: file_names
import 'package:flutter/material.dart';

// In this example:
// - AlertDialogExample is a StatelessWidget demonstrating the use of AlertDialog.
// - The AlertDialog is triggered when the ElevatedButton is pressed.
// - The AlertDialog displays a title, content, and an "OK" button to close the dialog.

class AlertDialogExample extends StatelessWidget {
  const AlertDialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AlertDialog Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // When the button is pressed, show the AlertDialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Alert!'),
                    content:
                        const Text('This is a Material Design alert dialog.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          // Close the dialog when the "OK" button is pressed
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text('Show AlertDialog'),
          ),
        ),
      ),
    );
  }
}
