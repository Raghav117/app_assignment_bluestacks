import 'package:app_assignment_bluestacks/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'translations/message_translation.dart';

void main() {
  runApp(GetMaterialApp(
    translations: Messages(), // your translations
    locale: const Locale(
        'en', 'US'), // translations will be displayed in that locale
    fallbackLocale: const Locale('ja', 'JP'),
    debugShowCheckedModeBanner: false,
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginScreeen();
  }
}
