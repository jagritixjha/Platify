import 'dart:io';

class ContactInfo {
  String name = '', phoneNumber = '', chatConvo = '';
  DateTime date = DateTime.now();
  Duration time = Duration();
  File pfp = File('');

  ContactInfo({
    required this.name,
    required this.phoneNumber,
    required this.chatConvo,
    required this.date,
    required this.time,
    required this.pfp,
  });
}

List<ContactInfo> contacts = [];
