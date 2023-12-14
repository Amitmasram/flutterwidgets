import 'package:flutter/material.dart';

class PopMenuButtonEx extends StatelessWidget {
  const PopMenuButtonEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Popup Menu Button Example'),
        ),
        body: Center(
          child: PopupMenuButton<String>(
            onSelected: (String result) {
              print('Selected: $result');
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'option1',
                child: Text('Option 1'),
              ),
              const PopupMenuItem<String>(
                value: 'option2',
                child: Text('Option 2'),
              ),
              const PopupMenuItem<String>(
                value: 'option3',
                child: Text('Option 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////

class PopupMenuButtonEx2 extends StatelessWidget {
  const PopupMenuButtonEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PopupMenuDemo(),
    );
  }
}

class PopupMenuDemo extends StatefulWidget {
  const PopupMenuDemo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PopupMenuDemoState createState() => _PopupMenuDemoState();
}

class _PopupMenuDemoState extends State<PopupMenuDemo> {
  String selectedOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cool Popup Menu Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Option: $selectedOption',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            PopupMenuButton<String>(
              onSelected: (String result) {
                setState(() {
                  selectedOption = result;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Option 1',
                  child: ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Option 1'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 2',
                  child: ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('Option 2'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 3',
                  child: ListTile(
                    leading: Icon(Icons.star_border),
                    title: Text('Option 3'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////

class PopupMenuButtonEx3 extends StatelessWidget {
  const PopupMenuButtonEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RadialMenuDemo(),
    );
  }
}

class RadialMenuDemo extends StatefulWidget {
  const RadialMenuDemo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RadialMenuDemoState createState() => _RadialMenuDemoState();
}

class _RadialMenuDemoState extends State<RadialMenuDemo> {
  String selectedOption = 'None';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cool Radial Menu Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Option: $selectedOption',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            RadialMenu(
              onSelected: (String result) {
                setState(() {
                  selectedOption = result;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RadialMenu extends StatelessWidget {
  final Function(String) onSelected;

  RadialMenu({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return RadialPopupMenu(
      onSelected: onSelected,
      items: [
        RadialMenuItem(icon: Icons.star, color: Colors.orange),
        RadialMenuItem(icon: Icons.favorite, color: Colors.red),
        RadialMenuItem(icon: Icons.star_border, color: Colors.blue),
        RadialMenuItem(icon: Icons.thumb_up, color: Colors.green),
      ],
    );
  }
}

class RadialPopupMenu extends StatelessWidget {
  final Function(String) onSelected;
  final List<RadialMenuItem> items;

  RadialPopupMenu({super.key, required this.onSelected, required this.items});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onSelected,
      itemBuilder: (BuildContext context) {
        return items
            .map((item) => PopupMenuItem<String>(
                  value: item.label,
                  child: Icon(
                    item.icon,
                    size: 28,
                    color: item.color,
                  ),
                ))
            .toList();
      },
      offset: const Offset(0, 100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

class RadialMenuItem {
  final IconData icon;
  final Color color;
  final String label;

  RadialMenuItem({required this.icon, required this.color})
      : label = icon.toString();
}
