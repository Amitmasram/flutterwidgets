import 'package:flutter/material.dart';

class MergeSemanticsEx extends StatelessWidget {
  const MergeSemanticsEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MergeSemantics Example'),
        ),
        body: Center(
          child: MergeSemantics(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('This is some text'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Press me'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////

class MergeSemanticsEx2 extends StatelessWidget {
  const MergeSemanticsEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MergeSemantics Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // These two buttons will be merged into a single semantic node
              MergeSemantics(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        print('Button 1 pressed');
                      },
                      child: const Text('Button 1'),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        print('Button 2 pressed');
                      },
                      child: const Text('Button 2'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // This button is independent in terms of semantics
              ElevatedButton(
                onPressed: () {
                  print('Button 3 pressed');
                },
                child: const Text('Button 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
