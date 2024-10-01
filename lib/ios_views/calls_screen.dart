import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/providers/contact_list_provider.dart';
import 'package:platform_converter_app/utils/contact_info_modal.dart';
import 'package:provider/provider.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ContactListProvider contactList =
        Provider.of<ContactListProvider>(context, listen: false);
    return CupertinoPageScaffold(
      child: contactList.contact.isEmpty
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
              child: Consumer<ContactListProvider>(
                builder: (context, value, child) => ListView.builder(
                  itemCount: value.contact.length,
                  itemBuilder: (context, index) {
                    value.updateContact(value.contact);
                    ContactInfo contact = value.contact[index];
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
                        contact.chatConvo,
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
                      trailing: const Icon(
                        Icons.phone,
                        color: CupertinoColors.activeGreen,
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
