import 'package:flutter/material.dart';

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
          TextButton(
            // padding: const EdgeInsets.symmetric(horizontal: 12),
            onPressed: onPressed,
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
