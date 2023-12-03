//import 'package:flutter/material.dart';

// class AnimateAlignEx extends StatelessWidget {
//   const AnimateAlignEx({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _MyHomePageExCState createState() => _MyHomePageExCState();
// }

// class _MyHomePageExCState extends State<MyHomePageExC> {
//   bool _isAlignedRight = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('AnimatedAlign Example'),
//       ),
//       body: Center(
//         child: AnimatedAlign(
//           alignment:
//               _isAlignedRight ? Alignment.centerRight : Alignment.centerLeft,
//           duration: const Duration(seconds: 1),
//           curve: Curves.easeInOut,
//           child: Container(
//             width: 50,
//             height: 50,
//             color: Colors.blue,
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _isAlignedRight = !_isAlignedRight;
//           });
//         },
//         child: const Icon(Icons.swap_horiz),
//       ),
//     );
//   }
// }

////-----------///////////

import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedAlignEx2 extends StatelessWidget {
  const AnimatedAlignEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  double _ballX = 0.0;
  double _ballY = 0.0;
  Color _ballColor = Colors.blue;

  void _moveBall() {
    final random = Random();

    setState(() {
      _ballX = random.nextDouble() * (MediaQuery.of(context).size.width - 50);
      _ballY = random.nextDouble() * (MediaQuery.of(context).size.height - 50);
      _ballColor = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1.0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedAlign Ball'),
      ),
      body: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(
                _ballX / MediaQuery.of(context).size.width * 2 - 1,
                _ballY / MediaQuery.of(context).size.height * 2 - 1),
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: GestureDetector(
              onTap: _moveBall,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: _ballColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
