import 'package:flutter/material.dart';

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
    return ListView(
      children: _data.map<Widget>((Item item) {
        return ExpansionPanelList(
          elevation: 1,
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              item.isExpanded = !isExpanded;
            });
          },
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item.headerValue),
                );
              },
              body: ListTile(
                title: Text(item.expandedValue),
              ),
              isExpanded: item.isExpanded,
            ),
          ],
        );
      }).toList(),
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

///////////////////////////////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\

class MyCoolExpansionPanel extends StatefulWidget {
  const MyCoolExpansionPanel({super.key});

  @override
  _MyCoolExpansionPanelState createState() => _MyCoolExpansionPanelState();
}

class _MyCoolExpansionPanelState extends State<MyCoolExpansionPanel> {
  List<Item> _data = generateItems(5);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: ExpansionPanelList(
          elevation: 1,
          expandedHeaderPadding: EdgeInsets.all(0),
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _data[index].isExpanded = !isExpanded;
            });
          },
          children: _data.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(
                    item.headerValue,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
              body: ListTile(
                title: Text(item.expandedValue),
                subtitle: Text('To customize further, add more widgets here!'),
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}

// class Item {
//   Item({
//     required this.expandedValue,
//     required this.headerValue,
//     this.isExpanded = false,
//   });

//   String expandedValue;
//   String headerValue;
//   bool isExpanded;
// }

// List<Item> generateItems(int numberOfItems) {
//   return List<Item>.generate(numberOfItems, (int index) {
//     return Item(
//       headerValue: 'Panel $index',
//       expandedValue: 'This is item number $index',
//     );
//   });
// }
