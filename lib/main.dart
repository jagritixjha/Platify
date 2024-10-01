import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/android_views/home_screen.dart';
import 'package:platform_converter_app/providers/change_time_provider.dart';
import 'package:platform_converter_app/providers/contact_list_provider.dart';
import 'package:platform_converter_app/providers/image_provider.dart';
import 'package:platform_converter_app/providers/switch_provider.dart';
import 'package:platform_converter_app/providers/theme_provider.dart';
import 'package:platform_converter_app/utils/themes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ios_views/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool isDark = pref.getBool('isDark') ?? false;

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SwitchProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(isDark: isDark),
          ),
          ChangeNotifierProvider(
            create: (context) => DateTimeProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ImageFileProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ContactListProvider(),
          )
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context, listen: false);
    var ui = Provider.of<SwitchProvider>(context, listen: false);
    return Consumer<ThemeProvider>(
      builder: (context, pro, child) {
        return ui.ui
            ? MaterialApp(
                locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                theme: theme.getAndroidTheme,
                home: AndroidHomeScreen(),
              )
            : CupertinoApp(
                theme: theme.getTheme,
                debugShowCheckedModeBanner: false,
                title: 'Platform Converter',
                home: const HomeScreen(),
              );
      },
    );
  }
}
