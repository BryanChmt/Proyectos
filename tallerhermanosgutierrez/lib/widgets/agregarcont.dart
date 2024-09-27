import 'package:flutter/material.dart';
class AgregarCont extends StatefulWidget {
  const AgregarCont({Key key}) : super(key: key);

  @override
  _AgregarContState createState() => _AgregarContState();
}

class _AgregarContState extends State<AgregarCont> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage('assets/porsche-frente.png'),
                  height: 200,
                  width: 250,
                ),
                const SizedBox(width: 40.0),
                Image(
                  image: AssetImage('assets/porsche-costado.png'),
                  height: 300,
                  width: 400,
                )
              ],
            ),
            Image(
              image: AssetImage('assets/porsche-atras.png'),
              height: 200,
              width: 250,
            )
          ],
        ),
      ),
    );
  }
}