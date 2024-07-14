import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/views/home_screen.dart';
import 'package:platform_converter_app/views/provides/change_time_provider.dart';
import 'package:platform_converter_app/views/provides/image_provider.dart';
import 'package:platform_converter_app/views/provides/switch_provider.dart';
import 'package:platform_converter_app/views/provides/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool isDark = pref.getBool('isDark') ?? false;

  runApp(
    MultiProvider(
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
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context, listen: false);
    return Consumer<ThemeProvider>(
      builder: (context, pro, child) {
        return CupertinoApp(
          theme: theme.getTheme,
          debugShowCheckedModeBanner: false,
          title: 'Platform Converter',
          home: HomeScreen(),
        );
      },
    );
  }
}
