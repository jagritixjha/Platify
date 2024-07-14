import 'package:flutter/foundation.dart';

class DateTimeProvider extends ChangeNotifier {
  Duration _selectedTime =
      Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute);
  DateTime _selectedDate = DateTime.now();
  bool _dateSelected = false;
  bool _timeSelected = false;

  Duration get selectedTime => _selectedTime;
  DateTime get selectedDate => _selectedDate;
  bool get dateSelected => _dateSelected;
  bool get timeSelected => _timeSelected;

  void updateDate(DateTime newDate) {
    _selectedDate = newDate;
    _dateSelected = true;
    notifyListeners();
  }

  void updateTime(Duration newTime) {
    _selectedTime = newTime;
    _timeSelected = true;
    notifyListeners();
  }
}
