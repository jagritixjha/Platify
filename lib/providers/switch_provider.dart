import 'package:flutter/foundation.dart';

class SwitchProvider extends ChangeNotifier {
  bool _switchProfile = false;
  bool _switchUI = false;
  int _index = 0;

  bool get profile => _switchProfile;
  bool get ui => _switchUI;
  int get index => _index;

  void switchProfile() {
    _switchProfile = !_switchProfile;
    notifyListeners();
  }

  void switchUI() {
    _switchUI = !_switchUI;
    notifyListeners();
  }

  void switchTab(int index) {
    _index = index;
    notifyListeners();
  }
}
