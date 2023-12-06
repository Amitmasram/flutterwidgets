import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoContextMenuEx extends StatelessWidget {
  const CupertinoContextMenuEx({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Cupertino Context Menu'),
      ),
      child: Center(
        child: CupertinoContextMenu(
          actions: <Widget>[
            CupertinoContextMenuAction(
              child: const Text('Action 1'),
              onPressed: () {
                // Handle action 1
                Navigator.pop(context);
              },
            ),
            CupertinoContextMenuAction(
              child: const Text('Action 2'),
              onPressed: () {
                // Handle action 2
                Navigator.pop(context);
              },
            ),
          ],
          child: Container(
            color: CupertinoColors.activeBlue,
            height: 200.0,
            width: 200.0,
            child: const Center(
              child: Text('Press and hold to show context menu'),
            ),
          ),
        ),
      ),
    );
  }
}
