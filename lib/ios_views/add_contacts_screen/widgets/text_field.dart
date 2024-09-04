// import 'package:flutter/cupertino.dart';
//
// class CupertinoFormField extends StatelessWidget {
//   TextEditingController? ctrVar;
//   String? placeholderText;
//   Widget? prefixIcon;
//   String? Function(String?) validator;
//
//   CupertinoFormField({
//     super.key,
//     required this.ctrVar,
//     required this.placeholderText,
//     required this.prefixIcon,
//     required this.validator,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTextFormFieldRow(
//       controller: ctrVar,
//       validator: validator,
//       decoration: BoxDecoration(
//         shape: BoxShape.rectangle,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(
//           color: CupertinoColors.systemGrey,
//         ),
//       ),
//       prefix: prefixIcon,
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//       placeholder: placeholderText,
//       placeholderStyle: CupertinoTheme.of(context)
//           .textTheme
//           .textStyle
//           .copyWith(fontSize: 16, color: CupertinoColors.systemGrey2),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';

class CupertinoFormField extends StatelessWidget {
  final TextEditingController? ctrVar;
  final String? placeholderText;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;

  const CupertinoFormField({
    Key? key,
    required this.ctrVar,
    required this.placeholderText,
    required this.prefixIcon,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextFormFieldRow(
      controller: ctrVar,
      validator: validator,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: CupertinoColors.systemGrey,
        ),
      ),
      style: CupertinoTheme.of(context)
          .textTheme
          .actionTextStyle
          .copyWith(fontSize: 14),
      prefix: prefixIcon,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      placeholder: placeholderText,
      placeholderStyle: CupertinoTheme.of(context)
          .textTheme
          .textStyle
          .copyWith(fontSize: 16, color: CupertinoColors.systemGrey2),
    );
  }
}
