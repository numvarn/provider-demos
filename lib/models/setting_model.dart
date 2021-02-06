import 'package:flutter/material.dart';

class SettingModel with ChangeNotifier {
  String _setting = 'Initial Setting !!';

  String get getSetting => _setting;

  set setSetting(String setting) {
    _setting = setting;
    ChangeNotifier();
  }
}
