import 'package:flutter/material.dart';

class MyDataTable extends StatelessWidget {
  const MyDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DataTable(
          columns: const [
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Age")),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text("John Smith")),
              DataCell(Text("30")),
            ]),
            // Add more rows as needed
          ],
        ),
      ),
    );
  }
}
