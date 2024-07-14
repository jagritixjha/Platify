import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/views/provides/switch_provider.dart';
import 'package:platform_converter_app/views/provides/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var sp = Provider.of<SwitchProvider>(context, listen: false);
    var toggleTheme = Provider.of<ThemeProvider>(context, listen: false);

    return CupertinoPageScaffold(
      child: Column(
        children: [
          const SizedBox(
            height: 26,
          ),
          CupertinoListTile(
            leading: const Icon(
              CupertinoIcons.person,
              size: 30,
            ),
            title: Text(
              'Profile',
              style: CupertinoTheme.of(context).textTheme.actionTextStyle,
            ),
            subtitle: Text(
              'Update Profile Data',
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(),
            ),
            trailing: Consumer<SwitchProvider>(
              builder: (context, pro, child) {
                return CupertinoSwitch(
                  value: sp.profile,
                  applyTheme: false,
                  onChanged: (value) {
                    sp.switchProfile();
                  },
                );
              },
            ),
          ),
          const Divider(
            color: CupertinoColors.systemGrey5,
            endIndent: 16,
            indent: 16,
            height: 22,
            thickness: 0,
          ),
          CupertinoListTile(
            leading: const Icon(
              CupertinoIcons.brightness,
              size: 30,
            ),
            title: Text(
              'Theme',
              style: CupertinoTheme.of(context).textTheme.actionTextStyle,
            ),
            subtitle: Text(
              'Change Theme',
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(),
            ),
            trailing: Consumer<SwitchProvider>(
              builder: (context, pro, value) {
                return Consumer(
                  builder: (context, pro, child) => CupertinoSwitch(
                    value: toggleTheme.getSwitchTheme,
                    applyTheme: false,
                    onChanged: (value) {
                      toggleTheme.switchTheme();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
