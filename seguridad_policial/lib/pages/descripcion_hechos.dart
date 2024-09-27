import 'package:flutter/material.dart';
import 'package:seguridad_policial/widgets/hechos_content.dart';

class HechosPage extends StatelessWidget {
  const HechosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: SafeArea(child: ContentHechos()),
      ),
    );
  }
}