import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/ios_views/add_contacts_screen/add_contacts_screen.dart';
import 'package:platform_converter_app/ios_views/calls_screen.dart';
import 'package:platform_converter_app/ios_views/chat_screen.dart';
import 'package:platform_converter_app/ios_views/settings_screen.dart';
import 'package:platform_converter_app/providers/switch_provider.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var su = Provider.of<SwitchProvider>(context, listen: false);

    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Platform Converter',
          style: CupertinoTheme.of(context).textTheme.actionTextStyle,
        ),
        trailing: Consumer<SwitchProvider>(
          builder: (context, pro, child) {
            return CupertinoSwitch(
              applyTheme: false,
              value: su.ui,
              onChanged: (value) {
                su.switchUI();
              },
            );
          },
        ),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_add),
            label: 'ADD',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: 'CHATS',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: 'CALLS',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'SETTINGS',
          ),
        ]),
        tabBuilder: (context, index) {
          return CupertinoTabView(builder: (context) {
            switch (index) {
              case 0:
                return AddContactScreen();
              case 1:
                return const ChatsScreen();
              case 2:
                return const CallsScreen();
              case 3:
                return SettingsScreen();
              default:
                return const CupertinoPageScaffold(
                  child: Text(
                    'Platform Converter',
                  ),
                );
            }
          });
        },
      ),
    );
  }
}
/*

 PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


            ],
          ),
        ),
  */
