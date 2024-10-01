import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DateTimeProvider extends ChangeNotifier {
  Duration _selectedTime =
      Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute);
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  bool _dateSelected = false;
  bool _timeSelected = false;

  Duration get selectedTime => _selectedTime;
  DateTime get selectedDate => _selectedDate;
  TimeOfDay get time => _timeOfDay;
  bool get dateSelected => _dateSelected;
  bool get timeSelected => _timeSelected;

  void updateDate(DateTime newDate) {
    _selectedDate = newDate;
    _dateSelected = true;
    notifyListeners();
  }

  void changeState() {
    _dateSelected = !_dateSelected;
    _timeSelected = !_timeSelected;
  }

  void updateTime(Duration newTime) {
    _selectedTime = newTime;
    _timeSelected = true;
    notifyListeners();
  }

  void updateTimeAndroid(TimeOfDay time) {
    _timeOfDay = time;
    _timeSelected = true;
    notifyListeners();
  }
}
