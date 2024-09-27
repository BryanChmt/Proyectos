import 'package:flutter/material.dart';

class ListCheck extends StatefulWidget {
  ListCheck({Key key}) : super(key: key);

  @override
  _ListCheckState createState() => _ListCheckState();
}

class _ListCheckState extends State<ListCheck> {
  bool minuscula = false;
  bool mayuscula = false;
  bool caracteres = false;
  bool numero = false;
  bool especial = false;
  bool coinciden = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      // color: Colors.red,
      child: Column(children: [
        Row(
          children: [
            Checkbox(
              activeColor: Colors.green,
              value: minuscula,
              onChanged: (bool value) {
                setState(() {
                  minuscula = value;
                });
              },
            ),
            Text('Un carácter en minúscula',style: TextStyle(color: Colors.white70),overflow: TextOverflow.ellipsis,)
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: mayuscula,
              activeColor: Colors.green,
              onChanged: (bool value) {
                setState(() {
                  mayuscula = value;
                });
              },
            ),
            Text('Un carácter en mayúscula',style: TextStyle(color: Colors.white70),overflow: TextOverflow.ellipsis,)
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: caracteres,
              activeColor: Colors.green,
              onChanged: (bool value) {
                setState(() {
                  caracteres = value;
                });
              },
            ),
            Text('8 caracteres como minimo',style: TextStyle(color: Colors.white70),overflow: TextOverflow.ellipsis,)
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: numero,
              activeColor: Colors.green,
              onChanged: (bool value) {
                setState(() {
                  numero = value;
                });
              },
            ),
            Text('Un número',style: TextStyle(color: Colors.white70),overflow: TextOverflow.ellipsis,)
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: especial,
              activeColor: Colors.green,
              onChanged: (bool value) {
                setState(() {
                  especial = value;
                });
              },
            ),
            Text('Un carácter especial',style: TextStyle(color: Colors.white70),overflow: TextOverflow.ellipsis,)
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: coinciden,
              activeColor: Colors.green,
              onChanged: (bool value) {
                setState(() {
                  coinciden = value;
                });
              },
            ),
            Text('Las contraseñas coinciden',style: TextStyle(color: Colors.white70),overflow: TextOverflow.ellipsis,)
          ],
        )
      ]),
    );
  }
}
