import 'package:flutter/material.dart';
import 'package:seguridad_policial/widgets/content_informe.dart';

class InformePage extends StatelessWidget {
  const InformePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
           scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: SafeArea(child: ContentInforme()),
        ),
      ),
    );
  }
}