import 'package:flutter/material.dart';

class GridTileBarEx extends StatelessWidget {
  const GridTileBarEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Grid Tile Bar Example'),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return GridTile(
              child: Container(
                color: Colors.blue, // Placeholder color
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: Colors.black.withOpacity(0.5),
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Title $index',
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

//////////////////--------------------////////////////////////

class GridTileBarEx2 extends StatelessWidget {
  const GridTileBarEx2({super.key});

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
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return GridTile(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/image_$index.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 8.0,
                      left: 8.0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              'Likes: 42',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

//////////////////////-----------------------------------///////////////

class GridTileBarEx3 extends StatelessWidget {
  const GridTileBarEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GridTileBar Example'),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return GridTile(
              header: GridTileBar(
                title: Text('Title $index'),
                backgroundColor: Colors.blue,
              ),
              // ignore: sort_child_properties_last
              child: Container(
                color: Colors.blue, // Placeholder color
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black.withOpacity(0.5),
                title: Text('Subtitle $index'),
                leading: const Icon(Icons.favorite),
                trailing: IconButton(
                  icon: const Icon(Icons.info),
                  onPressed: () {
                    // Handle tap on the info icon
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
