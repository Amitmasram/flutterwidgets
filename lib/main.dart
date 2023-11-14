import 'package:flutter/material.dart';

// 🚀 Follow me on Instagram: https://www.instagram.com/skytech_28/
// 💻 Check out my GitHub: https://github.com/Amitmasram
// 👔 Connect with me on LinkedIn: https://www.linkedin.com/in/amit-masram/

// Importing the RowWidget from the 'row.dart' file
import 'package:flutterwidgets/day1/row.dart';

void main() {
  runApp(MyApp());
}

/// The main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp widget to set up the Flutter application
    return MaterialApp(
      // Home widget is set to the RowWidget from the 'row.dart' file
      home: RowWidget(),
    );
  }
}


// class FadeApp extends StatefulWidget {
//   @override
//   _FadeAppState createState() => _FadeAppState();
// }

// class _FadeAppState extends State<FadeApp> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 3),
//     );

//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void startFadingAnimation() {
//     _controller.reset();
//     _controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('FadeTransition Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             FadeTransition(
//               opacity: _animation,
//               child: Container(
//                 width: 200,
//                 height: 200,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.purple, Colors.blue],
//                   ),
//                 ),
//                 child:  Center(
//                   child: Text(
//                     'Fading Widget',
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextButton(
//               onPressed: () {
//                 startFadingAnimation();
//               },
//               child: Text(
//                 'Start Fading',
//                 style: TextStyle(color: Colors.blue),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SizeTransitionApp extends StatefulWidget {
//   @override
//   _SizeTransitionAppState createState() => _SizeTransitionAppState();
// }

// class _SizeTransitionAppState extends State<SizeTransitionApp> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );

//     _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

//     // Start the animation when the page loads
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void startSizeAnimation() {
//     // Reset the animation to its initial state
//     _controller.reset();
//     // Start the animation when triggered
//     _controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SizeTransition Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizeTransition(
//               sizeFactor: _animation,
//               axis: Axis.horizontal,
//               axisAlignment: -1, // Start from the beginning
//               child: Container(
//                 width: 200,
//                 height: 200,
//                 color: Colors.blue,
//                 child: Center(
//                   child: Text(
//                     'Resizing Widget',
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 startSizeAnimation();
//               },
//               child: Text('Start Resizing'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





// class AnimatedBuilderApp extends StatefulWidget {
//   @override
//   _AnimatedBuilderAppState createState() => _AnimatedBuilderAppState();
// }

// class _AnimatedBuilderAppState extends State<AnimatedBuilderApp> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );

//     _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

//     // Start the animation when the page loads
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void startAnimation() {
//     // Reset the animation to its initial state
//     _controller.reset();
//     // Start the animation when triggered
//     _controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('AnimatedBuilder Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AnimatedBuilder(
//               animation: _animation,
//               builder: (BuildContext context, Widget? child) {
//                 return Opacity(
//                   opacity: _animation.value,
//                   child: Container(
//                     width: 200 * _animation.value, // Change width based on animation value
//                     height: 200 * _animation.value, // Change height based on animation value
//                     color: Colors.blue,
//                     child: Center(
//                       child: Text(
//                         'Hello amit how are you today',
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 startAnimation();
//               },
//               child: Text('Start Animation'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class WillPopScopeExample extends StatelessWidget {
//   Future<bool> _onWillPop(BuildContext context) async {
//     bool canExit = await showExitDialog(context);
//     return canExit;
//   }

//   Future<bool> showExitDialog(BuildContext context) async {
//     return await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(
//           'Exit App?',
//           style: TextStyle(
//             color: Colors.red,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         content: Text(
//           'Are you sure you want to exit?',
//           style: TextStyle(
//             color: Colors.blue,
//           ),
//         ),
//         backgroundColor: Colors.grey[100],
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(true); // Allow back button press
//             },
//             child: Text(
//               'Yes',
//               style: TextStyle(
//                 color: Colors.red,
//               ),
//             ),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(false); // Stay in the current route
//             },
//             child: Text(
//               'No',
//               style: TextStyle(
//                 color: Colors.blue,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('WillPopScope Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Press the back button to trigger WillPopScope',
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _onWillPop(context);
//               },
//               child: Text('Show Exit Dialog'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
