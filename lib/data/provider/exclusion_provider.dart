import 'package:flutter/material.dart';

class ExclusionProvider extends ChangeNotifier {
  String exclusions = '< No Outdoors cleaning & washing.\n'
      '<  No other Activities.\n'
      '<  Do not misBehave to our staffs.\n'
      '<  Payment Should be No Negosible.\n'
      '<  Not Allowed any person in side of home.';

  void exclusionadd() {
    exclusions.toString();
    ChangeNotifier();
  }
}
