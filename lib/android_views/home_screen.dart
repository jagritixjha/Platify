import 'package:flutter/material.dart';
import 'package:platform_converter_app/android_views/add_contacts_screen/add_contacts_screen.dart';
import 'package:platform_converter_app/android_views/calls_screen.dart';
import 'package:platform_converter_app/android_views/chats_screen.dart';
import 'package:platform_converter_app/android_views/settings_screen.dart';
import 'package:platform_converter_app/main.dart';
import 'package:platform_converter_app/providers/switch_provider.dart';
import 'package:provider/provider.dart';

class AndroidHomeScreen extends StatelessWidget {
  AndroidHomeScreen({super.key});
  int index = 0;

  final List<Widget> _screens = [
    AddToContact(),
    ChatsScreen(),
    CallsScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    var su = Provider.of<SwitchProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Platform Converter',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          Consumer<SwitchProvider>(
            builder: (context, pro, child) {
              return Switch(
                value: su.ui,
                onChanged: (value) {
                  pro.switchUI();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ));
                },
              );
            },
          ),
        ],
      ),
      body: Consumer<SwitchProvider>(
        builder: (context, value, child) => _screens[value.index],
      ),
      bottomNavigationBar: Consumer<SwitchProvider>(
        builder: (context, pro, child) => BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              // color: Colors.black87,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              inherit: true),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.person_add_alt_1_outlined), label: 'ADD'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'CHATS'),
            BottomNavigationBarItem(
                icon: Icon(Icons.phone_rounded), label: 'CALLS'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'SETTINGS'),
          ],
          onTap: (value) {
            pro.switchTab(value);
          },
          currentIndex: pro.index,
        ),
      ),
    );
  }
}
