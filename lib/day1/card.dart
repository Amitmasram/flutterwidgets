import 'package:flutter/material.dart';


class MyCardWithTextButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card with TextButton Example'),
      ),
      body: Center(
        child: Card(
          elevation: 5.0,
          margin: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('Card Title'),
                subtitle: Text('Subtitle goes here'),
                leading: Icon(Icons.star),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: () {
                    // Handle button press
                    print('TextButton pressed');
                  },
                  child: Text('Click Me'),
                  style: TextButton.styleFrom(
                    primary: Colors.blue, // Customize text color
                  ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popup Card Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showPopupCard(context);
          },
          child: Text('Show Popup Card'),
        ),
      ),
    );
  }

  void _showPopupCard(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Card(
            elevation: 5.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text('Popup Card Title'),
                  subtitle: Text('Subtitle goes here'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Additional Content',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the bottom sheet
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
