import 'package:flutter/material.dart';

class PlatFormMenuBarEx extends StatelessWidget {
  const PlatFormMenuBarEx({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const Center(
        child: Text('Your content goes here'),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Platform Menu Bar'),
      backgroundColor: _getAppBarColor(context),
      elevation: _getAppBarElevation(context),
    );
  }

  Color _getAppBarColor(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? Colors.blue // Customize iOS color
        : Colors.green; // Customize Android color
  }

  double _getAppBarElevation(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? 0.0
        : 4.0; // Customize elevation for Android
  }
}
