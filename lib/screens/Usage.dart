import 'package:flutter/material.dart';
import 'package:flutter_click_app/api/counterApi.dart';

import '../model/Counter.dart';

class Usage extends StatelessWidget {
  const Usage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const UsageTable();
  }
}

class UsageTable extends StatefulWidget {
  const UsageTable({super.key});


  @override
  State<UsageTable> createState() => _UsageTableState();
}

class _UsageTableState extends State<UsageTable> {

  late Future<List<Counter>> futureCounters;

  @override
  void initState() {
    super.initState();
    futureCounters = fetchAllUserCounters();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Counter>>(
        future: futureCounters,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return UsageDataTable(snapshot.data==null ? [] : snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('$snapshot.error');
          }
          return const CircularProgressIndicator();
        }
      )
    );

  }

  Widget UsageDataTable(List<Counter> dataList) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'User',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Clicks',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Last Click',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: dataList.map(
          (data) => DataRow(cells: [
            DataCell(
              Text(data.userId),
            ),
            DataCell(
              Text(data.clickCount.toString()),
            ),
            DataCell(
                Text(data.updatedAt as String)
            ),
          ])).toList(),
    );

  }

}