import 'package:flutter/material.dart';

class WillPopScopeExample extends StatelessWidget {
  const WillPopScopeExample({super.key});

  Future<bool> _onWillPop(BuildContext context) async {
    bool canExit = await showExitDialog(context);
    return canExit;
  }

  Future<bool> showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Exit App?',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Are you sure you want to exit?',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Allow back button press
            },
            child: const Text(
              'Yes',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Stay in the current route
            },
            child: const Text(
              'No',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WillPopScope Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Press the back button to trigger WillPopScope',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _onWillPop(context);
              },
              child: const Text('Show Exit Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
