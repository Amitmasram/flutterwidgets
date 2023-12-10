import 'package:flutter/material.dart';

class InteractiveViewerEx extends StatelessWidget {
  const InteractiveViewerEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('InteractiveViewer Example'),
        ),
        body: Center(
          child: InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(20.0),
            minScale: 0.1,
            maxScale: 2.0,
            child: Container(
              width: 300.0,
              height: 300.0,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Zoom and Pan',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
////////////////////////////////////////////

class InteractiveViewerEx2 extends StatelessWidget {
  const InteractiveViewerEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Interactive Gallery'),
        ),
        body: Center(
          child: InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(20.0),
            minScale: 0.1,
            maxScale: 2.0,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return Image.network(
                  imageList[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

List<String> imageList = [
  'https://tse3.mm.bing.net/th?id=OIP.FspfEEDx4Eqv7-IsrqaYhwHaEK&pid=Api&P=0&h=180',
  'https://example.com/image2.jpg',
  'https://example.com/image3.jpg',
  'https://example.com/image4.jpg',
  'https://example.com/image5.jpg',
  'https://example.com/image6.jpg',
  // Add more image URLs as needed
];
