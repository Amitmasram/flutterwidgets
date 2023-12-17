import 'package:flutter/material.dart';

// class SlideTransitionEx extends StatelessWidget {
//   const SlideTransitionEx({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Slide Transition Example'),
//         ),
//         body: const Center(
//           child: SlideTransitionWidget(),
//         ),
//       ),
//     );
//   }
// }

// class SlideTransitionWidget extends StatefulWidget {
//   const SlideTransitionWidget({super.key});

//   @override
//   _SlideTransitionWidgetState createState() => _SlideTransitionWidgetState();
// }

// class _SlideTransitionWidgetState extends State<SlideTransitionWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _offsetAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );

//     _offsetAnimation = Tween<Offset>(
//       begin: const Offset(0.0, 1.0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     ));

//     // Start the animation
//     _controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SlideTransition(
//       position: _offsetAnimation,
//       child: Container(
//         width: 200.0,
//         height: 200.0,
//         color: Colors.blue,
//         child: const Center(
//           child: Text(
//             'Slide Transition',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

// ///////////////////

// class SlideTransitionEx2 extends StatelessWidget {
//   const SlideTransitionEx2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Horizontal Slide Transition Example'),
//         ),
//         body: const Center(
//           child: SlideTransitionWidget(),
//         ),
//       ),
//     );
//   }
// }

// class SlideTransitionWidgetx extends StatefulWidget {
//   const SlideTransitionWidgetx({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _SlideTransitionWidgetState createState() => _SlideTransitionWidgetState();
// }

// // ignore: unused_element
// class _SlideTransitionWidgetStatex extends State<SlideTransitionWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _offsetAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );

//     _offsetAnimation = Tween<Offset>(
//       begin: const Offset(-1.0, 0.0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     ));

//     // Start the animation
//     _controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SlideTransition(
//       position: _offsetAnimation,
//       child: Container(
//         width: 200.0,
//         height: 200.0,
//         color: Colors.green,
//         child: const Center(
//           child: Text(
//             'Horizontal Slide Transition',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

/////////////////////////////////

class SlideTransitionEx3 extends StatelessWidget {
  const SlideTransitionEx3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Complex Slide Transition Example'),
        ),
        body: const Center(
          child: SlideTransitionWidget(),
        ),
      ),
    );
  }
}

class SlideTransitionWidget extends StatefulWidget {
  const SlideTransitionWidget({super.key});

  @override
  _SlideTransitionWidgetState createState() => _SlideTransitionWidgetState();
}

class _SlideTransitionWidgetState extends State<SlideTransitionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _topOffsetAnimation;
  late Animation<Offset> _bottomOffsetAnimation;
  late Animation<Offset> _leftOffsetAnimation;
  late Animation<Offset> _rightOffsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _topOffsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _bottomOffsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _leftOffsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _rightOffsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideTransition(
          position: _topOffsetAnimation,
          child: _buildBox(Colors.blue),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _leftOffsetAnimation,
              child: _buildBox(Colors.green),
            ),
            const SizedBox(width: 20),
            SlideTransition(
              position: _rightOffsetAnimation,
              child: _buildBox(Colors.orange),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SlideTransition(
          position: _bottomOffsetAnimation,
          child: _buildBox(Colors.red),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_controller.status == AnimationStatus.completed) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: const Text('Toggle Animation'),
        ),
      ],
    );
  }

  Widget _buildBox(Color color) {
    return Container(
      width: 100.0,
      height: 100.0,
      color: color,
      child: const Center(
        child: Text(
          'Box',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

////////////////////////////

class SlideTransitionEx4 extends StatelessWidget {
  const SlideTransitionEx4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Complex Slide Transition Example'),
        ),
        body: const Center(
          child: SlideTransitionWidgetz(),
        ),
      ),
    );
  }
}

