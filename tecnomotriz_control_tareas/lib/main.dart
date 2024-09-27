import 'package:flutter/material.dart';
import 'package:tecnomotriz_control_tareas/screens/login/login_page.dart';
import 'package:tecnomotriz_control_tareas/screens/pages/vehiculo_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tecnomotriz Control Ingreso',
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
        routes: {
        // '/': (BuildContext context) => MainPage(),
      'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
      },
      home: HomePage(),
    );
  }
}
