
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class AppPref{

  late Future _isPreferenceInstanceReady;
  late SharedPreferences _preferences;

  static final AppPref _instance = AppPref._internal();

  factory AppPref() => _instance;

  AppPref._internal() {
  _isPreferenceInstanceReady = SharedPreferences.getInstance().then((preferences) => _preferences = preferences);
  }

  Future get isPreferenceReady => _isPreferenceInstanceReady;

  String? get userLogin => _preferences.getString('userLogin');

  String? get introScr => _preferences.getString('intro');

  set userLoginData(String value) => _preferences.setString('userLogin', value);

  set introScrData(String value) => _preferences.setString('intro',value) ;

  removeUser()=> _preferences.remove('userLogin');

}