import 'package:flutter/material.dart';
import 'package:ingeclima/pages/facturacion.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,  
        title: 'App formulario',
        home:  Facturacion(),);
  }
}