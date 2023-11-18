import 'package:flutter/material.dart';

/*
  In this extended example:
  - Example 1: Demonstrates the basic usage of ClipRRect with a circular border radius.
  - Example 2: Shows ClipRRect with a custom border radius using BorderRadius.only.
  - Example 3: Illustrates ClipRRect with rounded corners and a border using the BoxDecoration.
*/

class ClipRRectExample extends StatelessWidget {
  const ClipRRectExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ClipRRect Example'),
        ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Example 1: Basic ClipRRect
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Hello, ClipRRect!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),

                // Example 2: ClipRRect with custom borderRadius
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        'Custom BorderRadius',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),

                // Example 3: ClipRRect with rounded corners and a border
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Rounded Corners with Border',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
