// ignore: file_names
import 'package:flutter/material.dart';

/*
In this example:

The ClipPath widget is used to clip a blue Container.
The clipper property is set to MyCustomClipper(), which is a custom class extending CustomClipper<Path>. 
The getClip method defines the path used for clipping.
You can customize the path by adjusting the path variable in the MyCustomClipper class.
 Feel free to modify the path to suit your needs.

Remember, the shouldReclip method is used to determine whether the clipper needs to be recomputed when the widget changes. In this example, 
it always returns false to indicate that the clipper does not need to be recomputed.
*/

class ClipPathEx extends StatelessWidget {
  const ClipPathEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ClipPath Example'),
        ),
        body: Center(
          child: ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              width: 200.0,
              height: 200.0,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Define the path here based on your requirements
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(0, size.height * 0.8);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
