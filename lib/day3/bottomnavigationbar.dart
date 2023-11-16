import 'package:flutter/material.dart';

///-----------BottomNavigationBar--------------
// This is an example Flutter app demonstrating the usage of BottomNavigationBar.
// In this example:
// - MyApp is the main entry point of the application.
// - MyHomePage is a StatefulWidget representing the main page with a BottomNavigationBar.
// - _MyHomePageState maintains the state of the MyHomePage widget.
// - HomeScreen, ExploreScreen, and ProfileScreen are StatelessWidget representing different screens or views.
// - BottomNavigationBar is used for navigation between Home, Explore, and Profile screens.

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _currentIndex = 0;

  // List of pages to be displayed in the app
  final List<Widget> _pages = [
    const HomeScreen(),
    const ExploreScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Example'),
      ),
      body: _pages[_currentIndex], // Display the current page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          // Handle navigation item taps
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Screen'),
    );
  }
}

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Explore Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Screen'),
    );
  }
}
