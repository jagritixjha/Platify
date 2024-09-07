import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platform_converter_app/utils/contact_info_modal.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          'Save',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16,
                color: Colors.white,
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
            validation = pfp != null ? true : false;
            log(validation.toString());
            log('not validated');
          }
        },
      ),
    );
  }
}
