import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class ExpandableWidget extends StatelessWidget {
  const ExpandableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ExpandableNotifier(
        child: Column(
          children: <Widget>[
            Expandable(
              collapsed: _buildCollapsed(),
              expanded: _buildExpanded(),
            ),
            // You can add more Expandable widgets if needed
          ],
        ),
      ),
    );
  }

  Widget _buildCollapsed() {
    return const ListTile(
      title: Text('Click to expand'),
    );
  }

  Widget _buildExpanded() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text('Expanded content goes here'),
          // Add more widgets as needed
        ],
      ),
    );
  }
}
