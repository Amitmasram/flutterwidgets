import 'package:flutter/material.dart';

class ColorFilteredEx extends StatelessWidget {
  const ColorFilteredEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ColorFiltered Example'),
        ),
        body: Center(
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.blue, // The color to be applied
              BlendMode.saturation, // The blend mode to be applied
            ),
            child: Image.network(
              'https://tse3.mm.bing.net/th?id=OIP.FspfEEDx4Eqv7-IsrqaYhwHaEK&pid=Api&P=0&h=180',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
