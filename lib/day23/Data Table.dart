import 'package:flutter/material.dart';

class DataTableEX extends StatelessWidget {
  const DataTableEX({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter DataTable Example'),
        ),
        body: DataTable(
          columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Age')),
            DataColumn(label: Text('City')),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text('John')),
              DataCell(Text('25')),
              DataCell(Text('New York')),
            ]),
            DataRow(cells: [
              DataCell(Text('Jane')),
              DataCell(Text('30')),
              DataCell(Text('San Francisco')),
            ]),
            DataRow(cells: [
              DataCell(Text('Bob')),
              DataCell(Text('22')),
              DataCell(Text('Chicago')),
            ]),
          ],
        ),
      ),
    );
  }
}
