import 'package:flutter/material.dart';

class MyRadioGroup extends StatefulWidget {
  const MyRadioGroup({super.key});

  @override
  _MyRadioGroupState createState() => _MyRadioGroupState();
}

class _MyRadioGroupState extends State<MyRadioGroup> {
  String selectedRadio = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RadioListTile<String>(
            title: const Text('Option 1'),
            value: 'Option 1',
            groupValue: selectedRadio,
            onChanged: (value) {
              setState(() {
                selectedRadio = value!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Option 2'),
            value: 'Option 2',
            groupValue: selectedRadio,
            onChanged: (value) {
              setState(() {
                selectedRadio = value!;
              });
            },
          ),
          // Add more RadioListTile widgets for additional options

          // Stylish Radio
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Stylish Radio',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 'Stylish Option 1',
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value!;
                        });
                      },
                    ),
                    const Text('Stylish Option 1'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 'Stylish Option 2',
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value!;
                        });
                      },
                    ),
                    const Text('Stylish Option 2'),
                  ],
                ),
                // Add more stylish radio options as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
