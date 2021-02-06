import 'package:flutter/material.dart';

class SettingModel extends ChangeNotifier {
  String _value = 'initial value';

  String get value => _value;

  set value(String value) {
    _value = value;
    notifyListeners();
  }
}
