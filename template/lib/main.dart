import 'package:flutter/material.dart';
import 'package:template/pages/Menu.dart';
import 'package:template/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuPage(),
      debugShowCheckedModeBanner: false,
      title: 'Rancho de Oki',
      // initialRoute: 'Menu',
      routes: getApplicationRoutes(),
    );
  }
}
