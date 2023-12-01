import 'package:flutter/material.dart';

class MyReorderableList extends StatefulWidget {
  const MyReorderableList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyReorderableListState createState() => _MyReorderableListState();
}

class _MyReorderableListState extends State<MyReorderableList> {
  List<String> items = List.generate(5, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReorderableListView Example'),
      ),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final String item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
        children: List.generate(
          items.length,
          (index) => ListTile(
            key: Key('$index'),
            title: Text(items[index]),
          ),
        ),
      ),
    );
  }
}

/////////////////////----------------------///////////////

class MyCoolAppEx extends StatefulWidget {
  const MyCoolAppEx({Key? key}) : super(key: key);

  @override
  _MyCoolAppExState createState() => _MyCoolAppExState();
}

class _MyCoolAppExState extends State<MyCoolAppEx> {
  List<Color> cardColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cool ReorderableListView'),
        ),
        body: ReorderableListView(
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final Color color = cardColors.removeAt(oldIndex);
              cardColors.insert(newIndex, color);
            });
          },
          children: List.generate(
            cardColors.length,
            (index) => _buildReorderableItem(index),
          ),
        ),
      ),
    );
  }

  Widget _buildReorderableItem(int index) {
    return ReorderableDragStartListener(
      index: index,
      key: ValueKey(index),
      child: Card(
        color: cardColors[index],
        elevation: 3,
        child: ListTile(
          title: Text('Card $index'),
        ),
      ),
    );
  }
}
