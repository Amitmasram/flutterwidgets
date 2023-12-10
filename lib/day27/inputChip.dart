import 'package:flutter/material.dart';

// class InputChipEx extends StatelessWidget {
//   const InputChipEx({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<String> selectedChips = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('InputChip Example'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Wrap(
//             spacing: 8.0,
//             runSpacing: 8.0,
//             children: <Widget>[
//               InputChip(
//                 label: const Text('Flutter'),
//                 onSelected: (bool selected) {
//                   setState(() {
//                     if (selected) {
//                       selectedChips.add('Flutter');
//                     } else {
//                       selectedChips.remove('Flutter');
//                     }
//                   });
//                 },
//               ),
//               InputChip(
//                 label: const Text('Dart'),
//                 onSelected: (bool selected) {
//                   setState(() {
//                     if (selected) {
//                       selectedChips.add('Dart');
//                     } else {
//                       selectedChips.remove('Dart');
//                     }
//                   });
//                 },
//               ),
//               // Add more InputChip widgets as needed
//             ],
//           ),
//           const SizedBox(height: 20.0),
//           Text('Selected Chips: ${selectedChips.join(', ')}'),
//         ],
//       ),
//     );
//   }
// }

//////////////////////////////-----------------//////////////////////

class InputChipEx2 extends StatelessWidget {
  const InputChipEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePagex(),
    );
  }
}

class MyHomePagex extends StatefulWidget {
  const MyHomePagex({super.key});

  @override
  _MyHomePagexState createState() => _MyHomePagexState();
}

class _MyHomePagexState extends State<MyHomePagex> {
  List<String> selectedLanguages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cool Language Selector'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Select your favorite programming languages:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: <Widget>[
                _buildLanguageChip('Flutter', Icons.widgets),
                _buildLanguageChip('Dart', Icons.code),
                _buildLanguageChip('Java', Icons.android),
                _buildLanguageChip('Python', Icons.line_axis),
                _buildLanguageChip('JavaScript', Icons.language),
                // Add more languages with icons as needed
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Selected Languages:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              selectedLanguages.isEmpty
                  ? 'No languages selected.'
                  : selectedLanguages.join(', '),
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageChip(String label, IconData icon) {
    return InputChip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      onSelected: (bool selected) {
        setState(() {
          if (selected) {
            selectedLanguages.add(label);
          } else {
            selectedLanguages.remove(label);
          }
        });
      },
    );
  }
}

///////////////////////////////////////

class InputChipEx3 extends StatelessWidget {
  const InputChipEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePageIn(),
    );
  }
}

class MyHomePageIn extends StatefulWidget {
  const MyHomePageIn({super.key});

  @override
  _MyHomePageInState createState() => _MyHomePageInState();
}

class _MyHomePageInState extends State<MyHomePageIn> {
  List<String> tags = [];

  TextEditingController _tagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tag Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTagInput(),
            const SizedBox(height: 16.0),
            _buildTagChips(),
            const SizedBox(height: 16.0),
            _buildTagControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildTagInput() {
    return TextField(
      controller: _tagController,
      decoration: InputDecoration(
        labelText: 'Add Tag',
        suffixIcon: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            if (_tagController.text.isNotEmpty) {
              setState(() {
                tags.add(_tagController.text);
                _tagController.clear();
              });
            }
          },
        ),
      ),
    );
  }

  Widget _buildTagChips() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: tags.map((tag) {
        return InputChip(
          label: Text(tag),
          onDeleted: () {
            setState(() {
              tags.remove(tag);
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildTagControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            setState(() {
              tags.clear();
            });
          },
          child: const Text('Clear All'),
        ),
      ],
    );
  }
}
////////////////////////////////

class InputChip4 extends StatelessWidget {
  const InputChip4({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePageInCh(),
    );
  }
}

class MyHomePageInCh extends StatefulWidget {
  const MyHomePageInCh({super.key});

  @override
  _MyHomePageInChState createState() => _MyHomePageInChState();
}

class _MyHomePageInChState extends State<MyHomePageInCh> {
  List<String> selectedTags = [];
  TextEditingController customTagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tag Selector'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Selected Tags:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _buildTagChips(),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: customTagController,
                    decoration: const InputDecoration(
                      labelText: 'Custom Tag',
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    _addCustomTag();
                  },
                  child: const Text('Add Tag'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTagChips() {
    List<Widget> chips = [];

    for (String tag in selectedTags) {
      chips.add(
        InputChip(
          label: Text(tag),
          onDeleted: () {
            _removeTag(tag);
          },
        ),
      );
    }

    return chips;
  }

  void _removeTag(String tag) {
    setState(() {
      selectedTags.remove(tag);
    });
  }

  void _addCustomTag() {
    String customTag = customTagController.text.trim();
    if (customTag.isNotEmpty && !selectedTags.contains(customTag)) {
      setState(() {
        selectedTags.add(customTag);
        customTagController.clear();
      });
    }
  }
}

//////////////////////////////

class InputChipEx5 extends StatelessWidget {
  const InputChipEx5({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> selectedTags = [];
  TextEditingController tagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Tags:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _buildTagChips(),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: tagController,
                    decoration: const InputDecoration(
                      labelText: 'New Tag',
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    _addTag();
                  },
                  child: const Text('Add Tag'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTagChips() {
    List<Widget> chips = [];

    for (String tag in selectedTags) {
      chips.add(
        InputChip(
          label: Text(tag),
          onDeleted: () {
            _removeTag(tag);
          },
          backgroundColor: Colors.blue,
          labelStyle: const TextStyle(color: Colors.white),
        ),
      );
    }

    return chips;
  }

  void _removeTag(String tag) {
    setState(() {
      selectedTags.remove(tag);
    });
  }

  void _addTag() {
    String newTag = tagController.text.trim();
    if (newTag.isNotEmpty && !selectedTags.contains(newTag)) {
      setState(() {
        selectedTags.add(newTag);
        tagController.clear();
      });
    }
  }
}
