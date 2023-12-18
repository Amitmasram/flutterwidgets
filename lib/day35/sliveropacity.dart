import 'package:flutter/material.dart';

class SliverOpacityEx extends StatelessWidget {
  const SliverOpacityEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Sliver with Opacity'),
                background: Image.network(
                  'https://example.com/your_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Opacity(
                opacity: 0.7, // Set the desired opacity value
                child: Container(
                  height: 300.0, // Adjust the height as needed
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Sliver Content with Opacity',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Other slivers go here
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////////////
class SliverOpacityEx2 extends StatelessWidget {
  const SliverOpacityEx2({super.key});

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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Beautiful Sliver UI'),
              background: Image.network(
                'https://example.com/your_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverOpacity(
            opacity: 0.7,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                    tileColor: index % 2 == 0 ? Colors.blue : Colors.green,
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200.0,
              color: Colors.orange,
              child: const Center(
                child: Text(
                  'Additional Content',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your FAB functionality here
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/////////////////////////////

class SliverOpacityEx3 extends StatelessWidget {
  const SliverOpacityEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePagex(),
    );
  }
}

class MyHomePagex extends StatefulWidget {
  const MyHomePagex({super.key});

  @override
  _MyHomePagexState createState() => _MyHomePagexState();
}

class _MyHomePagexState extends State<MyHomePagex> {
  // ignore: prefer_final_fields
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Complex Sliver UI'),
              background: Image.network(
                'https://example.com/your_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 150.0,
              color: Colors.orange,
              child: const Center(
                child: Text(
                  'Header Section',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SliverOpacity(
            opacity: _opacity,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return AnimatedOpacity(
                    opacity: _opacity,
                    duration: const Duration(milliseconds: 500),
                    child: Card(
                      margin: const EdgeInsets.all(8.0),
                      elevation: 4.0,
                      child: ListTile(
                        title: Text('Item $index'),
                        subtitle: Text('Subtitle for Item $index'),
                        onTap: () {
                          // Handle item tap
                        },
                      ),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 150.0,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Footer Section',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(milliseconds: 500),
        child: FloatingActionButton(
          onPressed: () {
            // Add your FAB functionality here
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

////////////////////

class SliverOpacityEx5 extends StatelessWidget {
  const SliverOpacityEx5({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePagea(),
    );
  }
}

class MyHomePagea extends StatefulWidget {
  const MyHomePagea({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageaState createState() => _MyHomePageaState();
}

class _MyHomePageaState extends State<MyHomePagea> {
  double _appBarMaxHeight = 200.0;
  double _appBarMinHeight = 80.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: _appBarMaxHeight,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Complex Sliver UI'),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://example.com/your_image.jpg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverOpacity(
            opacity: 0.9,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue.withOpacity(0.7),
                    ),
                    child: ListTile(
                      title: Text('Item $index',
                          style: const TextStyle(color: Colors.white)),
                      subtitle: Text('Subtitle for Item $index',
                          style: const TextStyle(color: Colors.white70)),
                      onTap: () {
                        // Handle item tap
                      },
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 150.0,
              color: Colors.orange,
              child: const Center(
                child: Text(
                  'Footer Section',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: _getFabOpacity(),
        duration: const Duration(milliseconds: 300),
        child: FloatingActionButton(
          onPressed: () {
            // Add your FAB functionality here
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  double _getFabOpacity() {
    double fabOpacity = (_appBarMaxHeight - _appBarMinHeight) /
        (_appBarMaxHeight - kToolbarHeight);
    return fabOpacity;
  }
}

//////////////////////////////

class SliverOpacityEx4 extends StatelessWidget {
  const SliverOpacityEx4({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePages(),
    );
  }
}

class MyHomePages extends StatefulWidget {
  const MyHomePages({super.key});

  @override
  _MyHomePagesState createState() => _MyHomePagesState();
}

class _MyHomePagesState extends State<MyHomePages> {
  late ScrollController _scrollController;
  double _appBarMaxHeight = 200.0;
  double _appBarMinHeight = 80.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) {
          // Check if the ScrollController has attached a position
          if (_scrollController.hasClients) {
            setState(() {
              // Rebuild the widget on scroll to update the UI
            });
          }
          return false;
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: _appBarMaxHeight,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Animated Sliver UI'),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      'https://example.com/your_image.jpg',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverOpacity(
              opacity: _getOpacity(),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.blue.withOpacity(0.7),
                      ),
                      child: Center(
                        child: Text(
                          'Item $index',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: 20,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 150.0,
                color: Colors.orange,
                child: const Center(
                  child: Text(
                    'Footer Section',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your FAB functionality here
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.red.withOpacity(_getFabOpacity()),
      ),
    );
  }

  double _getOpacity() {
    // Check if the ScrollController has attached a position
    if (_scrollController.hasClients) {
      double scrollPercentage =
          (_scrollController.offset / (_appBarMaxHeight - _appBarMinHeight))
              .clamp(0.0, 1.0);
      return 1.0 - scrollPercentage;
    }
    return 1.0; // Default opacity when not attached
  }

  double _getFabOpacity() {
    // Check if the ScrollController has attached a position
    if (_scrollController.hasClients) {
      double fabOpacity = _scrollController.offset / _appBarMaxHeight;
      return fabOpacity;
    }
    return 1.0; // Default opacity when not attached
  }
}

////////////////////////////////////////
class SliverOpacityEx6 extends StatelessWidget {
  const SliverOpacityEx6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePagek(),
    );
  }
}

class MyHomePagek extends StatefulWidget {
  const MyHomePagek({Key? key}) : super(key: key);

  @override
  _MyHomePagekState createState() => _MyHomePagekState();
}

class _MyHomePagekState extends State<MyHomePagek> {
  late ScrollController _scrollController;
  double _appBarMaxHeight = 200.0;
  double _appBarMinHeight = 80.0;
  double _fabOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (mounted) {
          setState(() {
            _fabOpacity = _calculateFabOpacity();
          });
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  double _calculateFabOpacity() {
    return 1.0 - (_scrollController.offset / _appBarMaxHeight).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: _appBarMaxHeight,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Animated Sliver UI'),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  AnimatedBackground(controller: _scrollController),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverOpacity(
            opacity: _calculateSliverOpacity(),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return AnimatedListItem(index: index);
                },
                childCount: 20,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 150.0,
              color: Colors.orange,
              child: const Center(
                child: Text(
                  'Footer Section',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: _fabOpacity,
        duration: const Duration(milliseconds: 300),
        child: FloatingActionButton(
          onPressed: () {
            // Add your FAB functionality here
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  double _calculateSliverOpacity() {
    return 1.0 -
        (_scrollController.offset / (_appBarMaxHeight - _appBarMinHeight))
            .clamp(0.0, 1.0);
  }
}

class AnimatedListItem extends StatelessWidget {
  final int index;

  const AnimatedListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blue.withOpacity(0.7),
      ),
      child: Center(
        child: Text(
          'Item $index',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

class AnimatedBackground extends StatelessWidget {
  final ScrollController controller;

  const AnimatedBackground({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        if (!controller.hasClients ||
            !controller.position.hasContentDimensions) {
          // Check if the controller is not disposed and has content dimensions
          return Container();
        }

        Color? backgroundColor = ColorTween(
          begin: Colors.blue,
          end: Colors.green,
        ).lerp(
          controller.offset / 200.0,
        );

        return Container(
          color: backgroundColor,
        );
      },
    );
  }
}
