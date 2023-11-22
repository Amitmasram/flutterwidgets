import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyCardWithTextButtonPage extends StatelessWidget {
  const MyCardWithTextButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card with TextButton Example'),
      ),
      body: Center(
        child: Card(
          elevation: 5.0,
          margin: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text('Card Title'),
                subtitle: Text('Subtitle goes here'),
                leading: Icon(Icons.star),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: () {
                    // Handle button press
                    if (kDebugMode) {
                      print('TextButton pressed');
                    }
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.blue, // Customize text color
                  ),
                  child: const Text('Click Me'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///--- PupupCard : Example

class PopupCard extends StatelessWidget {
  const PopupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popup Card Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showPopupCard(context);
          },
          child: const Text('Show Popup Card'),
        ),
      ),
    );
  }

  void _showPopupCard(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ListTile(
                  title: Text('Popup Card Title'),
                  subtitle: Text('Subtitle goes here'),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Additional Content',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the bottom sheet
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
