import 'package:flutter/material.dart';

///------- TabBar-------

// This is an example Flutter app demonstrating the usage of TabBar and TabBarView.
// In this example:
// - MyApp is the main entry point of the application.
// - MyTabBarExample is a StatelessWidget demonstrating the use of TabBar with three tabs.
// - HomeScreen, ExploreScreen, and ProfileScreen are StatelessWidget representing different screens for each tab.

class MyTabBarExample extends StatelessWidget {
  const MyTabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Example'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.explore), text: 'Explore'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HomeScreen(),
            ExploreScreen(),
            ProfileScreen(),
          ],
        ),
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
