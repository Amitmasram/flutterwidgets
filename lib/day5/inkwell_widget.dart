import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/*
  In this example:
  - We use the InkWell widget as the parent widget.
  - The onTap callback is triggered when the InkWell is tapped. In this example, it simply prints a message to the console.
  - The onDoubleTap callback is triggered when the InkWell is double-tapped.
  - The onLongPress callback is triggered when the InkWell is long-pressed.
  - The onTapCancel callback is triggered when the tap is canceled.
  - The onTapDown callback is triggered when the tap is down.
  - The onTapUp callback is triggered when the tap is up.
  - The onHighlightChanged callback is triggered when the highlight changes.
  - The customBorder property allows you to specify a custom shape for the InkWell.
  - The focusColor property defines the color of the focus highlight when the InkWell is focused.
  - The hoverColor property defines the color of the hover highlight when the InkWell is hovered.
  - The highlightColor property defines the color of the ink splash highlight when the InkWell is tapped.
  - The radius property sets the radius of the ink splash highlight.
  - The borderRadius property defines the border radius of the InkWell.
  - The enableFeedback property determines whether haptic feedback is enabled for the InkWell.
  - The excludeFromSemantics property determines whether the InkWell should be excluded from the semantics tree.
  - The splashFactory property allows you to specify a custom ink splash factory for the InkWell.
  - The child property of InkWell is a Container containing the text 'Tap me!'. You can replace this with any other widget or custom content.
*/

class InkwellPage extends StatelessWidget {
  const InkwellPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('InkWell Example'),
        ),
        body: Center(
          child: InkWell(
            onTap: () {
              // Handle tap event
              if (kDebugMode) {
                print('InkWell tapped!');
              }
            },
            onDoubleTap: () {
              // Handle double tap event
              if (kDebugMode) {
                print('InkWell double-tapped!');
              }
            },
            onLongPress: () {
              // Handle long press event
              if (kDebugMode) {
                print('InkWell long-pressed!');
              }
            },
            onTapCancel: () {
              // Handle tap cancellation
              if (kDebugMode) {
                print('InkWell tap canceled!');
              }
            },
            onTapDown: (TapDownDetails details) {
              // Handle tap down event
              if (kDebugMode) {
                print('InkWell tap down at ${details.localPosition}');
              }
            },
            onTapUp: (TapUpDetails details) {
              // Handle tap up event
              if (kDebugMode) {
                print('InkWell tap up at ${details.localPosition}');
              }
            },
            onHighlightChanged: (bool value) {
              // Handle highlight change event
              if (kDebugMode) {
                print('InkWell highlight changed: $value');
              }
            },
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusColor: Colors.orange, // Color of the focus highlight
            hoverColor: Colors.green, // Color of the hover highlight
            highlightColor: Colors.red, // Color of the ink splash highlight
            radius: 30.0, // Radius of the ink splash highlight
            borderRadius:
                BorderRadius.circular(15.0), // Border radius of InkWell
            enableFeedback: true, // Enable haptic feedback
            excludeFromSemantics: false, // Exclude from semantics tree
            splashFactory: InkSplash.splashFactory, // Custom ink splash factory
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                'Tap me!',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
