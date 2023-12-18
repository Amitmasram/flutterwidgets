import 'package:flutter/material.dart';

class SliverToBoxAdapterEx extends StatelessWidget {
  const SliverToBoxAdapterEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              // Your app bar configuration
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 100.0,
                color: Colors.blue,
                child: const Center(
                  child: Text('Non-scrollable content'),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                childCount: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//////////////

class SliverToBoxAdapterEx2 extends StatelessWidget {
  const SliverToBoxAdapterEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _scrollController;
  double _appBarHeight = 200.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _appBarHeight = 200.0 - _scrollController.offset.clamp(0.0, 200.0);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Complex UI Example'),
              background: Image.network(
                'https://example.com/your_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Featured Items',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Animated card 1
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 100.0,
                    width: _appBarHeight,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Animated Card 1',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Animated card 2
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 100.0,
                    width: _appBarHeight * 0.8,
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        'Animated Card 2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  // Add more complex UI elements as needed
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('List Item $index'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}

/////////////////////////////////////

class SliverToBoxAdapeterEx3 extends StatelessWidget {
  const SliverToBoxAdapeterEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePagem(),
    );
  }
}

class MyHomePagem extends StatefulWidget {
  const MyHomePagem({super.key});

  @override
  _MyHomePagemState createState() => _MyHomePagemState();
}

class _MyHomePagemState extends State<MyHomePagem> {
  late ScrollController _scrollController;
  // ignore: prefer_final_fields
  double _headerMaxHeight = 200.0;
  // ignore: unused_field
  double _headerMinHeight = 80.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  double get _headerHeight =>
      _headerMaxHeight - _scrollController.offset.clamp(0.0, _headerMaxHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: _headerMaxHeight,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Collapsible Header'),
              background: Image.network(
                'https://example.com/your_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Featured Items',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Add your complex UI elements here
                  // For example, a list of animated cards
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 100.0,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Animated Card 1',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 100.0,
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        'Animated Card 2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  // Add more complex UI elements as needed
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('List Item $index'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
