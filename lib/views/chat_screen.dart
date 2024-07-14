import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/views/utils/contact_info_modal.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: contacts.isEmpty
          ? Center(
              child: Text(
                'No chats yet to see.',
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
                    trailing: Text(
                      '${contact.date.day}/${contact.date.month}/${contact.date.year}, ${contact.time.inHours % 12}:${contact.time.inMinutes % 60}',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(
                              color: CupertinoColors.systemGrey, fontSize: 14),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
