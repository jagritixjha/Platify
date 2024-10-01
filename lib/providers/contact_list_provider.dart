import 'package:flutter/foundation.dart';
import 'package:platform_converter_app/utils/contact_info_modal.dart';

class ContactListProvider extends ChangeNotifier {
  List<ContactInfo>? _contacts = contacts;
  List<ContactInfo> get contact => _contacts!;

  void updateContact(List<ContactInfo>? contacts) {
    _contacts = contacts;
    notifyListeners();
  }
}
