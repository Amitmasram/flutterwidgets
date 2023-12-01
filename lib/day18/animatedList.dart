import 'package:flutter/material.dart';

class AnimatedListEx extends StatelessWidget {
  const AnimatedListEx({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: MyAnimatedList(),
    );
  }
}

class MyAnimatedList extends StatefulWidget {
  const MyAnimatedList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAnimatedListState createState() => _MyAnimatedListState();
}

class _MyAnimatedListState extends State<MyAnimatedList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  // ignore: prefer_final_fields
  List<String> _data = ["Item 1", "Item 2", "Item 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedList Example'),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _data.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(_data[index], animation, index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildItem(String item, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        title: Text(item),
        onTap: () => _removeItem(index),
      ),
    );
  }

  void _addItem() {
    setState(() {
      _data.add("New Item");
      _listKey.currentState?.insertItem(_data.length - 1);
    });
  }

  void _removeItem(int index) {
    setState(() {
      String removedItem = _data.removeAt(index);
      _listKey.currentState?.removeItem(
        index,
        (context, animation) => _buildItem(removedItem, animation, index),
      );
    });
  }
}

//////////////////-----------------------------------///////////////////

class AnimatedListEx2 extends StatelessWidget {
  const AnimatedListEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: MyAnimatedList2(),
    );
  }
}

class MyAnimatedList2 extends StatefulWidget {
  const MyAnimatedList2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAnimatedList2State createState() => _MyAnimatedList2State();
}

class _MyAnimatedList2State extends State<MyAnimatedList2> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<_ListItem> _data = [];

  @override
  void initState() {
    super.initState();
    _data = List.generate(
      5,
      (index) => _ListItem(
        key: UniqueKey(),
        value: 'Item $index',
        type: index % 2 == 0 ? ItemType.Normal : ItemType.Special,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cool AnimatedList Example'),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _data.length,
        itemBuilder: (context, index, animation) {
          final item = _data[index];
          return _buildItem(item, animation);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildItem(_ListItem item, Animation<double> animation) {
    if (item.type == ItemType.Normal) {
      return SizeTransition(
        sizeFactor: animation,
        child: ListTile(
          title: Text(item.value),
          subtitle: const Text('Normal Item'),
          onTap: () => _removeItem(item),
        ),
      );
    } else {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(item.value),
            subtitle: const Text('Special Item'),
            onTap: () => _removeItem(item),
          ),
        ),
      );
    }
  }

  void _addItem() {
    final newItem = _ListItem(
      key: UniqueKey(),
      value: 'New Item',
      type: _data.length % 2 == 0 ? ItemType.Normal : ItemType.Special,
    );

    setState(() {
      _data.add(newItem);
      _listKey.currentState?.insertItem(_data.length - 1);
    });
  }

  void _removeItem(_ListItem item) {
    final index = _data.indexOf(item);

    setState(() {
      _data.remove(item);
      _listKey.currentState?.removeItem(
        index,
        (context, animation) => _buildItem(item, animation),
      );
    });
  }
}

enum ItemType { Normal, Special }

class _ListItem {
  final Key key;
  final String value;
  final ItemType type;

  _ListItem({
    required this.key,
    required this.value,
    required this.type,
  });
}
