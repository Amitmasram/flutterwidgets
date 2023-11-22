import 'package:flutter/material.dart';

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // In this example: Create a TabController with 3 tabs, and link it to this widget's state
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // In this example: Dispose of the TabController when the widget is disposed
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBarView Example'),
        // In this example: TabBar is used to display the tabs at the top of the screen.
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
          ],
        ),
      ),
      // In this example: TabBarView is used to define the content associated with each tab.
      // The content is provided as a list of widgets, and the selected content is displayed based on the active tab.
      body: TabBarView(
        controller: _tabController,
        children: const [
          // In this example: Content for Tab 1
          Center(child: Text('Content for Tab 1')),

          // In this example: Content for Tab 2
          Center(child: Text('Content for Tab 2')),

          // In this example: Content for Tab 3
          Center(child: Text('Content for Tab 3')),
        ],
      ),
    );
  }
}
