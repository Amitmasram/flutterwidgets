import 'package:flutter/material.dart';

class DataRowEx extends StatelessWidget {
  const DataRowEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DataTable Example'),
        ),
        body: const MyDataTable(),
      ),
    );
  }
}

class MyDataTable extends StatelessWidget {
  const MyDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Age')),
        DataColumn(label: Text('City')),
      ],
      rows: const [
        DataRow(
          cells: [
            DataCell(Text('John')),
            DataCell(Text('25')),
            DataCell(Text('New York')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Alice')),
            DataCell(Text('30')),
            DataCell(Text('San Francisco')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Bob')),
            DataCell(Text('22')),
            DataCell(Text('Los Angeles')),
          ],
        ),
      ],
    );
  }
}
