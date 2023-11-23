import 'package:flutter/material.dart';

class MyPageView extends StatelessWidget {
  const MyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView Example'),
      ),
      body: PageView(
        children: <Widget>[
          Container(
            color: Colors.blue,
            child: Center(
              child: Text('Page 1'),
            ),
          ),
          Container(
            color: Colors.green,
            child: Center(
              child: Text('Page 2'),
            ),
          ),
          Container(
            color: Colors.orange,
            child: Center(
              child: Text('Page 3'),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPageViewEx extends StatelessWidget {
  static const List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  ];

  const MyPageViewEx({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView Example'),
      ),
      body: PageView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Container(
            color: colors[index],
            child: Center(
              child: Text(
                'Page ${index + 1}',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
