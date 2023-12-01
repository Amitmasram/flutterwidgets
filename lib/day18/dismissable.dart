import 'dart:math';

import 'package:flutter/material.dart';

class DismissibleEx extends StatelessWidget {
  const DismissibleEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dismissible Example'),
        ),
        body: const MyList(),
      ),
    );
  }
}

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(items[index]),
          onDismissed: (direction) {
            setState(() {
              items.removeAt(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Item dismissed'),
              ),
            );
          },
          background: Container(
            color: Colors.red,
            child: const Icon(Icons.delete),
          ),
          child: ListTile(
            title: Text(items[index]),
          ),
        );
      },
    );
  }
}

////////////////////////---------------------------//////////////////

class MyComplimentsApp extends StatelessWidget {
  const MyComplimentsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Compliments Generator'),
        ),
        body: const Center(
          child: ComplimentGenerator(),
        ),
      ),
    );
  }
}

class ComplimentGenerator extends StatefulWidget {
  const ComplimentGenerator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ComplimentGeneratorState createState() => _ComplimentGeneratorState();
}

class _ComplimentGeneratorState extends State<ComplimentGenerator> {
  List<String> compliments = [
    "You're amazing!",
    "You've got this!",
    "You're a star!",
    "You make a difference!",
    "You're unstoppable!",
  ];

  String currentCompliment = "Tap to get a compliment!";

  void generateCompliment() {
    final random = Random();
    final index = random.nextInt(compliments.length);
    setState(() {
      currentCompliment = compliments[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: generateCompliment,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            currentCompliment,
            style: const TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

//////--------------------//////////////////////

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('To-Do List'),
        ),
        body: const TodoList(),
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> tasks = [];

  void addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TodoInput(onSubmit: addTask),
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(tasks[index]),
                onDismissed: (direction) {
                  setState(() {
                    tasks.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Task completed'),
                    ),
                  );
                },
                background: Container(
                  color: Colors.green,
                  child: const Icon(Icons.check, color: Colors.white),
                  alignment: Alignment.centerLeft,
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  child: const Icon(Icons.delete, color: Colors.white),
                  alignment: Alignment.centerRight,
                ),
                child: ListTile(
                  title: Text(tasks[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class TodoInput extends StatefulWidget {
  final Function(String) onSubmit;

  TodoInput({super.key, required this.onSubmit});

  @override
  _TodoInputState createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Add a task...',
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          ElevatedButton(
            onPressed: () {
              final task = _controller.text.trim();
              if (task.isNotEmpty) {
                widget.onSubmit(task);
                _controller.clear();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
