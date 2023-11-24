import 'package:flutter/material.dart';

class SliverGridEx extends StatelessWidget {
  const SliverGridEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 8.0, // Spacing between columns
                mainAxisSpacing: 8.0, // Spacing between rows
                childAspectRatio:
                    1.0, // Ratio of width to height for each child
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  // Replace with your widget creation logic
                  return Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text('Item $index'),
                    ),
                  );
                },
                childCount: 10, // Number of items in the grid
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////

class SliverGridCool extends StatelessWidget {
  const SliverGridCool({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cool App'),
      ),
      body: const GridList(),
    );
  }
}

class GridList extends StatelessWidget {
  const GridList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.8,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(index),
              ),
            );
          },
          child: Card(
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  'https://placekitten.com/200/200?image=$index',
                  fit: BoxFit.cover,
                  height: 120.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Item $index',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://placekitten.com/300/300?image=$index',
              fit: BoxFit.cover,
              height: 200.0,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Detail for Item $index',
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
