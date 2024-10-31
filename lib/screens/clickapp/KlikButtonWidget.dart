import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/counterApi.dart';
import '../../model/CurrentCounters.dart';
import '../../provider/CountersProvider.dart';

class KlikButtonWidget extends StatefulWidget {
  const KlikButtonWidget({Key? key}) : super(key: key);

  @override
  State<KlikButtonWidget> createState() => _KlikButtonWidgetState();

}

class _KlikButtonWidgetState extends State<KlikButtonWidget> {

  late Future<CurrentCounters> futureCurrentCounters;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () async {
      CurrentCounters currentCounters = await fetchCurrentUserCounters(context);
      setState(() {
        context
            .read<CountersProvider>()
            .changeUserCounter(newUserCounter: currentCounters.userCounter);
        context
            .read<CountersProvider>()
            .changeTotalCounter(newTotalCounter: currentCounters.totalCounter);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      ElevatedButton(
        onPressed: () async {
          CurrentCounters counters = await incrementCounter(context);
          context.read<CountersProvider>().changeUserCounter(
              newUserCounter: counters.userCounter);
          context.read<CountersProvider>().changeTotalCounter(
              newTotalCounter: counters.totalCounter);
        },
        child: Text('KLiK'),
      );
  }
}

