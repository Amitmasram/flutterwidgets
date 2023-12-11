import 'package:flutter/material.dart';

// class MaterialBannerEx extends StatelessWidget {
//   const MaterialBannerEx({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Material Banner Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             _showMaterialBanner(context);
//           },
//           child: const Text('Show Material Banner'),
//         ),
//       ),
//     );
//   }

//   void _showMaterialBanner(BuildContext context) {
//     final banner = MaterialBanner(
//       content: const Text('This is a material banner.'),
//       actions: [
//         TextButton(
//           onPressed: () {
//             ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
//           },
//           child: const Text('DISMISS'),
//         ),
//       ],
//     );

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: banner,
//       ),
//     );
//   }
// }

///////////////////////////

class MaterialBannerEx2 extends StatelessWidget {
  const MaterialBannerEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePageX(),
    );
  }
}

class MyHomePageX extends StatelessWidget {
  const MyHomePageX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Banner Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showMaterialBanner(context);
          },
          child: const Text('Show Material Banner'),
        ),
      ),
    );
  }

  void _showMaterialBanner(BuildContext context) {
    final banner = MaterialBanner(
      content: const Text('This is a material banner.'),
      actions: [
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
          child: const Text('DISMISS'),
        ),
      ],
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: banner,
        duration: const Duration(seconds: 4), // Adjust the duration as needed
      ),
    );
  }
}
