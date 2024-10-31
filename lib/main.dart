import 'package:flutter/material.dart';
import 'package:flutter_click_app/provider/CountersProvider.dart';
import 'package:flutter_click_app/provider/UserProvider.dart';
import 'package:flutter_click_app/screens/About.dart';
import 'package:flutter_click_app/screens/clickapp/ClickApp.dart';
import 'package:flutter_click_app/screens/DesignDocument.dart';
import 'package:flutter_click_app/screens/Usage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CountersProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'KLiK',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'KLiK'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          bottom: const TabBar(tabs: <Widget>[
            Tab(
              icon: const Icon(Icons.info),
              text: 'About',
            ),
            Tab(
              icon: const Icon(Icons.design_services),
              text: 'Design',
            ),
            Tab(
              icon: const Icon(Icons.apps),
              text: 'KLiK',
            ),
            Tab(
              icon: const Icon(Icons.data_usage),
              text: 'Usage',
            ),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            const About(),
            const DesignDocument(),
            const ClickApp(),
            const Usage(),
          ],
        ),
      ),
    );
  }
}