class SlideTransitionWidgetz extends StatefulWidget {
  const SlideTransitionWidgetz({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SlideTransitionWidgetStatez createState() => _SlideTransitionWidgetStatez();
}

class _SlideTransitionWidgetStatez extends State<SlideTransitionWidgetz>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> _offsetAnimations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _offsetAnimations = List.generate(
      4,
      (index) => Tween<Offset>(
        begin: const Offset(-1.0, 0.0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.2,
            (index + 1) * 0.2,
            curve: Curves.easeInOut,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StaggeredAnimationBuilder(
          controller: _controller,
          duration: const Duration(milliseconds: 800),
          builder: (context, animation) {
            return SlideTransition(
              position: _offsetAnimations[0],
              child: _buildBox(Colors.blue, animation),
            );
          },
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StaggeredAnimationBuilder(
              controller: _controller,
              duration: const Duration(milliseconds: 800),
              builder: (context, animation) {
                return SlideTransition(
                  position: _offsetAnimations[1],
                  child: _buildBox(Colors.green, animation),
                );
              },
            ),
            const SizedBox(width: 20),
            StaggeredAnimationBuilder(
              controller: _controller,
              duration: const Duration(milliseconds: 800),
              builder: (context, animation) {
                return SlideTransition(
                  position: _offsetAnimations[2],
                  child: _buildBox(Colors.orange, animation),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        StaggeredAnimationBuilder(
          controller: _controller,
          duration: const Duration(milliseconds: 800),
          builder: (context, animation) {
            return SlideTransition(
              position: _offsetAnimations[3],
              child: _buildBox(Colors.red, animation),
            );
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_controller.status == AnimationStatus.completed) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: const Text('Toggle Animation'),
        ),
      ],
    );
  }

  Widget _buildBox(Color color, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        width: 100.0,
        height: 100.0,
        color: color,
        child: const Center(
          child: Text(
            'Box',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class StaggeredAnimationBuilder extends StatelessWidget {
  final AnimationController controller;
  final Duration duration;
  final Widget Function(BuildContext, Animation<double>) builder;

  StaggeredAnimationBuilder({
    super.key,
    required this.controller,
    required this.duration,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return builder(context, controller.view);
      },
    );
  }
}

//////////////////////////////

class SlideTransitionEx5 extends StatelessWidget {
  const SlideTransitionEx5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Complex Slide Transition Example'),
        ),
        body: const Center(
          child: SlideTransitionWidgetf(),
        ),
      ),
    );
  }
}

class SlideTransitionWidgetf extends StatefulWidget {
  const SlideTransitionWidgetf({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SlideTransitionWidgetStatef createState() => _SlideTransitionWidgetStatef();
}

class _SlideTransitionWidgetStatef extends State<SlideTransitionWidgetf>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * 3.14159, // 360 degrees in radians
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideTransition(
          position: _offsetAnimation,
          child: RotationTransition(
            turns: _rotationAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: _buildBox(Colors.blue),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_controller.status == AnimationStatus.completed) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: const Text('Toggle Animation'),
        ),
      ],
    );
  }

  Widget _buildBox(Color color) {
    return Container(
      width: 150.0,
      height: 150.0,
      color: color,
      child: const Center(
        child: Text(
          'Box',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

///////////////////////////////////////////

class SlideTransitionEx6 extends StatelessWidget {
  const SlideTransitionEx6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Complex Slide Transition Example'),
        ),
        body: const Center(
          child: SlideTransitionWidgetc(),
        ),
      ),
    );
  }
}

class SlideTransitionWidgetc extends StatefulWidget {
  const SlideTransitionWidgetc({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SlideTransitionWidgetStatec createState() => _SlideTransitionWidgetStatec();
}

class _SlideTransitionWidgetStatec extends State<SlideTransitionWidgetc>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation1;
  late Animation<Offset> _offsetAnimation2;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _offsetAnimation1 = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _offsetAnimation2 = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideTransition(
          position: _offsetAnimation1,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: _buildBox(Colors.blue),
          ),
        ),
        const SizedBox(height: 20),
        SlideTransition(
          position: _offsetAnimation2,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: _buildBox(Colors.green),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_controller.status == AnimationStatus.completed) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: const Text('Toggle Animation'),
        ),
      ],
    );
  }

  Widget _buildBox(Color color) {
    return Container(
      width: 150.0,
      height: 150.0,
      color: color,
      child: const Center(
        child: Text(
          'Box',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
