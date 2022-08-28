import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_with_getx/home_page.dart';
import 'package:theme_with_getx/theme_controller.dart';

void main() {
  Get.lazyPut<ThemeController>(() => ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromPreferences();
    return GetMaterialApp(
      title: 'Theme change using Get',
      theme: ThemeData.light().copyWith(primaryColor: Colors.green),
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.purple),
      themeMode: ThemeController.to.themeMode ?? ThemeMode.system,
      home: const HomePage(),
    );
  }
}
