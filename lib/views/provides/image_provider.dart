import 'dart:io';

import 'package:flutter/foundation.dart';

class ImageFileProvider extends ChangeNotifier {
  File? _pfp;

  File? get pfp => _pfp;

  void updatePfp(File file) {
    _pfp = file;
    notifyListeners();
  }
}
