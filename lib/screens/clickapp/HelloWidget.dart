import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_click_app/api/counterApi.dart';
import 'package:provider/provider.dart';

import '../../model/CurrentCounters.dart';
import '../../provider/UserProvider.dart';

class HelloWidget extends StatefulWidget {
  const HelloWidget({Key? key}) : super(key: key);

  @override
  State<HelloWidget> createState() => _HelloWidgetState();
}

class _HelloWidgetState extends State<HelloWidget> {
  late Future<String> futureUserName;

  @override
  void initState() {
    super.initState();
    futureUserName = getUserName();
  }

  Future<String> getUserName() async {
    try {
      final user = await Amplify.Auth.getCurrentUser();
      return user.username;
    } on AuthException catch (e) {
      safePrint('Error retrieving auth session: ${e.message}');
    }
    return 'unknown';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: futureUserName,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String userName = snapshot.data == null ? 'unknown' : snapshot.data!;
            setUserNameGlobally(context, userName);
            setCurrentCountersGlobally(context, userName);
            return Text(
                'Hello ${makeFirstLetterUppercase(userName)}!',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.green
                ));

          } else if (snapshot.hasError) {
            return Text('$snapshot.error');
          }
          return const CircularProgressIndicator();
        });
  }

  void setUserNameGlobally(BuildContext context, String userName) {
    context.read<UserProvider>().changeUserName(newUserName: userName);
  }

  Future<void> setCurrentCountersGlobally(BuildContext context, String userName) async {
    Future<CurrentCounters> currentCounters = fetchCurrentUserCounters(context);
    context.read<UserProvider>().changeUserName(newUserName: userName);
  }


  String makeFirstLetterUppercase(String str) {
    return '${str[0].toUpperCase()}${str.substring(1)}';
  }
}