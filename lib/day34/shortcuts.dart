import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShortcutsEx extends StatelessWidget {
  const ShortcutsEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shortcuts Example'),
        ),
        body: Shortcuts(
          shortcuts: {
            LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyC):
                CopyIntent(),
            LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyX):
                CutIntent(),
            LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyV):
                PasteIntent(),
          },
          child: Focus(
            onKey: (FocusNode focusNode, RawKeyEvent event) {
              if (event is RawKeyDownEvent) {
                if (event.isControlPressed &&
                    event.logicalKey == LogicalKeyboardKey.keyC) {
                  // Handle Ctrl + C (Copy) shortcut
                  print('Copy shortcut pressed');
                  return KeyEventResult.handled;
                } else if (event.isControlPressed &&
                    event.logicalKey == LogicalKeyboardKey.keyX) {
                  // Handle Ctrl + X (Cut) shortcut
                  print('Cut shortcut pressed');
                  return KeyEventResult.handled;
                } else if (event.isControlPressed &&
                    event.logicalKey == LogicalKeyboardKey.keyV) {
                  // Handle Ctrl + V (Paste) shortcut
                  print('Paste shortcut pressed');
                  return KeyEventResult.handled;
                }
              }
              return KeyEventResult.ignored; // Allow the event to propagate
            },
            child: Container(
              padding: EdgeInsets.all(16),
              child: Text('Press Ctrl + C, Ctrl + X, or Ctrl + V'),
            ),
          ),
        ),
      ),
    );
  }
}

class CopyIntent extends Intent {}

class CutIntent extends Intent {}

class PasteIntent extends Intent {}
