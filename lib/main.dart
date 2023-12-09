import 'package:flutter/material.dart';
import 'package:flutterwidgets/day26/iconButton.dart';

// 🚀 Follow me on Instagram: https://www.instagram.com/skytech_28/
// 💻 Check out my GitHub: https://github.com/Amitmasram
// 👔 Connect with me on LinkedIn: https://www.linkedin.com/in/amit-masram/

void main() {
  runApp(const MyApp());
}

/// The main application widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp widget to set up the Flutter application
    return const MaterialApp(home: IconButtonEx2());
  }
}
