import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter_app/ios_views/add_contacts_screen/widgets/form.dart';
import 'package:platform_converter_app/ios_views/add_contacts_screen/widgets/pickers.dart';
import 'package:platform_converter_app/ios_views/add_contacts_screen/widgets/save_button.dart';
import 'package:platform_converter_app/providers/change_time_provider.dart';
import 'package:platform_converter_app/providers/image_provider.dart';
import 'package:provider/provider.dart';

class AddContactScreen extends StatefulWidget {
  @override
  _AddContactScreenState createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  bool validation = true;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController chat = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  void _showDatePicker(BuildContext context) {
    var dtProvider = Provider.of<DateTimeProvider>(context, listen: false);
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoPopupSurface(
          isSurfacePainted: false,
          child: Container(
            height: 300,
            color: CupertinoColors.systemBackground.resolveFrom(context),
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Text(
                  'Choose the date',
                  style: CupertinoTheme.of(context).textTheme.actionTextStyle,
                ),
                Expanded(
                  child: CupertinoDatePicker(
                    initialDateTime: dtProvider.selectedDate,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime newDate) {
                      dtProvider.updateDate(newDate);
                    },
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    dtProvider.updateDate(DateTime.now());
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Done',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .actionTextStyle
                        .copyWith(color: CupertinoColors.systemBlue),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showTimePicker(BuildContext context) {
    var timeProvider = Provider.of<DateTimeProvider>(context, listen: false);
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoPopupSurface(
          isSurfacePainted: false,
          child: Container(
            height: 300,
            color: CupertinoColors.systemBackground.resolveFrom(context),
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Text(
                  'Choose the Time',
                  style: CupertinoTheme.of(context).textTheme.actionTextStyle,
                ),
                Expanded(
                  child: CupertinoTimerPicker(
                    itemExtent: 34,
                    initialTimerDuration: timeProvider.selectedTime,
                    onTimerDurationChanged: (Duration newTime) {
                      timeProvider.updateTime(newTime);
                    },
                    mode: CupertinoTimerPickerMode.hm,
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Duration initialTime = Duration(
                      hours: DateTime.now().hour,
                      minutes: DateTime.now().minute,
                    );
                    (timeProvider.selectedTime.inHours == initialTime.inHours)
                        ? timeProvider.updateTime(initialTime)
                        : null;
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Done',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .actionTextStyle
                        .copyWith(color: CupertinoColors.systemBlue),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showImagePicker(BuildContext context) async {
    var imageProvider = Provider.of<ImageFileProvider>(context, listen: false);
    final ImageSource? source = await showCupertinoModalPopup<ImageSource>(
      context: context,
      builder: (context) {
        return CupertinoPopupSurface(
          child: Container(
            height: 130,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                CupertinoButton(
                  onPressed: () =>
                      Navigator.of(context).pop(ImageSource.camera),
                  child: Row(
                    children: [
                      const Icon(CupertinoIcons.camera),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Camera',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .actionTextStyle
                            .copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                CupertinoButton(
                  onPressed: () =>
                      Navigator.of(context).pop(ImageSource.gallery),
                  child: Row(
                    children: [
                      const Icon(CupertinoIcons.photo_on_rectangle),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Gallery',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .actionTextStyle
                            .copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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

  @override
  Widget build(BuildContext context) {
    var timeProvider = Provider.of<DateTimeProvider>(context, listen: false);
    var imageProvider = Provider.of<ImageFileProvider>(context, listen: false);
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
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
                  backgroundColor: CupertinoColors.systemBlue,
                  radius: 70,
                  child: const Icon(
                    CupertinoIcons.photo_camera,
                    size: 30,
                    color: CupertinoColors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Consumer<ImageFileProvider>(
                builder: (context, value, child) {
                  return !value.isPfp
                      ? Text(
                          'select the profile pic',
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .textStyle
                              .copyWith(
                                fontSize: 12,
                                color: CupertinoColors.systemRed,
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
                icon: CupertinoIcons.calendar,
                text: value.dateSelected
                    ? '${value.selectedDate.day}-${value.selectedDate.month}-${value.selectedDate.year}'
                    : 'Pick Date',
                onPressed: () {
                  _showDatePicker(context);
                },
              ),
            ),
            Consumer<DateTimeProvider>(
              builder: (context, value, child) => Pickers(
                icon: CupertinoIcons.time,
                text: value.timeSelected
                    ? '${value.time.hourOfPeriod.toString().padLeft(2, '0')}:${value.time.minute.toString().padLeft(2, '0')}'
                    : 'Pick Time',
                onPressed: () {
                  _showTimePicker(context);
                  log('----------${validation.toString()}');
                },
              ),
            ),
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
