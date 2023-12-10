import 'package:flutter/material.dart';

class ImageEx extends StatelessWidget {
  const ImageEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Widget Example'),
        ),
        body: Center(
          child: Image(
            image: const AssetImage(
                'assets/piece1.png'), // Replace with your image asset path
            width: 200.0, // Adjust the width as needed
            height: 200.0, // Adjust the height as needed
            alignment:
                Alignment.center, // Alignment of the image within its box
            repeat: ImageRepeat
                .noRepeat, // Repeat the image if it doesn't fill its box
            color: Colors.blue, // Color to blend with the image
            colorBlendMode: BlendMode.srcIn, // Blend mode for the color
            fit: BoxFit.cover, // How the image should be inscribed into the box
            filterQuality: FilterQuality.high, // Quality of the image filtering
            semanticLabel: 'A sample image', // Description for accessibility
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              }
            },
            frameBuilder: (BuildContext context, Widget child, int? frame,
                bool wasSynchronouslyLoaded) {
              // Customize the frame rendering if needed
              return child;
            },
          ),
        ),
      ),
    );
  }
}
