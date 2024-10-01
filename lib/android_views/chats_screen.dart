import 'package:flutter/material.dart';
import 'package:platform_converter_app/providers/contact_list_provider.dart';
import 'package:platform_converter_app/utils/contact_info_modal.dart';
import 'package:provider/provider.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ContactListProvider contactList =
        Provider.of<ContactListProvider>(context, listen: false);

    return Scaffold(
      body: contactList.contact.isEmpty
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
              child: Consumer<ContactListProvider>(
                builder: (context, value, child) => ListView.builder(
                  itemCount: value.contact.length,
                  itemBuilder: (context, index) {
                    ContactInfo contact = value.contact[index];
                    TextEditingController chat =
                        TextEditingController(text: contact.chatConvo);
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      visualDensity: VisualDensity.compact,
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
                      onTap: () {
                        showBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            height: 310,
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
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    constraints: BoxConstraints.tight(
                                        const Size(double.infinity, 30)),
                                    contentPadding: EdgeInsets.zero,
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                    hintText: 'Enter chat conversation',
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 14),
                                  textAlign: TextAlign.center,
                                  controller: chat,
                                  validator: (value) {
                                    return value == null || value.isEmpty
                                        ? 'enter message'
                                        : null;
                                  },
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        contact.chatConvo = chat.text;
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.check),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        value.contact.removeAt(index);
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                          Icons.delete_outline_rounded),
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
                ),
              ),
            ),
    );
  }
}
