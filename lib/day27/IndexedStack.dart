import 'package:flutter/material.dart';

class IndexedStackEx extends StatelessWidget {
  const IndexedStackEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('IndexedStack Example'),
        ),
        body: const MyIndexedStack(),
      ),
    );
  }
}

class MyIndexedStack extends StatefulWidget {
  const MyIndexedStack({super.key});

  @override
  _MyIndexedStackState createState() => _MyIndexedStackState();
}

class _MyIndexedStackState extends State<MyIndexedStack> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IndexedStack(
          index: currentIndex,
          children: [
            Container(
              color: Colors.red,
              width: 200,
              height: 200,
              child: const Center(
                child: Text('Screen 1'),
              ),
            ),
            Container(
              color: Colors.blue,
              width: 200,
              height: 200,
              child: const Center(
                child: Text('Screen 2'),
              ),
            ),
            Container(
              color: Colors.green,
              width: 200,
              height: 200,
              child: const Center(
                child: Text('Screen 3'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              currentIndex = (currentIndex + 1) % 3;
            });
          },
          child: const Text('Switch Screen'),
        ),
      ],
    );
  }
}

///////////////////////////////////////

class IndexedStackEx2 extends StatelessWidget {
  const IndexedStackEx2({super.key});

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
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IndexedStack Example'),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          buildPage('Page 1', Colors.blue),
          buildPage('Page 2', Colors.green),
          buildPage('Page 3', Colors.orange),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Page 3',
          ),
        ],
      ),
    );
  }

  Widget buildPage(String title, Color color) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add some action for each page if needed
                print('$title button pressed');
              },
              child: const Text('Click me'),
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////

class IndexedStackEx3 extends StatelessWidget {
  const IndexedStackEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyImageGallery(),
    );
  }
}

class MyImageGallery extends StatefulWidget {
  const MyImageGallery({super.key});

  @override
  _MyImageGalleryState createState() => _MyImageGalleryState();
}

class _MyImageGalleryState extends State<MyImageGallery> {
  int currentIndex = 0;
  List<String> images = [
    'assets/piece1.png',
    'assets/shoe_tilt_2.png',
    'assets/show_1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: IndexedStack(
              index: currentIndex,
              children: images.map((image) => buildImage(image)).toList(),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Image ${currentIndex + 1} of ${images.length}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentIndex = (currentIndex - 1) % images.length;
                    if (currentIndex < 0) {
                      currentIndex = images.length - 1;
                    }
                  });
                },
                child: const Text('Previous'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentIndex = (currentIndex + 1) % images.length;
                  });
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImage(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
