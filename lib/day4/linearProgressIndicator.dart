import 'package:flutter/material.dart';

/// A Flutter page demonstrating the usage of multiple LinearProgressIndicator widgets with different configurations.
///
/// This page includes examples of default and customized LinearProgressIndicators to showcase their appearance variations.
class LinearProPage extends StatelessWidget {
  const LinearProPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Linear Progress Indicators'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearProgressIndicator(), // Default LinearProgressIndicator

            SizedBox(height: 20),

            LinearProgressIndicator(
              value: 0.5, // Set progress value (0.0 to 1.0)
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ), // Customized LinearProgressIndicator

            SizedBox(height: 20),

            LinearProgressIndicator(
              value: 0.7,
              minHeight: 10, // Set minimum height
              backgroundColor: Colors.red,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ), // Another customized LinearProgressIndicator
          ],
        ),
      ),
    );
  }
}
