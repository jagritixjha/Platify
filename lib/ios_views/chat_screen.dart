import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/providers/contact_list_provider.dart';
import 'package:platform_converter_app/utils/contact_info_modal.dart';
import 'package:provider/provider.dart';

class ChatsScreen extends StatelessWidget {
  ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ContactListProvider contactList =
        Provider.of<ContactListProvider>(context, listen: false);

    return CupertinoPageScaffold(
      child: contactList.contact.isEmpty
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
              child: Consumer<ContactListProvider>(
                builder: (context, value, child) => ListView.builder(
                  itemCount: value.contact.length,
                  itemBuilder: (context, index) {
                    ContactInfo contact = value.contact[index];
                    TextEditingController chat =
                        TextEditingController(text: contact.chatConvo);
                    return CupertinoListTile(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      title: Text(
                        contact.name,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .actionTextStyle,
                      ),
                      subtitle: Text(
                        chat.text,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(
                                color: CupertinoColors.systemGrey,
                                fontSize: 14),
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
                                color: CupertinoColors.systemGrey,
                                fontSize: 14),
                      ),
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return CupertinoPopupSurface(
                              isSurfacePainted: false,
                              child: Container(
                                height: 310,
                                color: CupertinoColors.systemBackground
                                    .resolveFrom(context),
                                padding: const EdgeInsets.only(top: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    CircleAvatar(
                                      foregroundImage: FileImage(contact.pfp),
                                      radius: 50,
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      contact.name,
                                      style: CupertinoTheme.of(context)
                                          .textTheme
                                          .actionTextStyle,
                                    ),
                                    CupertinoTextFormFieldRow(
                                      padding: EdgeInsets.zero,
                                      decoration:
                                          const BoxDecoration(border: Border()),
                                      controller: chat,
                                      style: CupertinoTheme.of(context)
                                          .textTheme
                                          .actionTextStyle
                                          .copyWith(fontSize: 14),
                                      placeholder: 'Enter message',
                                      textAlign: TextAlign.center,
                                      placeholderStyle:
                                          CupertinoTheme.of(context)
                                              .textTheme
                                              .textStyle
                                              .copyWith(
                                                fontSize: 12,
                                                color:
                                                    CupertinoColors.systemGrey,
                                              ),
                                      validator: (value) {
                                        return value == null || value.isEmpty
                                            ? 'enter name'
                                            : null;
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CupertinoButton(
                                          onPressed: () {
                                            contact.chatConvo = chat.text;
                                            Navigator.pop(context);
                                          },
                                          child: const Icon(
                                              CupertinoIcons.checkmark_alt),
                                        ),
                                        CupertinoButton(
                                          onPressed: () {
                                            contacts.removeAt(index);
                                            Navigator.pop(context);
                                          },
                                          child: const Icon(
                                              CupertinoIcons.delete_simple),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
    );
  }
}
