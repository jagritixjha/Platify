import 'package:flutter/foundation.dart';

class SwitchProvider extends ChangeNotifier {
  bool _switchProfile = false;
  bool _switchUI = false;

  bool get profile => _switchProfile;
  bool get ui => _switchUI;

  void switchProfile() {
    _switchProfile = !_switchProfile;
    notifyListeners();
  }

  void switchUI() {
    _switchUI = !_switchUI;
    notifyListeners();
  }
}
