import 'package:flutter/material.dart';
import 'package:flutter_click_app/api/counterApi.dart';
import 'package:flutter_click_app/model/CurrentCounters.dart';
import 'package:flutter_click_app/provider/CountersProvider.dart';
import 'package:provider/provider.dart';

class KlikCountsWidget extends StatefulWidget {
  const KlikCountsWidget({super.key});

  @override
  State<KlikCountsWidget> createState() => _KlikCountsWidget();
}

class _KlikCountsWidget extends State<KlikCountsWidget> {
  late Future<CurrentCounters> futureCurrentCounters;

  @override
  void initState() {
    super.initState();
    futureCurrentCounters = fetchCurrentUserCounters(context);
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(8.0),
                height: 50,
                color: Colors.green,
                child: FittedBox(
                  child: Text(
                    'Your KLiK count',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )),
            Container(
                padding: const EdgeInsets.all(8.0),
                height: 50,
                color: Colors.white,
                child: FittedBox(
                  child: Text(
                    '${context.watch<CountersProvider>().userCounter}',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                )),
          ],
        ),
        TableRow(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(8.0),
                height: 50,
                color: Colors.purple,
                child: FittedBox(
                  child: Text(
                    'Total KLiK count',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )),
            Container(
                padding: const EdgeInsets.all(8.0),
                height: 50,
                color: Colors.white,
                child: FittedBox(
                  child: Text(
                    '${context.watch<CountersProvider>().totalCounter}',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
