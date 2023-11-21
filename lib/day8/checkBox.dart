import 'package:flutter/material.dart';

class CheckboxExamples extends StatefulWidget {
  const CheckboxExamples({super.key});

  @override
  _CheckboxExamplesState createState() => _CheckboxExamplesState();
}

class _CheckboxExamplesState extends State<CheckboxExamples> {
  bool isCheckedOption1 = false;
  bool isCheckedOption2 = false;
  bool isCheckedOption3 = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CheckboxListTile(
              title: const Text('Option 1'),
              value: isCheckedOption1,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedOption1 = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Option 2'),
              value: isCheckedOption2,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedOption2 = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Option 3'),
              value: isCheckedOption3,
              onChanged: (bool? value) {
                setState(() {
                  isCheckedOption3 = value ?? false;
                });
              },
            ),
            const SizedBox(height: 16),
            Text('Option 1: $isCheckedOption1'),
            Text('Option 2: $isCheckedOption2'),
            Text('Option 3: $isCheckedOption3'),
          ],
        ),
      ),
    );
  }
}

////////////---------------------//////////////////////
class CheckboxStylesExample extends StatefulWidget {
  const CheckboxStylesExample({super.key});

  @override
  _CheckboxStylesExampleState createState() => _CheckboxStylesExampleState();
}

class _CheckboxStylesExampleState extends State<CheckboxStylesExample> {
  bool isChecked1 = false;
  bool isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Checkbox with Default Style:'),
            Checkbox(
              value: isChecked1,
              onChanged: (bool? value) {
                setState(() {
                  isChecked1 = value ?? false;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('Checkbox with Custom Style:'),
            CustomCheckbox(
              value: isChecked2,
              onChanged: (bool? value) {
                setState(() {
                  isChecked2 = value ?? false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CustomCheckbox({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged?.call(!value);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.blue, // Border color when unchecked
          ),
          color: value
              ? Colors.blue
              : Colors.white, // Background color when checked
        ),
        padding: const EdgeInsets.all(8),
        child: value
            ? const Icon(
                Icons.check,
                size: 20,
                color: Colors.white, // Checkmark color
              )
            : null,
      ),
    );
  }
}
