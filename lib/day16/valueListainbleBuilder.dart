import 'package:flutter/material.dart';

class CounterModel extends ValueNotifier<int> {
  CounterModel(int value) : super(value);
}

class ValuListainbleBuilderEx extends StatelessWidget {
  const ValuListainbleBuilderEx({super.key});

  @override
  Widget build(BuildContext context) {
    final counterModel = CounterModel(0);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ValueListenableBuilder Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder<int>(
                valueListenable: counterModel,
                builder: (context, value, child) {
                  return Text('Counter Value: $value');
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Increment the counter value
                  counterModel.value += 1;
                },
                child: const Text('Increment Counter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
