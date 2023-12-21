import 'package:flutter/material.dart';

/*
Widget - 37 
where I Coverd the ToggleButton How to use and how to implement  the 
toggles in app

*/
class ToggleButtonEx extends StatelessWidget {
  const ToggleButtonEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ToggleButtons Example'),
        ),
        body: const MyToggleButtons(),
      ),
    );
  }
}

class MyToggleButtons extends StatefulWidget {
  const MyToggleButtons({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyToggleButtonsState createState() => _MyToggleButtonsState();
}

class _MyToggleButtonsState extends State<MyToggleButtons> {
  List<bool> isSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        // ignore: sort_child_properties_last
        children: const [
          Icon(Icons.format_bold),
          Icon(Icons.format_italic),
          Icon(Icons.format_underlined),
        ],
        isSelected: isSelected,
        onPressed: (index) {
          setState(() {
            isSelected[index] = !isSelected[index];
          });
        },
      ),
    );
  }
}

//////////////////////--- Ex2 --------////

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Filter Bar Example'),
        ),
        body: const MyFilterBar(),
      ),
    );
  }
}

class MyFilterBar extends StatefulWidget {
  const MyFilterBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyFilterBarState createState() => _MyFilterBarState();
}

class _MyFilterBarState extends State<MyFilterBar> {
  List<bool> isSelected = List.generate(4, (index) => false);

  List<FilterOption> filterOptions = [
    FilterOption('Option 1', Icons.star),
    FilterOption('Option 2', Icons.camera),
    FilterOption('Option 3', Icons.location_on),
    FilterOption('Option 4', Icons.watch),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Filters:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ToggleButtons(
            // ignore: sort_child_properties_last
            children: [
              for (var option in filterOptions)
                FilterButton(
                  label: option.label,
                  icon: option.icon,
                ),
            ],
            isSelected: isSelected,
            onPressed: (index) {
              setState(() {
                isSelected[index] = !isSelected[index];
              });
            },
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
            selectedColor: Colors.blue,
            fillColor: Colors.blue.withOpacity(0.2),
            borderWidth: 2,
            borderColor: Colors.blue,
          ),
          const SizedBox(height: 20),
          const Text(
            'Selected Filters:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              for (int i = 0; i < isSelected.length; i++)
                if (isSelected[i])
                  FilterChip(
                    label: Text(filterOptions[i].label),
                    onSelected: (value) {
                      setState(() {
                        isSelected[i] = !isSelected[i];
                      });
                    },
                    selected: isSelected[i],
                    backgroundColor: Colors.blue,
                    selectedColor: Colors.white,
                  ),
            ],
          ),
        ],
      ),
    );
  }
}

class FilterOption {
  final String label;
  final IconData icon;

  FilterOption(this.label, this.icon);
}

class FilterButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const FilterButton({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Icon(icon, size: 32),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}
