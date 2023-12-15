import 'package:flutter/material.dart';

class RawChipEx extends StatelessWidget {
  const RawChipEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RawChip Example'),
        ),
        body: Center(
          child: RawChip(
            label: const Text('Raw Chip'),
            onPressed: () {
              // Handle chip press
              print('Raw Chip Pressed');
            },
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////

class RawChipEx2 extends StatefulWidget {
  const RawChipEx2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RawChipEx2State createState() => _RawChipEx2State();
}

class _RawChipEx2State extends State<RawChipEx2> {
  List<String> selectedLanguages = [];

  void toggleLanguage(String language) {
    setState(() {
      if (selectedLanguages.contains(language)) {
        selectedLanguages.remove(language);
      } else {
        selectedLanguages.add(language);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Programming Languages'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Wrap(
                spacing: 8.0,
                children: <Widget>[
                  RawChip(
                    label: const Text('Dart'),
                    selected: selectedLanguages.contains('Dart'),
                    onSelected: (bool selected) {
                      toggleLanguage('Dart');
                    },
                  ),
                  RawChip(
                    label: const Text('Flutter'),
                    selected: selectedLanguages.contains('Flutter'),
                    onSelected: (bool selected) {
                      toggleLanguage('Flutter');
                    },
                  ),
                  RawChip(
                    label: const Text('JavaScript'),
                    selected: selectedLanguages.contains('JavaScript'),
                    onSelected: (bool selected) {
                      toggleLanguage('JavaScript');
                    },
                  ),
                  RawChip(
                    label: const Text('Python'),
                    selected: selectedLanguages.contains('Python'),
                    onSelected: (bool selected) {
                      toggleLanguage('Python');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text('Selected Languages: ${selectedLanguages.join(', ')}'),
            ],
          ),
        ),
      ),
    );
  }
}
