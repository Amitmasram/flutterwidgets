import 'package:flutter/material.dart';

class FlexibleEx extends StatelessWidget {
  const FlexibleEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('Flexible Example'),
        ),
        body: Row(
          children: [
            Container(
              color: Colors.blue,
              height: 100,
              width: 50,
            ),
            Flexible(
              flex: 2,
              child: Container(
                color: Colors.green,
                height: 100,
              ),
            ),
            Container(
              color: Colors.red,
              height: 100,
              width: 50,
            ),
          ],
        ),
      ),
    );
  }
}

////////////////------------------------//////////

class FlexibleEx2 extends StatelessWidget {
  const FlexibleEx2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flexible Example'),
        ),
        body: Column(
          children: [
            // Fixed Header
            Container(
              color: Colors.blue,
              height: 80,
              alignment: Alignment.center,
              child: const Text(
                'Header',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            // Scrollable List
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              ),
            ),
            // Flexible Footer
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text(
                  'Flexible Footer',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
