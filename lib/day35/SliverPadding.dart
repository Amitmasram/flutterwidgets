import 'package:flutter/material.dart';

class SliverPaddingEx extends StatelessWidget {
  const SliverPaddingEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////

class SliverPaddingEx2 extends StatelessWidget {
  const SliverPaddingEx2({super.key});

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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Complex UI Example'),
              background: Image.network(
                'https://example.com/your_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return FadeTransition(
                    opacity: _animation,
                    child: Card(
                      elevation: 5.0,
                      child: ListTile(
                        title: Text('Item $index'),
                        subtitle: const Text('Some description here'),
                      ),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ScaleTransition(
                    scale: _animation,
                    child: Card(
                      elevation: 5.0,
                      child: Container(
                        color: Colors.blue,
                        child: Center(
                          child: Text('Grid Item $index'),
                        ),
                      ),
                    ),
                  );
                },
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

//////////////////////////////////////

class SliverPaddigEx3 extends StatelessWidget {
  const SliverPaddigEx3({super.key});

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
  // ignore: library_private_types_in_public_api
  _MyHomePagexState createState() => _MyHomePagexState();
}

class _MyHomePagexState extends State<MyHomePagex>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Complex UI Example'),
              background: Image.network(
                'https://example.com/your_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return FadeTransition(
                    opacity: _animation,
                    child: Card(
                      elevation: 5.0,
                      child: ListTile(
                        title: Text('Item $index'),
                        subtitle: const Text('Some description here'),
                      ),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return RotationTransition(
                    turns: _animation,
                    child: Card(
                      elevation: 5.0,
                      child: Container(
                        color: Colors.blue,
                        child: Center(
                          child: Text('Grid Item $index'),
                        ),
                      ),
                    ),
                  );
                },
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
