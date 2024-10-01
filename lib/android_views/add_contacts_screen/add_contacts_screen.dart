import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter_app/android_views/add_contacts_screen/widget/form.dart';
import 'package:platform_converter_app/android_views/add_contacts_screen/widget/pickers.dart';
import 'package:platform_converter_app/android_views/add_contacts_screen/widget/save_button.dart';
import 'package:platform_converter_app/providers/change_time_provider.dart';
import 'package:platform_converter_app/providers/image_provider.dart';
import 'package:provider/provider.dart';

class AddToContact extends StatelessWidget {
  AddToContact({super.key});
  bool validation = false;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController chat = TextEditingController();

  void _showDatePicker(BuildContext context) async {
    var dtProvider = Provider.of<DateTimeProvider>(context, listen: false);
    final DateTime? pickedDate = await showDialog<DateTime>(
      context: context,
      builder: (context) => DatePickerDialog(
        initialDate: dtProvider.selectedDate,
        firstDate: DateTime(2023),
        lastDate: DateTime(2025),
        currentDate: DateTime.now(),
        initialCalendarMode: DatePickerMode.day,
      ),
    );
    if (pickedDate != null) {
      dtProvider.updateDate(pickedDate!);
    }
  }

  void _showTimePicker(BuildContext context) async {
    var timeProvider = Provider.of<DateTimeProvider>(context, listen: false);
    final time = await showTimePicker(
      context: context,
      initialTime: timeProvider.time,
    );
    if (time != null) {
      timeProvider.updateTimeAndroid(time);
    }
  }

  Future<void> _showImagePicker(BuildContext context) async {
    var imageProvider = Provider.of<ImageFileProvider>(context, listen: false);
    final ImageSource? source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) {
        return Container(
          height: 130,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(ImageSource.camera),
                child: Row(
                  children: [
                    const Icon(Icons.camera),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Camera',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(ImageSource.gallery),
                child: Row(
                  children: [
                    const Icon(Icons.image_outlined),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Gallery',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
    if (source != null) {
      ImagePicker image = ImagePicker();
      XFile? file = await image.pickImage(source: source);
      if (file != null) {
        imageProvider.updatePfp(File(file.path));
      }
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var timeProvider = Provider.of<DateTimeProvider>(context, listen: false);
    var imageProvider = Provider.of<ImageFileProvider>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                _showImagePicker(context);
              },
              child: Consumer<ImageFileProvider>(
                builder: (context, value, child) => CircleAvatar(
                  foregroundImage:
                      value.pfp != null ? FileImage(value.pfp!) : null,
                  backgroundColor: Colors.indigo,
                  radius: 70,
                  child: const Icon(
                    Icons.photo_camera,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Consumer<ImageFileProvider>(
                builder: (context, value, child) {
                  return !value.isPfp
                      ? Text(
                          'select the profile pic',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 12,
                                    color: Colors.red.shade900,
                                  ),
                        )
                      : Container();
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Forms(
              formKey: _formKey,
              name: name,
              phoneNumber: phoneNumber,
              chat: chat,
            ),
            Consumer<DateTimeProvider>(
              builder: (context, value, child) => Pickers(
                icon: Icons.calendar_month,
                text: value.dateSelected
                    ? '${value.selectedDate.day}-${value.selectedDate.month}-${value.selectedDate.year}'
                    : 'Pick Date',
                onPressed: () {
                  _showDatePicker(context);
                },
              ),
            ),
            Consumer<DateTimeProvider>(builder: (context, value, child) {
              return Pickers(
                icon: Icons.timelapse_sharp,
                text: value.timeSelected
                    ? '${value.time.hourOfPeriod.toString().padLeft(2, '0')}:${value.time.minute.toString().padLeft(2, '0')}'
                    : 'Pick Time',
                onPressed: () {
                  log('---------${validation.toString()}');

                  _showTimePicker(context);
                },
              );
            }),
            const SizedBox(height: 20),
            SaveButton(
              formKey: _formKey,
              name: name,
              phoneNumber: phoneNumber,
              chat: chat,
              selectedDate: timeProvider.selectedDate,
              selectedTime: timeProvider.selectedTime,
              pfp: imageProvider,
            ),
          ],
        ),
      ),
    );
  }
}
