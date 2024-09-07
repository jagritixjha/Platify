import 'package:flutter/material.dart';
import 'package:platform_converter_app/android_views/add_contacts_screen/widget/text_field.dart';

class Forms extends StatelessWidget {
  const Forms({
    Key? key,
    required this.formKey,
    required this.name,
    required this.phoneNumber,
    required this.chat,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController name;
  final TextEditingController phoneNumber;
  final TextEditingController chat;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            placeholderText: 'Full Name',
            prefixIcon: const Icon(Icons.person),
            validator: (value) {
              return value == null || value.isEmpty ? 'enter name' : null;
            },
            ctrVar: name,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            placeholderText: 'Phone Number',
            prefixIcon: const Icon(Icons.phone),
            validator: (value) {
              return value == null || value.isEmpty
                  ? 'enter phone number'
                  : null;
            },
            ctrVar: phoneNumber,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextFormField(
            placeholderText: 'Chat Conversation',
            prefixIcon: const Icon(Icons.chat_outlined),
            validator: (value) {
              return value == null || value.isEmpty
                  ? 'enter chat conversation'
                  : null;
            },
            ctrVar: chat,
          ),
        ],
      ),
    );
  }
}
