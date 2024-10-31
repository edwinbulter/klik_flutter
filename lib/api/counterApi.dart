import 'dart:convert';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_click_app/model/CurrentCounters.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../model/Counter.dart';
import '../provider/UserProvider.dart';

const BASE_URL = "<BASE_URL>>";

Future<List<Counter>> fetchAllUserCounters() async {
  final response = await http.get(Uri.parse('${BASE_URL}/getAllCounters'));
  if (response.statusCode == 200) {
    List<dynamic> list = jsonDecode(response.body);
    return list.map((dynamic counter) => Counter.fromJson(counter)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load List of Counters');
  }
}

Future<CurrentCounters> incrementCounter(BuildContext context) async {
  String userName = context.read<UserProvider>().userName;
  String accessToken = await getAccessToken();
  final response = await http.post(
      Uri.parse('${BASE_URL}'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': accessToken,},
    body: jsonEncode(<String, String>{
      'user_id': userName,
    })
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    return CurrentCounters.fromJson(json);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load List of Counters for user ${userName}');
  }
}

Future<CurrentCounters> fetchCurrentUserCounters(BuildContext context) async {
  String userName = context.read<UserProvider>().userName;
  String accessToken = await getAccessToken();
  final response = await http.post(
      Uri.parse('${BASE_URL}/getCounter'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': accessToken,},
      body: jsonEncode(<String, String>{
        'user_id': userName,
      })
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(response.body);
    return CurrentCounters.fromJson(json);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to get counter for user ${userName}');
  }
}


Future<String> getAccessToken() async {
  try {
    final cognitoPlugin = await Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
    final result = await cognitoPlugin.fetchAuthSession();
    return result.userPoolTokensResult.value.accessToken.raw;
  } on AuthException catch (e) {
    safePrint('Error retrieving auth session: ${e.message}');
    return '';
  }
}