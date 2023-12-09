import 'package:flutter/material.dart';

class GridTileEx extends StatelessWidget {
  const GridTileEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GridTile Example'),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            mainAxisSpacing: 8.0, // Spacing between rows
            crossAxisSpacing: 8.0, // Spacing between columns
          ),
          itemCount: 6, // Number of items in the grid
          itemBuilder: (BuildContext context, int index) {
            return GridTile(
              child: Container(
                color: Colors.teal,
                child: Center(
                  child: Text(
                    'Tile $index',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/////////////////////////////-----------------------------------///////////

class GridTileEx2 extends StatelessWidget {
  const GridTileEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GridTile Example'),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return GridTile(
              // ignore: sort_child_properties_last
              child: Image.network(
                'https://placekitten.com/200/200', // Example image URL
                fit: BoxFit.cover,
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black.withOpacity(0.5),
                title: Text(
                  'Image $index',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

///////////////--------------------///////////////////

class GridTileEx3 extends StatelessWidget {
  const GridTileEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cool GridTile Example'),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return CoolGridTile(
              title: 'Item $index',
            );
          },
        ),
      ),
    );
  }
}

class CoolGridTile extends StatefulWidget {
  final String title;

  const CoolGridTile({super.key, required this.title});

  @override
  // ignore: library_private_types_in_public_api
  _CoolGridTileState createState() => _CoolGridTileState();
}

class _CoolGridTileState extends State<CoolGridTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
      // ignore: sort_child_properties_last
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.purple,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: RotationTransition(
          turns: _controller,
          child: Center(
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black.withOpacity(0.7),
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
