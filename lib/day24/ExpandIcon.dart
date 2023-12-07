import 'package:flutter/material.dart';

class ExpandIconEx extends StatelessWidget {
  const ExpandIconEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ExpandIcon Example'),
        ),
        body: const MyExpansionPanelList(),
      ),
    );
  }
}

class MyExpansionPanelList extends StatefulWidget {
  const MyExpansionPanelList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyExpansionPanelListState createState() => _MyExpansionPanelListState();
}

class _MyExpansionPanelListState extends State<MyExpansionPanelList> {
  // ignore: prefer_final_fields
  List<Item> _data = generateItems(5);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data[index].isExpanded = !isExpanded;
          });
        },
        children: _data.map<ExpansionPanel>((Item item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.headerValue),
              );
            },
            body: ListTile(
              title: Text(item.expandedValue),
            ),
            isExpanded: item.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

///////////////--------------------/////////////////////////

class ExpandIconEx2 extends StatelessWidget {
  const ExpandIconEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cool Expandable Cards'),
        ),
        body: const MyExpandableCardList(),
      ),
    );
  }
}

class MyExpandableCardList extends StatefulWidget {
  const MyExpandableCardList({super.key});

  @override
  _MyExpandableCardListState createState() => _MyExpandableCardListState();
}

class _MyExpandableCardListState extends State<MyExpandableCardList> {
  List<ExpandableCardItem> _cardItems = generateCardItems(5);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cardItems.length,
      itemBuilder: (context, index) {
        return ExpandableCard(
          item: _cardItems[index],
        );
      },
    );
  }
}

class ExpandableCardItem {
  ExpandableCardItem({
    required this.title,
    required this.content,
    this.isExpanded = false,
  });

  String title;
  String content;
  bool isExpanded;
}

List<ExpandableCardItem> generateCardItems(int numberOfItems) {
  return List<ExpandableCardItem>.generate(numberOfItems, (int index) {
    return ExpandableCardItem(
      title: 'Card $index',
      content:
          'This is some content for card $index. You can add more details here.',
    );
  });
}

class ExpandableCard extends StatelessWidget {
  final ExpandableCardItem item;

  ExpandableCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text(item.title),
        subtitle: Text(item.content),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ExpandIcon(
                  isExpanded: item.isExpanded,
                  onPressed: (bool isExpanded) {
                    // Toggle the expansion state when the icon is pressed
                    setState(() {
                      item.isExpanded = !isExpanded;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}
