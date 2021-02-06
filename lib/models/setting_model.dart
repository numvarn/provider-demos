import 'package:flutter/material.dart';

class SettingModel {
  String _value = 'initial value';

  String get value => _value;

  set value(String value) {
    _value = value;
  }
}
