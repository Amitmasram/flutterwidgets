import 'package:flutter/material.dart';

class TabPageSelectorEx extends StatelessWidget {
  const TabPageSelectorEx({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyTabbedPage(),
    );
  }
}

class MyTabbedPage extends StatelessWidget {
  const MyTabbedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Specify the number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Page Selector Example'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Contents of Tab 1
            Center(child: Text('Tab 1 Content')),

            // Contents of Tab 2
            Center(child: Text('Tab 2 Content')),

            // Contents of Tab 3
            Center(child: Text('Tab 3 Content')),
          ],
        ),
      ),
    );
  }
}

///////////////////////

class TabPageSelectorEx2 extends StatelessWidget {
  const TabPageSelectorEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyTabPageSelector(),
    );
  }
}

class MyTabPageSelector extends StatefulWidget {
  const MyTabPageSelector({super.key});

  @override
  _MyTabPageSelectorState createState() => _MyTabPageSelectorState();
}

class _MyTabPageSelectorState extends State<MyTabPageSelector> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex UI with TabPageSelector'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                Container(
                    color: Colors.blue,
                    child: const Center(child: Text('Page 1'))),
                Container(
                    color: Colors.green,
                    child: const Center(child: Text('Page 2'))),
                Container(
                    color: Colors.orange,
                    child: const Center(child: Text('Page 3'))),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          _buildTabPageSelector(),
        ],
      ),
    );
  }

  Widget _buildTabPageSelector() {
    return Container(
      height: 50.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3, // Number of pages
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              width: 80.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.all(8.0),
              child: Text('Tab $index'),
            ),
          );
        },
      ),
    );
  }
}

///////////////////////////

class TabPageSelectorEx3 extends StatelessWidget {
  const TabPageSelectorEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyComplexPage(),
    );
  }
}

class MyComplexPage extends StatefulWidget {
  const MyComplexPage({super.key});

  @override
  _MyComplexPageState createState() => _MyComplexPageState();
}

class _MyComplexPageState extends State<MyComplexPage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex UI with Tab Selector'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                _buildPage(color: Colors.blue, text: 'Page 1'),
                _buildPage(color: Colors.green, text: 'Page 2'),
                _buildPage(color: Colors.orange, text: 'Page 3'),
              ],
            ),
          ),
          _buildTabSelector(),
        ],
      ),
    );
  }

  Widget _buildPage({required Color color, required String text}) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildTabSelector() {
    return Container(
      height: 80.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              width: 80.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.all(8.0),
              child: Text('Tab $index',
                  style: const TextStyle(color: Colors.white)),
            ),
          );
        },
      ),
    );
  }
}

////////////////////////////

class TabPageSelectorEx4 extends StatelessWidget {
  const TabPageSelectorEx4({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyComplexTabBarPage(),
    );
  }
}

class MyComplexTabBarPage extends StatefulWidget {
  const MyComplexTabBarPage({super.key});

  @override
  _MyComplexTabBarPageState createState() => _MyComplexTabBarPageState();
}

class _MyComplexTabBarPageState extends State<MyComplexTabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex UI with TabBar'),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTabContent(color: Colors.blue, text: 'Page 1'),
                _buildTabContent(color: Colors.green, text: 'Page 2'),
                _buildTabContent(color: Colors.orange, text: 'Page 3'),
              ],
            ),
          ),
          _buildTabBar(),
        ],
      ),
    );
  }

  Widget _buildTabContent({required Color color, required String text}) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: Colors.grey[200],
      child: TabBar(
        controller: _tabController,
        tabs: [
          _buildTab(title: 'Tab 1'),
          _buildTab(title: 'Tab 2'),
          _buildTab(title: 'Tab 3'),
        ],
        indicatorColor: Colors.blue,
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.grey,
      ),
    );
  }

  Widget _buildTab({required String title}) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: _tabController.indexIsChanging &&
                  _tabController.index == _currentIndex
              ? Colors.blue.withOpacity(0.4)
              : Colors.transparent,
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
