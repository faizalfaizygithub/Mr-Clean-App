import 'package:flutter/material.dart';

class HouseCleaningProvider extends ChangeNotifier {
  String name;
  String userDate;
  String userStartTime;
  String userEndTime;

  HouseCleaningProvider(
      {this.name = 'Full Home Deep Cleaning',
      this.userDate = '8/9/2024',
      this.userStartTime = '8:00pm',
      this.userEndTime = '10:30pm'});
  void changeUserSchedule({
    required String newUserDate,
    required String newUserStartTime,
    required String newUserEndTime,
  }) async {
    userDate = newUserDate.toString();
    userStartTime = newUserStartTime.toString();
    userEndTime = newUserEndTime.toString();
    notifyListeners();
  }
}
