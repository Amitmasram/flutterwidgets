// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';



// class MyDateTimePicker extends StatefulWidget {
//   const MyDateTimePicker({super.key});

//   @override
//   _MyDateTimePickerState createState() => _MyDateTimePickerState();
// }

// class _MyDateTimePickerState extends State<MyDateTimePicker> {
//   TextEditingController _controller = TextEditingController();
//   DateTime _selectedDateTime;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DateTimeField Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             DateTimeField(
//               controller: _controller,
//               format: DateFormat("yyyy-MM-dd HH:mm"),
//               decoration: InputDecoration(
//                 labelText: 'Select Date and Time',
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   _selectedDateTime = value;
//                 });
//               },
//               onShowPicker: (context, currentValue) {
//                 return showDatePicker(
//                   context: context,
//                   initialDate: currentValue ?? DateTime.now(),
//                   firstDate: DateTime(2000),
//                   lastDate: DateTime(2101),
//                 ).then((date) {
//                   if (date != null) {
//                     return showTimePicker(
//                       context: context,
//                       initialTime: TimeOfDay.fromDateTime(
//                         currentValue ?? DateTime.now(),
//                       ),
//                     );
//                   } else {
//                     return null;
//                   }
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             Text(
//               _selectedDateTime != null
//                   ? 'Selected Date and Time: ${DateFormat("yyyy-MM-dd HH:mm").format(_selectedDateTime)}'
//                   : 'No date and time selected',
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
