import 'package:flutter/material.dart';

class RadioListTileEx extends StatefulWidget {
  const RadioListTileEx({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RadioListTileExState createState() => _RadioListTileExState();
}

class _RadioListTileExState extends State<RadioListTileEx> {
  int _selectedValue = 1; // Initial selected value

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RadioListTile Example'),
        ),
        body: Column(
          children: [
            RadioListTile(
              title: const Text('Option 1'),
              value: 1,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                });
              },
            ),
            RadioListTile(
              title: const Text('Option 2'),
              value: 2,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                });
              },
            ),
            RadioListTile(
              title: const Text('Option 3'),
              value: 3,
              groupValue: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////

class RadioListTileEx2 extends StatefulWidget {
  const RadioListTileEx2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RadioListTileEx2State createState() => _RadioListTileEx2State();
}

class _RadioListTileEx2State extends State<RadioListTileEx2> {
  ThemeData _selectedTheme = ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _selectedTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Theme Selector'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RadioListTile<ThemeData>(
              title: const Text('Light Theme'),
              value: ThemeData.light(),
              groupValue: _selectedTheme,
              onChanged: (theme) {
                setState(() {
                  _selectedTheme = theme!;
                });
              },
            ),
            RadioListTile<ThemeData>(
              title: const Text('Dark Theme'),
              value: ThemeData.dark(),
              groupValue: _selectedTheme,
              onChanged: (theme) {
                setState(() {
                  _selectedTheme = theme!;
                });
              },
            ),
            RadioListTile<ThemeData>(
              title: const Text('Custom Theme'),
              value: ThemeData(
                primaryColor: Colors.teal,
                hintColor: Colors.purple,
                brightness: Brightness.light,
              ),
              groupValue: _selectedTheme,
              onChanged: (theme) {
                setState(() {
                  _selectedTheme = theme!;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'This is a cool app with dynamic theming!',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
