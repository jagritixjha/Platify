import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/utils/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late bool _switchTheme;
  late CupertinoThemeData _currentTheme;
  late ThemeData _currentAndroidTheme;

  CupertinoThemeData get getTheme => _currentTheme;
  ThemeData get getAndroidTheme => _currentAndroidTheme;

  bool get getSwitchTheme => _switchTheme;

  ThemeProvider({required bool isDark}) {
    _currentTheme = isDark ? Themes.darkTheme : Themes.lightTheme;
    _currentAndroidTheme =
        isDark ? Themes.androidDarkTheme : Themes.androidLightTheme;
    _switchTheme = isDark ? true : false;
  }

  Future<void> switchTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    _switchTheme = !_switchTheme;

    if (_currentTheme == Themes.lightTheme ||
        _currentTheme == Themes.androidLightTheme) {
      _currentTheme = Themes.darkTheme;
      _currentAndroidTheme = Themes.androidDarkTheme;
      pref.setBool('isDark', true);
    } else {
      _currentTheme = Themes.lightTheme;
      _currentAndroidTheme = Themes.androidLightTheme;
      pref.setBool('isDark', false);
    }
    notifyListeners();
  }
}
