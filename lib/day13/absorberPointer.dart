import 'package:flutter/material.dart';

class AbsorberPointerEx extends StatelessWidget {
  const AbsorberPointerEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AbsorbPointer Example'),
        ),
        body: Center(
          child: AbsorbPointer(
            absorbing:
                true, // try changing this to false and see the difference
            child: GestureDetector(
              onTap: () {
                print('Container tapped!');
              },
              child: Container(
                color: Colors.blue,
                width: 200,
                height: 200,
                child: const Center(
                  child: Text(
                    'Click me!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

////////////////////
class AbsorberPointerCoolEx extends StatelessWidget {
  const AbsorberPointerCoolEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Interactive AbsorbPointer'),
        ),
        body: Center(
          child: AbsorbPointer(
            absorbing: false,
            ignoringSemantics: false,
            child: GestureDetector(
              onTap: () {
                print('Container tapped!');
              },
              child: TweenAnimationBuilder(
                tween: ColorTween(begin: Colors.blue, end: Colors.green),
                duration: const Duration(milliseconds: 500),
                builder: (context, color, child) {
                  return Container(
                    color: color,
                    width: 200,
                    height: 200,
                    child: const Center(
                      child: Text(
                        'Tap me!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
