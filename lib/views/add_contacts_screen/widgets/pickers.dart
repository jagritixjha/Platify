import 'package:flutter/cupertino.dart';

class Pickers extends StatelessWidget {
  String text = '';
  IconData? icon;
  void Function()? onPressed;

  Pickers({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Row(
        children: [
          Icon(icon),
          CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            onPressed: onPressed,
            child: Text(
              text!,
              style: CupertinoTheme.of(context)
                  .textTheme
                  .actionTextStyle
                  .copyWith(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
