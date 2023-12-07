import 'package:flutter/material.dart';

class DraggableScrollableEx extends StatelessWidget {
  const DraggableScrollableEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Draggable Scrollable Sheet Example'),
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize:
          0.3, // The initial size of the sheet as a fraction of the screen height
      minChildSize:
          0.1, // The minimum size of the sheet as a fraction of the screen height
      maxChildSize:
          0.9, // The maximum size of the sheet as a fraction of the screen height
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.blue[100],
          child: ListView.builder(
            controller: scrollController,
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('Item $index'),
              );
            },
          ),
        );
      },
    );
  }
}

////////////--------------------------/////////////

class DraggableScrollableEx2 extends StatelessWidget {
  const DraggableScrollableEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cool Draggable Card'),
        ),
        body: const DraggableCard(),
      ),
    );
  }
}

class DraggableCard extends StatelessWidget {
  const DraggableCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.2,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Cool Draggable Card',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    child: const Center(
                      child: FlutterLogo(size: 75),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              for (int i = 1; i <= 20; i++)
                ListTile(
                  title: Text('Item $i'),
                ),
            ],
          ),
        );
      },
    );
  }
}

//////---------------------------///////////////

class DraggableScrollableEx3 extends StatelessWidget {
  const DraggableScrollableEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cool Animated Card'),
        ),
        body: const CoolCard(),
      ),
    );
  }
}

class CoolCard extends StatefulWidget {
  const CoolCard({super.key});

  @override
  _CoolCardState createState() => _CoolCardState();
}

class _CoolCardState extends State<CoolCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    // Create an animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Create a rotation animation
    _rotationAnimation = Tween(begin: 0.0, end: 360.0).animate(_controller);

    // Start the rotation animation
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _rotationAnimation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _rotationAnimation.value *
                (3.1415927 / 180), // Convert degrees to radians
            child: Card(
              elevation: 5,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blue,
                ),
                child: const Center(
                  child: FlutterLogo(size: 100),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the animation controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }
}
