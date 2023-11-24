// ignore: file_names
import 'package:flutter/material.dart';

class SliverListEx extends StatelessWidget {
  const SliverListEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SliverList Example'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('SliverList Example'),
                background: Image.network(
                  'https://example.com/your_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                    subtitle: Text('Subtitle $index'),
                    leading: const Icon(Icons.star),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Handle item tap
                    },
                  );
                },
                childCount: 50, // Adjust the count as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
