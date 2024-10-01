import 'dart:io';
import 'dart:developer';
import 'package:flutter/foundation.dart';

class ImageFileProvider extends ChangeNotifier {
  File? _pfp;
  bool _isPfp = true;

  File? get pfp => _pfp;
  bool get isPfp => _isPfp;

  void updatePfp(File? file) {
    _pfp = file;
    _isPfp = true;
    notifyListeners();
  }

  void valPfp() {
    _isPfp = false;
    notifyListeners();
  }
}
