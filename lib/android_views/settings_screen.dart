import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_converter_app/providers/image_provider.dart';
import 'package:platform_converter_app/providers/switch_provider.dart';
import 'package:platform_converter_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController name = TextEditingController();

  TextEditingController bio = TextEditingController();

  bool validation = false;

  Future<void> _showImagePicker(BuildContext context) async {
    var imageProvider = Provider.of<ImageFileProvider>(context, listen: false);
    final ImageSource? source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) {
        return Container(
          height: 130,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          // color: CupertinoColors.systemBackground.resolveFrom(context),
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

  saveDetails() {
    log('save button');
    if (name.text.isEmpty || bio.text.isEmpty) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: Text(
              'Please fill all the details',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                  ),
            ),
            actions: [
              TextButton(
                child: Text(
                  'OK',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SwitchProvider>(
        builder: (context, sp, child) => ListView(
          children: [
            ListTile(
              leading: const Icon(
                Icons.person,
                size: 30,
              ),
              title: Text(
                'Profile',
                style: Theme.of(context).textTheme.bodyMedium!,
              ),
              subtitle: Text(
                'Update Profile Data',
                style: Theme.of(context).textTheme.bodySmall!,
              ),
              trailing: Switch(
                value: sp.profile,
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
                            builder: (context, imageProvider, child) {
                          return CircleAvatar(
                            foregroundImage: imageProvider.pfp != null
                                ? FileImage(imageProvider.pfp!)
                                : null,
                            backgroundColor: Colors.indigo,
                            radius: 70,
                            child: const Icon(
                              Icons.photo_camera,
                              size: 30,
                              color: Colors.white,
                            ),
                          );
                        }),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          constraints: BoxConstraints.tight(
                              const Size(double.infinity, 30)),
                          contentPadding: EdgeInsets.zero,
                          hintStyle:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                          hintText: 'Enter your name',
                        ),
                        style: Theme.of(context).textTheme.bodyMedium!,
                        textAlign: TextAlign.center,
                        controller: name,
                        validator: (value) {
                          return value == null || value.isEmpty
                              ? 'enter name'
                              : null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          constraints: BoxConstraints.tight(
                              const Size(double.infinity, 30)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          hintStyle:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                          hintText: 'Enter your bio',
                        ),
                        style: Theme.of(context).textTheme.bodyMedium!,
                        textAlign: TextAlign.center,
                        controller: bio,
                        validator: (value) {
                          return value == null || value.isEmpty
                              ? 'enter bio'
                              : null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        child: Text(
                          'Save',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                        ),
                        onPressed: () {
                          saveDetails();
                        },
                      ),
                    ],
                  )
                : Container(),
            const Divider(
              color: Colors.blueGrey,
              endIndent: 16,
              indent: 16,
              height: 22,
              thickness: 0,
            ),
            ListTile(
              leading: const Icon(
                Icons.brightness_4_outlined,
                size: 30,
              ),
              title: Text(
                'Theme',
                style: Theme.of(context).textTheme.bodyMedium!,
              ),
              subtitle: Text(
                'Change Theme',
                style: Theme.of(context).textTheme.bodySmall!,
              ),
              trailing: Consumer<ThemeProvider>(
                builder: (context, theme, child) {
                  return Switch(
                    value: theme.getSwitchTheme,
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
