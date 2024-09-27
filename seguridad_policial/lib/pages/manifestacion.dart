import 'package:flutter/material.dart';
import 'package:seguridad_policial/widgets/manifest.dart';

class ManifestPage extends StatelessWidget {
  const ManifestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: SafeArea(child: ContentManifest()),
      ),
    );
  }
}