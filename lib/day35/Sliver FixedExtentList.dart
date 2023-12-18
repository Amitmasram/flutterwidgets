import 'package:flutter/material.dart';

class SliverFixedExtentListEx extends StatelessWidget {
  const SliverFixedExtentListEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('SliverFixedExtentList Example'),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 50.0, // Fixed height for each item
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                childCount: 20, // Number of items in the list
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////

class SliverFixedExtentListEx2 extends StatelessWidget {
  const SliverFixedExtentListEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Parallax SliverFixedExtentList'),
                background: Image.network(
                  'https://placekitten.com/800/400', // Replace with your image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 200.0, // Fixed height for each item
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ParallaxItem(index);
                },
                childCount: 10, // Number of items in the list
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParallaxItem extends StatelessWidget {
  final int index;

  const ParallaxItem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                'https://placekitten.com/800/400', // Replace with your image URL
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 10.0,
              child: Text(
                'Item $index',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////

class SliverFixedExtentListEx3 extends StatelessWidget {
  const SliverFixedExtentListEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Staggered Animation SliverFixedExtentList'),
                background: Image.network(
                  'https://placekitten.com/800/400', // Replace with your image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 150.0, // Fixed height for each item
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return StaggeredItem(index);
                },
                childCount: 10, // Number of items in the list
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StaggeredItem extends StatelessWidget {
  final int index;

  const StaggeredItem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    final animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: ModalRoute.of(context)!.animation!,
        curve: Interval(
          0.1 * index,
          0.5 + 0.1 * index,
          curve: Curves.easeInOut,
        ),
      ),
    );

    return FadeTransition(
      // ignore: unnecessary_cast
      opacity: animation as Animation<double>,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.teal,
        child: Center(
          child: Text(
            'Item $index',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////

class SliverFixedExtentListEx4 extends StatelessWidget {
  const SliverFixedExtentListEx4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                    'Rotation and Scaling Animation SliverFixedExtentList'),
                background: Image.network(
                  'https://placekitten.com/800/400', // Replace with your image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 150.0, // Fixed height for each item
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return AnimatedItem(index);
                },
                childCount: 10, // Number of items in the list
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedItem extends StatefulWidget {
  final int index;

  const AnimatedItem(this.index, {super.key});

  @override
  _AnimatedItemState createState() => _AnimatedItemState();
}

class _AnimatedItemState extends State<AnimatedItem>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Start the animation when the item is built
    _animationController.forward();
  }

  @override
  void dispose() {
    // Dispose of the animation controller when the widget is disposed
    _animationController.dispose();
    super.dispose();
  }

  void _navigateToDetailsScreen() {
    // Implement your navigation logic here
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailsScreen(itemIndex: widget.index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rotationAnimation =
        Tween(begin: 0.0, end: 0.2).animate(_animationController);
    final scaleAnimation =
        Tween(begin: 1.0, end: 0.8).animate(_animationController);

    return GestureDetector(
      onTap: _navigateToDetailsScreen,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.rotate(
            angle: rotationAnimation.value * (widget.index.isEven ? 1 : -1),
            child: Transform.scale(
              scale: scaleAnimation.value,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Item ${widget.index}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final int itemIndex;

  const DetailsScreen({super.key, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Center(
        child: Text('Details for Item $itemIndex'),
      ),
    );
  }
}

////////////////////////////////////

class SliverFixedExtentListEx5 extends StatelessWidget {
  const SliverFixedExtentListEx5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Complex SliverFixedExtentList Example'),
                background: Image.network(
                  'https://placekitten.com/800/400', // Replace with your image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 200.0, // Fixed height for each item
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ComplexItem(index);
                },
                childCount: 10, // Number of items in the list
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ComplexItem extends StatefulWidget {
  final int index;

  const ComplexItem(this.index, {super.key});

  @override
  _ComplexItemState createState() => _ComplexItemState();
}

class _ComplexItemState extends State<ComplexItem>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final rotationAnimation =
        Tween(begin: 0.0, end: 0.2).animate(_animationController);
    final scaleAnimation =
        Tween(begin: 1.0, end: 0.8).animate(_animationController);

    return GestureDetector(
      onTap: _toggleExpansion,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.rotate(
            angle: rotationAnimation.value * (widget.index.isEven ? 1 : -1),
            child: Transform.scale(
              scale: scaleAnimation.value,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title ${widget.index}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: _isExpanded
                          ? Text(
                              'Description for Item ${widget.index}. ' * 5,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/////////////////////////

