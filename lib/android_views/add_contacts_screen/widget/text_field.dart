import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? ctrVar;
  final String? placeholderText;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    Key? key,
    required this.ctrVar,
    required this.placeholderText,
    required this.prefixIcon,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrVar,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.6,
            color: Colors.indigo.shade700,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.6,
            color: Colors.indigo.shade700,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        prefixIcon: prefixIcon,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        labelText: placeholderText,
        labelStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontSize: 14, color: Colors.grey.shade500),
      ),
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
    );
  }
}
