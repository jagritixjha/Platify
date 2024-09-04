import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/utils/contact_info_modal.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: contacts.isEmpty
          ? Center(
              child: Text(
                'No calls yet to see.',
                style: CupertinoTheme.of(context)
                    .textTheme
                    .textStyle
                    .copyWith(color: CupertinoColors.systemGrey, fontSize: 14),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  ContactInfo contact = contacts[index];
                  return CupertinoListTile(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    title: Text(
                      contact.name,
                      style:
                          CupertinoTheme.of(context).textTheme.actionTextStyle,
                    ),
                    subtitle: Text(
                      contact.chatConvo,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(
                              color: CupertinoColors.systemGrey, fontSize: 14),
                    ),
                    leading: CircleAvatar(
                      foregroundImage: FileImage(contact.pfp),
                      radius: 90,
                    ),
                    leadingSize: 50,
                    trailing: const Icon(
                      Icons.phone,
                      color: CupertinoColors.activeGreen,
                    ),
                  );
                },
              ),
            ),
    );
  }
}
