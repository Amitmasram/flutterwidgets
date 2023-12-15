import 'package:flutter/material.dart';

class RangeSliderEx extends StatelessWidget {
  const RangeSliderEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Range Slider Example'),
        ),
        body: const Center(
          child: RangeSliderExample(),
        ),
      ),
    );
  }
}

class RangeSliderExample extends StatefulWidget {
  const RangeSliderExample({super.key});

  @override
  _RangeSliderExampleState createState() => _RangeSliderExampleState();
}

class _RangeSliderExampleState extends State<RangeSliderExample> {
  RangeValues _values = const RangeValues(0.2, 0.8);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              'Selected Range: ${_values.start.toStringAsFixed(2)} - ${_values.end.toStringAsFixed(2)}'),
          const SizedBox(height: 20),
          RangeSlider(
            values: _values,
            min: 0.0,
            max: 1.0,
            onChanged: (RangeValues newValues) {
              setState(() {
                _values = newValues;
              });
            },
          ),
        ],
      ),
    );
  }
}
