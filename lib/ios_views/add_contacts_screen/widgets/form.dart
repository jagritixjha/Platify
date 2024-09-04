// import 'package:flutter/cupertino.dart';
// import 'package:platform_converter_app/views/add_contacts_screen/widgets/text_field.dart';
//
// class Forms extends StatelessWidget {
//   const Forms({
//     super.key,
//     required GlobalKey<FormState> formKey,
//     required this.name,
//     required this.phoneNumber,
//     required this.chat,
//   }) : _formKey = formKey;
//
//   final GlobalKey<FormState> _formKey;
//   final TextEditingController name;
//   final TextEditingController phoneNumber;
//   final TextEditingController chat;
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           CupertinoFormField(
//             placeholderText: 'Full Name',
//             prefixIcon: const Icon(CupertinoIcons.person),
//             validator: (value) {
//               return value == null || value.isEmpty ? 'enter name' : null;
//             },
//             ctrVar: name,
//           ),
//           CupertinoFormField(
//             placeholderText: 'Phone Number',
//             prefixIcon: const Icon(CupertinoIcons.phone),
//             validator: (value) {
//               return value == null || value.isEmpty
//                   ? 'enter phone number'
//                   : null;
//             },
//             ctrVar: phoneNumber,
//           ),
//           CupertinoFormField(
//             placeholderText: 'Chat Conversation',
//             prefixIcon: const Icon(CupertinoIcons.chat_bubble_text),
//             validator: (value) {
//               return value == null || value.isEmpty
//                   ? 'enter chat conversation'
//                   : null;
//             },
//             ctrVar: chat,
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/views/add_contacts_screen/widgets/text_field.dart';

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
          CupertinoFormField(
            placeholderText: 'Full Name',
            prefixIcon: const Icon(CupertinoIcons.person),
            validator: (value) {
              return value == null || value.isEmpty ? 'enter name' : null;
            },
            ctrVar: name,
          ),
          CupertinoFormField(
            placeholderText: 'Phone Number',
            prefixIcon: const Icon(CupertinoIcons.phone),
            validator: (value) {
              return value == null || value.isEmpty
                  ? 'enter phone number'
                  : null;
            },
            ctrVar: phoneNumber,
          ),
          CupertinoFormField(
            placeholderText: 'Chat Conversation',
            prefixIcon: const Icon(CupertinoIcons.chat_bubble_text),
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