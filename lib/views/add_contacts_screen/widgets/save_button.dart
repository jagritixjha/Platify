import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/views/utils/contact_info_modal.dart';

class SaveButton extends StatelessWidget {
  SaveButton(
      {super.key,
      required GlobalKey<FormState> formKey,
      required this.name,
      required this.phoneNumber,
      required this.chat,
      required DateTime selectedDate,
      required Duration selectedTime,
      required this.pfp,
      required this.validation,
      required})
      : _formKey = formKey,
        _selectedDate = selectedDate,
        _selectedTime = selectedTime;

  final GlobalKey<FormState> _formKey;
  final TextEditingController name;
  final TextEditingController phoneNumber;
  final TextEditingController chat;
  final DateTime _selectedDate;
  final Duration _selectedTime;

  final File? pfp;
  bool validation;
// bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 100),
      child: CupertinoButton.filled(
        borderRadius: BorderRadius.circular(50),
        child: Text(
          'Save',
          style: CupertinoTheme.of(context).textTheme.actionTextStyle.copyWith(
                fontSize: 16,
              ),
        ),
        onPressed: () {
          // isVisible = true;
          if (_formKey.currentState!.validate() &&
              (validation = pfp != null ? true : false)) {
            _formKey.currentState!.save();
            contacts.add(
              ContactInfo(
                name: name.value.text,
                phoneNumber: phoneNumber.value.text,
                chatConvo: chat.value.text,
                date: _selectedDate,
                time: _selectedTime,
                pfp: pfp!,
              ),
            );
            _formKey.currentState!.reset();

            for (var i in contacts) {
              log(i.name);
              log(i.phoneNumber);
              log(i.chatConvo);
              log('${i.time.inHours}:${i.time.inMinutes % 60}');
              log('${i.date.day}/${i.date.month}/${i.date.year}');
            }
          } else {
            log('not validated');
          }
        },
      ),
    );
  }
}
