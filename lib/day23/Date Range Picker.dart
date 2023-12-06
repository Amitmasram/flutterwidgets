import 'package:flutter/material.dart';

class MyDateRangePickerEx extends StatefulWidget {
  const MyDateRangePickerEx({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyDateRangePickerExState createState() => _MyDateRangePickerExState();
}

class _MyDateRangePickerExState extends State<MyDateRangePickerEx> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(const Duration(days: 7));

  Future<void> _selectDateRange(BuildContext context) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      initialDateRange: DateTimeRange(
        start: _startDate,
        end: _endDate,
      ),
    );

    if (picked != null) {
      setState(() {
        // ignore:package:flutterwidgets/day23/Date%20Range%20Picker.dart
        _startDate = picked.start ?? _startDate;
        _endDate = picked.end ?? _endDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Range Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Selected Date Range:'),
            Text('Start: $_startDate'),
            Text('End: $_endDate'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDateRange(context),
              child: const Text('Select Date Range'),
            ),
          ],
        ),
      ),
    );
  }
}
