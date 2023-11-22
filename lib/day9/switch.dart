import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Switch is: $isSwitched', style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }
}


// class StyledSwitchWidget extends StatefulWidget {
//   @override
//   _StyledSwitchWidgetState createState() => _StyledSwitchWidgetState();
// }

// class _StyledSwitchWidgetState extends State<StyledSwitchWidget> {
//   bool isSwitched = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Text('Switch is: $isSwitched', style: const TextStyle(fontSize: 20)),
//         const SizedBox(height: 20),
//         Switch(
//           value: isSwitched,
//           onChanged: (value) {
//             setState(() {
//               isSwitched = value;
//             });
//           },
//           activeTrackColor: Colors.lightBlueAccent,
//           activeColor: Colors.blue,
//           inactiveThumbColor: Colors.redAccent,
//           inactiveTrackColor: Colors.red,
//           // Customize the appearance of the thumb (circle).
//           thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
//           // Customize the appearance of the track.
//           trackShape: const RectangularSliderTrackShape(),
//           // Customize the size of the track.
//           trackHeight: 4.0,
//         ),
//       ],
//     );
//   }
// }
