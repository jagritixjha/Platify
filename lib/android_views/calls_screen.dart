import 'package:flutter/material.dart';
import 'package:platform_converter_app/utils/contact_info_modal.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: contacts.isEmpty
          ? Center(
              child: Text(
                'No calls yet to see.',
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
                    title: Text(
                      contact.name,
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                    subtitle: Text(
                      contact.chatConvo,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey, fontSize: 14),
                    ),
                    visualDensity: VisualDensity.compact,
                    leading: CircleAvatar(
                      foregroundImage: FileImage(contact.pfp),
                      radius: 24,
                    ),
                    trailing: const Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                  );
                },
              ),
            ),
    );
  }
}
