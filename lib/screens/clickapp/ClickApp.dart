import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import '../../amplifyconfiguration.dart';
import 'HelloWidget.dart';
import 'KlikButtonWidget.dart';
import 'KlikCountsWidget.dart';

void main() {
  runApp(const ClickApp());
}

class ClickApp extends StatefulWidget {
  const ClickApp({Key? key}) : super(key: key);

  @override
  State<ClickApp> createState() => _ClickAppState();
}

class _ClickAppState extends State<ClickApp> {
  @override
  void initState() {
    super.initState();
    Amplify.isConfigured ? null : _configureAmplify();
  }

  void _configureAmplify() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
      print('Successfully configured');
    } on Exception catch (e) {
      print('Error configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
          builder: Authenticator.builder(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    HelloWidget(),
                    KlikButtonWidget(),
                    KlikCountsWidget(),
                    SignOutButton(),
                  ]),
            ),
          )),
    );
  }
}





