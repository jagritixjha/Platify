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

    return Scaffold(
      body: contactList.contact.isEmpty
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
              child: Consumer<ContactListProvider>(
                builder: (context, value, child) => ListView.builder(
                  itemCount: value.contact.length,
                  itemBuilder: (context, index) {
                    ContactInfo contact = value.contact[index];
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
            ),
    );
  }
}
