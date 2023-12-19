import 'package:flutter/material.dart';

class TableEx extends StatelessWidget {
  const TableEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Table Widget Example'),
        ),
        body: Center(
          child: Table(
            border: TableBorder.all(),
            children: const [
              TableRow(
                children: [
                  TableCell(
                    child: Center(child: Text('Header 1')),
                  ),
                  TableCell(
                    child: Center(child: Text('Header 2')),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Center(child: Text('Row 1, Cell 1')),
                  ),
                  TableCell(
                    child: Center(child: Text('Row 1, Cell 2')),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Center(child: Text('Row 2, Cell 1')),
                  ),
                  TableCell(
                    child: Center(child: Text('Row 2, Cell 2')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////////////

class TableEx2 extends StatelessWidget {
  const TableEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyTableScreen(),
    );
  }
}

class MyTableScreen extends StatefulWidget {
  const MyTableScreen({super.key});

  @override
  _MyTableScreenState createState() => _MyTableScreenState();
}

class _MyTableScreenState extends State<MyTableScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex Table UI'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Opacity(
              opacity: _animation.value,
              child: Transform.scale(
                scale: _animation.value,
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    for (int i = 0; i < 5; i++)
                      TableRow(
                        children: [
                          for (int j = 0; j < 5; j++)
                            TableCell(
                              child: Container(
                                height: 50,
                                color: Colors.blue.withOpacity(0.5),
                                child: Center(
                                  child: Text(
                                    'Cell $i-$j',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

///////////////////////////////

class TableEx3 extends StatelessWidget {
  const TableEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyComplexTableScreen(),
    );
  }
}

class MyComplexTableScreen extends StatefulWidget {
  const MyComplexTableScreen({super.key});

  @override
  _MyComplexTableScreenState createState() => _MyComplexTableScreenState();
}

class _MyComplexTableScreenState extends State<MyComplexTableScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex Table UI'),
      ),
      body: Stack(
        children: [
          Table(
            border: TableBorder.all(),
            children: [
              for (int i = 0; i < 5; i++)
                TableRow(
                  children: [
                    for (int j = 0; j < 5; j++)
                      TableCell(
                        child: Container(
                          height: 80,
                          color: Colors.blue.withOpacity(0.5),
                          child: Center(
                            child: Text(
                              'Cell $i-$j',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
            ],
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                top: 100 * _animation.value,
                left: 50 * _animation.value,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red.withOpacity(0.7),
                  child: const Center(
                    child: Text(
                      'Animated Element',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              color: Colors.black.withOpacity(0.8),
              child: const Center(
                child: Text(
                  'Footer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
