import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmail_settimgs_page_ui/utils/light_theme.dart';
import 'package:gmail_settimgs_page_ui/view/settings_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const GmailSettingsScreen(),
    );
  }
}
