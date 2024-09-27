import 'package:flutter/material.dart';

import 'Widgets/soon.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
              image: AssetImage('assets/completa.jpg'),
              fit: BoxFit.cover,
            ))),
            Container(
              child: Pantalla(),
            )
          ],
        ),
      ),
    );
  }
}
