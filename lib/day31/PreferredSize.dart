import 'package:flutter/material.dart';

class PrefferedSizeEx extends StatelessWidget {
  const PrefferedSizeEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(
              80.0), // Set the preferred height of the app bar
          child: AppBar(
            title: const Text('My App'),
          ),
        ),
        body: const Center(
          child: Text('Hello, Flutter!'),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////

class PreferredSizeEx2 extends StatelessWidget {
  const PreferredSizeEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(120.0), // Set the preferred height of the app bar
          child: CustomAppBar(),
        ),
        body: Center(
          child: Text('Hello, Flutter!'),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(120.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.green],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: AppBar(
        title: const Text(
          'Custom App Bar',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0, // Remove the default shadow
        backgroundColor: Colors.transparent, // Make the app bar transparent
      ),
    );
  }
}
