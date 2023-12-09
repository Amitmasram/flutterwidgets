import 'package:flutter/material.dart';

class GridViewEx extends StatelessWidget {
  const GridViewEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GridView Example'),
        ),
        body: const MyGridView(),
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 8.0, // Spacing between columns
        mainAxisSpacing: 8.0, // Spacing between rows
      ),
      itemCount: 10, // Number of items in the grid
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.blue, // Background color of each grid item
          alignment: Alignment.center,
          child: Text(
            'Item $index',
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}

//////////////////--------------GridView.Builder----------------////////

class GridViewEx2 extends StatelessWidget {
  const GridViewEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GridView.builder Example'),
        ),
        body: const MyGridViewBuilder(),
      ),
    );
  }
}

class MyGridViewBuilder extends StatelessWidget {
  const MyGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            'Item $index',
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}

/////////////////////////////-----------GridView.Custom--------------/////////////

class GridViewEx3 extends StatelessWidget {
  const GridViewEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GridView.custom Example'),
        ),
        body: const MyGridViewCustom(),
      ),
    );
  }
}

class MyGridViewCustom extends StatelessWidget {
  const MyGridViewCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: Text(
              'Item $index',
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
        childCount: 10,
      ),
    );
  }
}

/////////////////////----------GridView.count -------------------//////////////

class GridViewEx4 extends StatelessWidget {
  const GridViewEx4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GridView.count Example'),
        ),
        body: const MyGridViewCount(),
      ),
    );
  }
}

class MyGridViewCount extends StatelessWidget {
  const MyGridViewCount({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: List.generate(10, (index) {
        return Container(
          color: Colors.orange,
          alignment: Alignment.center,
          child: Text(
            'Item $index',
            style: const TextStyle(color: Colors.white),
          ),
        );
      }),
    );
  }
}

///////////////////////////////////////////----------

class GridViewEx5 extends StatelessWidget {
  const GridViewEx5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cool GridView Example'),
        ),
        body: MyCoolGridView(),
      ),
    );
  }
}

class MyCoolGridView extends StatelessWidget {
  final List<String> imageUrls = [
    'https://placekitten.com/200/200',
    'https://placekitten.com/201/201',
    'https://placekitten.com/202/202',
    'https://placekitten.com/203/203',
    'https://placekitten.com/204/204',
    'https://placekitten.com/205/205',
    'https://placekitten.com/206/206',
    'https://placekitten.com/207/207',
    'https://placekitten.com/208/208',
    'https://placekitten.com/209/209',
  ];

  MyCoolGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // Add your onTap logic here
            print('Tapped on image $index');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(imageUrls[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
