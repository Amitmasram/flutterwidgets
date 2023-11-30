import 'package:flutter/material.dart';

class BuilderEx extends StatelessWidget {
  const BuilderEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Builder Example'),
        ),
        body: const MyWidgetWithBuilder(),
      ),
    );
  }
}

class MyWidgetWithBuilder extends StatelessWidget {
  const MyWidgetWithBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Center(
          child: TextButton(
            onPressed: () {
              // Access the Scaffold's context and print whether it has an app bar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Scaffold has AppBar: ${Scaffold.of(context).hasAppBar}'),
                ),
              );
            },
            child: const Text('Check AppBar'),
          ),
        );
      },
    );
  }
}
