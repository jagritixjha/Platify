import 'package:flutter/material.dart';
import 'package:platform_converter_app/utils/contact_info_modal.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: contacts.isEmpty
          ? Center(
              child: Text(
                'No chats yet to see.',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey, fontSize: 14),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  ContactInfo contact = contacts[index];
                  return ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    title: Text(
                      contact.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      contact.chatConvo,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey, fontSize: 14),
                    ),
                    leading: CircleAvatar(
                      foregroundImage: FileImage(contact.pfp),
                      radius: 24,
                    ),
                    trailing: Text(
                      '${contact.date.day}/${contact.date.month}/${contact.date.year}, ${contact.time.inHours % 12}:${contact.time.inMinutes % 60}',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey, fontSize: 14),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
