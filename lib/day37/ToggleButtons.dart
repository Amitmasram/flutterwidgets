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

class ToggleButtonEx2 extends StatelessWidget {
  const ToggleButtonEx2({super.key});

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

/////////////////////////////////////

class ToggleButtonEx3 extends StatelessWidget {
  const ToggleButtonEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: const QuizScreen(),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<List<bool>> selectedOptions = List.generate(
    questions.length,
    (index) => List.generate(
      questions[index]['options'].length,
      (innerIndex) => false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quiz Questions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          for (int i = 0; i < questions.length; i++)
            QuizCard(
              question: questions[i]['question'],
              options: questions[i]['options'],
              selectedOptions: selectedOptions[i],
              onOptionToggle: (index) {
                setState(() {
                  selectedOptions[i][index] = !selectedOptions[i][index];
                });
              },
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle quiz submission
              print('Selected Options: $selectedOptions');
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  final String question;
  final List<String> options;
  final List<bool> selectedOptions;
  final Function(int) onOptionToggle;

  const QuizCard({
    super.key,
    required this.question,
    required this.options,
    required this.selectedOptions,
    required this.onOptionToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ToggleButtons(
              // ignore: sort_child_properties_last
              children: [
                for (int i = 0; i < options.length; i++)
                  OptionButton(
                    label: options[i],
                    selected: selectedOptions[i],
                  ),
              ],
              isSelected: selectedOptions,
              onPressed: onOptionToggle,
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
              selectedColor: Colors.blue,
              fillColor: Colors.blue.withOpacity(0.2),
              borderWidth: 2,
              borderColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String label;
  final bool selected;

  const OptionButton({super.key, required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Icon(
            selected ? Icons.check_circle : Icons.circle,
            size: 32,
            color: selected ? Colors.blue : Colors.grey,
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> questions = [
  {
    'question': 'What is the capital of France?',
    'options': ['Paris', 'Berlin', 'London', 'Rome'],
  },
  {
    'question': 'Which planet is known as the Red Planet?',
    'options': ['Earth', 'Mars', 'Venus', 'Jupiter'],
  },
  {
    'question': 'Who wrote "Romeo and Juliet"?',
    'options': [
      'Charles Dickens',
      'William Shakespeare',
      'Jane Austen',
      'Mark Twain'
    ],
  },
];

/////////////////////////////////////////

class ToggleButtonEx5 extends StatelessWidget {
  const ToggleButtonEx5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Color Palette Selector'),
        ),
        body: const ColorPaletteSelector(),
      ),
    );
  }
}

class ColorPaletteSelector extends StatefulWidget {
  const ColorPaletteSelector({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ColorPaletteSelectorState createState() => _ColorPaletteSelectorState();
}

class _ColorPaletteSelectorState extends State<ColorPaletteSelector>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  List<bool> isSelected = List.generate(5, (index) => false);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _animation,
            child: const Text(
              'Choose a Color Palette',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          ToggleButtons(
            // ignore: sort_child_properties_last
            children: const [
              ColorPaletteButton(color: Colors.red),
              ColorPaletteButton(color: Colors.blue),
              ColorPaletteButton(color: Colors.green),
              ColorPaletteButton(color: Colors.orange),
              ColorPaletteButton(color: Colors.purple),
            ],
            isSelected: isSelected,
            onPressed: (index) {
              setState(() {
                isSelected[index] = !isSelected[index];
              });
            },
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
            selectedColor: Colors.white,
            fillColor: Colors.blue.withOpacity(0.5),
            borderWidth: 2,
            borderColor: Colors.blue,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle color palette selection
              print('Selected Palettes: $isSelected');
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}

class ColorPaletteButton extends StatelessWidget {
  final Color color;

  const ColorPaletteButton({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
