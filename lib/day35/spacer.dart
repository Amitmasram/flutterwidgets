import 'package:flutter/material.dart';

class SpacerEx extends StatelessWidget {
  const SpacerEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Spacer Example'),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.blue,
              height: 50,
              width: 100,
            ),
            const Spacer(), // This will fill the available vertical space
            Container(
              color: Colors.red,
              height: 50,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
/////////////////////////////////

class SpacerEx2 extends StatelessWidget {
  const SpacerEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Complex UI Example'),
        ),
        body: const MyComplexWidget(),
      ),
    );
  }
}

class MyComplexWidget extends StatefulWidget {
  const MyComplexWidget({super.key});

  @override
  _MyComplexWidgetState createState() => _MyComplexWidgetState();
}

class _MyComplexWidgetState extends State<MyComplexWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 100,
          color: Colors.blue,
          child: const Center(
            child: Text(
              'Header',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: isExpanded ? 200 : 100,
            color: Colors.grey[300],
            child: const Row(
              children: [
                Spacer(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Content goes here. This can be a complex UI with various widgets and functionalities.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: const Center(
            child: Text(
              'Footer',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
///////////////////////////////////////

class SpacerEx3 extends StatelessWidget {
  const SpacerEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Complex UI Example'),
        ),
        body: const MyComplexWidgetn(),
      ),
    );
  }
}

class MyComplexWidgetn extends StatefulWidget {
  const MyComplexWidgetn({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyComplexWidgetnState createState() => _MyComplexWidgetnState();
}

class _MyComplexWidgetnState extends State<MyComplexWidgetn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 100,
          color: Colors.blue,
          child: const Center(
            child: Text(
              'Header',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _controller.reverse();
          },
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Container(
                height: _animation.value * 200,
                color: Colors.grey[300],
                child: Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Opacity(
                          opacity: _animation.value,
                          child: const Text(
                            'Content goes here. This can be a complex UI with various widgets and functionalities.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: const Center(
            child: Text(
              'Footer',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
