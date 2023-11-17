import 'package:flutter/material.dart';

/// Example of using CircularProgressIndicator in Flutter.
///
/// In this example, there are two CircularProgressIndicator widgets.
/// The first one uses the default styling, while the second one has a
/// custom color (Colors.red) and a custom strokeWidth (5.0).
/// You can customize other properties of the CircularProgressIndicator
/// widget according to your requirements.
///
/// If you want to use completely different circular progress indicators,
/// you can explore other packages available on pub.dev that provide
/// different styles of circular progress indicators.
/// One popular package is the flutter_spinkit package, which offers
/// a variety of animated loading indicators. You can find it here:
/// [flutter_spinkit](https://pub.dev/packages/flutter_spinkit).
class CircleProgressInPage extends StatelessWidget {
  const CircleProgressInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circular Progress Indicators'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular Progress Indicator 1
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 20),

            // Circular Progress Indicator 2
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              strokeWidth: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
