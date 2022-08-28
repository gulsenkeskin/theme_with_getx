import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_with_getx/theme_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ThemeMode? _themeMode;

  @override
  Widget build(BuildContext context) {
    _themeMode = ThemeController.to.themeMode;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          customText(
              text:
              'System Brightness: ${Get.mediaQuery.platformBrightness.toString()}'),
          sizedBoxH24(),
          customText(
              text: 'Theme Brightness: ${Get.theme.brightness.toString()}'),
          sizedBoxH24(),
          customText(
            text: 'ThemeMode',
          ),
          customRadioListTile(text: 'system', themeMode: ThemeMode.system),
          customRadioListTile(text: 'dark', themeMode: ThemeMode.dark),
          customRadioListTile(text: 'light', themeMode: ThemeMode.light),
        ],
      ),
    );
  }

  Text customText({required String text, TextAlign? textAlign}) {
    return Text(
      text,
      style: customTextStyle(),
      textAlign: textAlign,
    );
  }

  SizedBox sizedBoxH24() => const SizedBox(height: 24);
  TextStyle customTextStyle() => const TextStyle(fontSize: 20);
  RadioListTile<ThemeMode> customRadioListTile(
      {required String text, required ThemeMode themeMode}) {
    return RadioListTile(
      title: Text(text),
      value: themeMode,
      groupValue: _themeMode,
      onChanged: (value) {
        setState(() {
          _themeMode = value as ThemeMode;
          ThemeController.to.setThemeMode(_themeMode!);
        });
      },
    );
  }
}
