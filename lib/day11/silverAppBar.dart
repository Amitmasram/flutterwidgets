// ignore: file_names
import 'package:flutter/material.dart';

class SliverAppBarExample extends StatelessWidget {
  const SliverAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating:
                false, // Whether the app bar should become visible as soon as the user scrolls down
            pinned:
                true, // Whether the app bar should remain visible at the top
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('SliverAppBar Example'),
              background: Image.network(
                'https://example.com/your_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Other sliver widgets go here
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
    );
  }
}

////////////////////////////////////////

class SliverAppBarEx2 extends StatelessWidget {
  const SliverAppBarEx2({super.key});
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
              title: const Text('SliverAppBar Example'),
              centerTitle: true,
              titlePadding: const EdgeInsets.all(16.0),
              background: Image.network(
                'https://example.com/your_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // Correct placement of textTheme
            // textTheme: TextTheme(
            //   headline6: TextStyle(
            //     color: Colors.white,
            //     fontSize: 20.0,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ),
          // Other sliver widgets go here
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
    );
  }
}
