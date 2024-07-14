import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/views/utils/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late bool _switchTheme;
  late CupertinoThemeData _currentTheme;

  CupertinoThemeData get getTheme => _currentTheme;
  bool get getSwitchTheme => _switchTheme;

  ThemeProvider({required bool isDark}) {
    _currentTheme = isDark ? Themes.darkTheme : Themes.lightTheme;
    _switchTheme = isDark ? true : false;
  }

  Future<void> switchTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    _switchTheme = !_switchTheme;

    if (_currentTheme == Themes.lightTheme) {
      _currentTheme = Themes.darkTheme;
      pref.setBool('isDark', true);
    } else {
      _currentTheme = Themes.lightTheme;
      pref.setBool('isDark', false);
    }
    notifyListeners();
  }
}
