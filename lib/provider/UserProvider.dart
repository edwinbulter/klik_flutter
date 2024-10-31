import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String userName;

  UserProvider({
    this.userName = 'Test',
  });

  void changeUserName({
    required String newUserName,
  }) async {
    userName = newUserName;
    //notifyListeners();
  }
}
