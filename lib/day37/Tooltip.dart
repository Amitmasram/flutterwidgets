import 'package:flutter/material.dart';

class TooltipEx extends StatelessWidget {
  const TooltipEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tooltip Example'),
        ),
        body: Center(
          child: Tooltip(
            message: 'This is a Tooltip',
            child: ElevatedButton(
              onPressed: () {
                // Your button's action goes here
              },
              child: const Text('Press me'),
            ),
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////

class TooltipEx2 extends StatelessWidget {
  const TooltipEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tooltip Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Tooltip(
                message: 'This is a Tooltip',
                child: ElevatedButton(
                  onPressed: () {
                    // Your button's action goes here
                  },
                  child: const Text('Press me'),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(
                    message: 'Settings',
                    child: IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {
                        // Handle settings button press
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Tooltip(
                    message: 'Search',
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        // Handle search button press
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Tooltip(
                message: 'Long-press me!',
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Hold me',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Tooltip(
                message: 'Custom Tooltip Style',
                height: 50,
                padding: const EdgeInsets.all(16),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Your button's action goes here
                  },
                  child: const Text('Custom Style'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////

class TooltipEx3 extends StatelessWidget {
  const TooltipEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cool Tooltip Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Tooltip(
                message: 'Tap me!',
                child: GestureDetector(
                  onTap: () {
                    // Handle tap gesture
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Tap',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Tooltip(
                message: 'Important information',
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    title: const Text('Title'),
                    subtitle: const Text('Subtitle'),
                    leading: const Icon(Icons.info),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite),
                      onPressed: () {
                        // Handle favorite button press
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Tooltip(
                message: 'Hover over me!',
                child: Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.deepOrange],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Hover',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Tooltip(
                message: 'Settings',
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    // Handle settings button press
                  },
                ),
              ),
              const SizedBox(height: 20),
              Tooltip(
                message: 'Long-press for options',
                child: PopupMenuButton<String>(
                  onSelected: (value) {
                    // Handle menu item selection
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'Option 1',
                      child: Text('Option 1'),
                    ),
                    const PopupMenuItem(
                      value: 'Option 2',
                      child: Text('Option 2'),
                    ),
                    const PopupMenuItem(
                      value: 'Option 3',
                      child: Text('Option 3'),
                    ),
                  ],
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.green,
                    child: const Text(
                      'Menu',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////

class TooltipEx4 extends StatelessWidget {
  const TooltipEx4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Interactive Tooltip Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Tooltip(
                message: 'Tap me!',
                child: GestureDetector(
                  onTap: () {
                    // Handle tap gesture
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Tap',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Tooltip(
                message: 'Swipe to see more',
                child: Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    // Handle swipe dismissal
                  },
                  child: Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.orange, Colors.deepOrange],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Swipe',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Tooltip(
                message: 'Double-tap to like',
                child: GestureDetector(
                  onDoubleTap: () {
                    // Handle double-tap gesture
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(75),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.favorite,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Tooltip(
                message: 'Rotate me!',
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(45 / 360),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.purple,
                    child: const Center(
                      child: Text(
                        'Rotate',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Tooltip(
                message: 'Scale me!',
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 1, end: 2),
                  duration: const Duration(seconds: 1),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.teal,
                        child: const Center(
                          child: Text(
                            'Scale',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
