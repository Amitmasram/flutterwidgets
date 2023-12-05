import 'package:flutter/material.dart';

class ChoiceChipEx extends StatefulWidget {
  const ChoiceChipEx({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChoiceChipExState createState() => _ChoiceChipExState();
}

class _ChoiceChipExState extends State<ChoiceChipEx> {
  String selectedChoice = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choice Chip Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ChoiceChip(
              label: const Text('Option 1'),
              selected: selectedChoice == 'Option 1',
              onSelected: (bool selected) {
                setState(() {
                  selectedChoice = selected ? 'Option 1' : '';
                });
              },
            ),
            const SizedBox(height: 10),
            ChoiceChip(
              label: const Text('Option 2'),
              selected: selectedChoice == 'Option 2',
              onSelected: (bool selected) {
                setState(() {
                  selectedChoice = selected ? 'Option 2' : '';
                });
              },
            ),
            const SizedBox(height: 10),
            Text('Selected Choice: $selectedChoice'),
          ],
        ),
      ),
    );
  }
}
