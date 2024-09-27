import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:seguridad_policial/pages/descripcion_hechos.dart';
import 'package:seguridad_policial/pages/informe_page.dart';
import 'package:seguridad_policial/pages/login_page.dart';
import 'package:seguridad_policial/pages/manifestacion.dart';
import 'package:seguridad_policial/widgets/content_informe.dart';



void main() {
  runApp(
    MyApp(),
  );
}

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
        home: InformePage(),);
  }
  
}
