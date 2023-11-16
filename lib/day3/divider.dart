import 'package:flutter/material.dart';

// This is an example widget demonstrating the use of ListTile and Divider in a ListView.
// In this example:
// - MyListWithDivider is a StatelessWidget containing a ListView with ListTile and Divider.
// - Each ListTile represents an item in the list.
// - Divider is used to provide a horizontal line separating items.

class MyListWithDivider extends StatelessWidget {
  const MyListWithDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: const <Widget>[
          ListTile(
            title: Text('Item 1'),
          ),
          Divider(
            thickness: 2,
          ), // Horizontal line to separate items
          ListTile(
            title: Text('Item 2'),
          ),
          Divider(),
          ListTile(
            title: Text('Item 3'),
          ),
        ],
      ),
    );
  }
}

///
class MessageList extends StatelessWidget {
  const MessageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          // Alternate background colors for messages
          Color bgColor = index.isEven ? Colors.blue[100]! : Colors.green[100]!;

          return Column(
            children: <Widget>[
              Container(
                color: bgColor,
                child: ListTile(
                  title: Text('Message $index'),
                  subtitle: Text('Tap to view details'),
                  onTap: () {
                    // Handle tap action
                    // For now, let's print a message to the console
                    print('Tapped on Message $index');
                  },
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey[400],
              ),
            ],
          );
        },
      ),
    );
  }
}
