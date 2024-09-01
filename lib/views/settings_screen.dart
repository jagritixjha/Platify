import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter_app/views/provides/image_provider.dart';
import 'package:platform_converter_app/views/provides/switch_provider.dart';
import 'package:platform_converter_app/views/provides/theme_provider.dart';
import 'package:platform_converter_app/views/utils/common_widgets/sized_box.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController bio = TextEditingController();
  bool validation = false;

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
                      sizedBoxx(
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
                      sizedBoxx(
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

  // void saveDetails(){
  //   if(name == null && bio == null){
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    log(name.toString());
    return CupertinoPageScaffold(
      child: Consumer<SwitchProvider>(
        builder: (context, sp, child) => Column(
          children: [
            const SizedBox(height: 26),
            CupertinoListTile(
              leading: const Icon(
                CupertinoIcons.person,
                size: 30,
              ),
              title: Text(
                'Profile',
                style: CupertinoTheme.of(context).textTheme.actionTextStyle,
              ),
              subtitle: Text(
                'Update Profile Data',
                style: CupertinoTheme.of(context).textTheme.textStyle,
              ),
              trailing: CupertinoSwitch(
                value: sp.profile,
                applyTheme: false,
                onChanged: (value) {
                  sp.switchProfile();
                },
              ),
            ),
            sp.profile
                ? Column(
                    children: [
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          _showImagePicker(context);
                        },
                        child: Consumer<ImageFileProvider>(
                          builder: (context, imageProvider, child) =>
                              CircleAvatar(
                            foregroundImage: imageProvider.pfp != null
                                ? FileImage(imageProvider.pfp!)
                                : null,
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
                      CupertinoTextFormFieldRow(
                        padding: EdgeInsets.zero,
                        decoration: const BoxDecoration(border: Border()),
                        controller: name,
                        placeholder: 'Enter your name',
                        textAlign: TextAlign.center,
                        placeholderStyle: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(
                              fontSize: 16,
                              color: CupertinoColors.systemGrey2,
                            ),
                        validator: (value) {
                          return value == null || value.isEmpty
                              ? 'enter name'
                              : null;
                        },
                      ),
                      CupertinoTextFormFieldRow(
                        padding: EdgeInsets.zero,
                        decoration: const BoxDecoration(border: Border()),
                        controller: bio,
                        placeholder: 'Enter your bio',
                        textAlign: TextAlign.center,
                        placeholderStyle: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(
                              fontSize: 16,
                              color: CupertinoColors.systemGrey2,
                            ),
                        validator: (value) {
                          return value == null || value.isEmpty
                              ? 'enter bio'
                              : null;
                        },
                      ),
                    ],
                  )
                : Container(),
            const Divider(
              color: CupertinoColors.systemGrey5,
              endIndent: 16,
              indent: 16,
              height: 22,
              thickness: 0,
            ),
            CupertinoListTile(
              leading: const Icon(
                CupertinoIcons.brightness,
                size: 30,
              ),
              title: Text(
                'Theme',
                style: CupertinoTheme.of(context).textTheme.actionTextStyle,
              ),
              subtitle: Text(
                'Change Theme',
                style: CupertinoTheme.of(context).textTheme.textStyle,
              ),
              trailing: Consumer<ThemeProvider>(
                builder: (context, theme, child) {
                  return CupertinoSwitch(
                    value: theme.getSwitchTheme,
                    applyTheme: false,
                    onChanged: (value) {
                      theme.switchTheme();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
