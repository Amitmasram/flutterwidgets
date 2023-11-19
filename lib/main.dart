import 'package:flutter/material.dart';

import 'day6/animation.dart';

// 🚀 Follow me on Instagram: https://www.instagram.com/skytech_28/
// 💻 Check out my GitHub: https://github.com/Amitmasram
// 👔 Connect with me on LinkedIn: https://www.linkedin.com/in/amit-masram/

void main() {
  runApp(const MyApp());
}

/// The main application widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp widget to set up the Flutter application
    return const MaterialApp(
      home: MyAnimationExample(),
    );
  }
}




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
