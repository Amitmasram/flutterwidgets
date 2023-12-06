import 'package:flutter/material.dart';

class DataCellEx extends StatelessWidget {
  const DataCellEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DataTable Example'),
        ),
        body: MyTable(),
      ),
    );
  }
}

class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
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
          DataCell(Text('Alice')),
          DataCell(Text('30')),
          DataCell(Text('London')),
        ]),
        DataRow(cells: [
          DataCell(Text('Bob')),
          DataCell(Text('28')),
          DataCell(Text('Paris')),
        ]),
      ],
    );
  }
}
