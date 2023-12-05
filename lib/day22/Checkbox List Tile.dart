import 'package:flutter/material.dart';

class CheckBoxListTileEx extends StatelessWidget {
  const CheckBoxListTileEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CheckboxListTile Example'),
        ),
        body: const MyCheckboxList(),
      ),
    );
  }
}

class MyCheckboxList extends StatefulWidget {
  const MyCheckboxList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyCheckboxListState createState() => _MyCheckboxListState();
}

class _MyCheckboxListState extends State<MyCheckboxList> {
  List<bool?> _isCheckedList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CheckboxListTile(
          title: const Text('Item 1'),
          value: _isCheckedList[0],
          onChanged: (bool? value) {
            setState(() {
              _isCheckedList[0] = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Item 2'),
          value: _isCheckedList[1],
          onChanged: (bool? value) {
            setState(() {
              _isCheckedList[1] = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Item 3'),
          value: _isCheckedList[2],
          onChanged: (bool? value) {
            setState(() {
              _isCheckedList[2] = value;
            });
          },
        ),
      ],
    );
  }
}
