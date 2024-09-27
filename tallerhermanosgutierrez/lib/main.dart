import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tallerhermanosgutierrez/pages/login_page.dart';
import 'package:tallerhermanosgutierrez/pages/next_page.dart';
import 'package:tallerhermanosgutierrez/pages/select_page.dart';


void main() {
  runApp(
    MyApp(),
  );
}
// https://flutterforum.co/t/flutter-web-taking-too-long-to-hot-restart-and-hot-reload/1819
// https://stackoverflow.com/questions/60893062/flutter-hot-reload-and-hot-restart-do-not-always-work
// https://github.com/flutter/flutter/issues/67194
// flutter clean & flutter pub get

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('en'),
          const Locale('es'),
        ],
        debugShowCheckedModeBanner: false,
        title: 'App formulario',
        home: SelectPage(),);
  }
}