import 'package:flutter/material.dart';

class CountersProvider extends ChangeNotifier {
  int userCounter;
  int totalCounter;

  CountersProvider({
    this.userCounter = 0,
    this.totalCounter = 0
  });

  void changeUserCounter({
    required int newUserCounter,
  }) async {
    userCounter = newUserCounter;
    notifyListeners();
  }

  void changeTotalCounter({
    required int newTotalCounter,
  }) async {
    totalCounter = newTotalCounter;
    notifyListeners();
  }
}
